/*
    File: fn_handleMouse.sqf
    Author: Karel Moricky - Edited by Dom
    Description: Handles mouse input
*/

params [
    ["_type",""],
    ["_arguments",[]]
];

_arguments params ["_ctrl","_mX","_mY"];

client_cameraSettings params ["_dis","_dirH","_dirV","_targetPos"];
client_mouseButtons params ["_LMB","_RMB"];

private _fnc_relPos = {
	params ["_pos", "_dist", "_dir"];

	(_pos getPos [_dist, _dir] select [0, 2]) + ([[],[_pos select 2]] select (count _pos > 2));	
};

if !(_LMB isEqualTo []) then {
    _LMB params ["_cX","_cY"];
    private _dX = (_cX - _mX);
    private _dY = (_cY - _mY);
    client_mouseButtons set [0,[_mX,_mY]];

    private _centerBox = boundingboxreal client_preview;
    private _centerSizeBottom = _centerBox select 0 select 2;
    private _centerSizeUp = _centerBox select 1 select 2;
    private _centerSize = sqrt ([_centerBox select 0 select 0,_centerBox select 0 select 1] distance [_centerBox select 1 select 0,_centerBox select 1 select 1]);
    _targetPos = [_targetPos,_dX * _centerSize,_dirH - 90] call _fnc_relPos;
    _targetPos = [
        [0,0,((_targetPos select 2) - _dY * _centerSize) max _centerSizeBottom min _centerSizeUp],
        ([0,0,0] distance2D _targetPos) min _centerSize,
        [0,0,0] getDir _targetPos
    ] call _fnc_relPos;
    //_targetPos set [2,(_targetPos select 2) max 0.1];
    _targetPos set [2,(_targetPos select 2) max ((boundingboxreal client_preview select 0 select 2) + 0.2)];

    //--- Do not let target go below ground
    private _posZmin = 0.1;
    _targetWorldPosZ = (client_preview modeltoworldvisual _targetPos) select 2;
    if (_targetWorldPosZ < _posZmin) then {_targetPos set [2,(_targetPos select 2) - _targetWorldPosZ + _posZmin];};

    client_cameraSettings set [3,_targetPos];
};

if !(_RMB isEqualTo []) then {
    _RMB params ["_cX","_cY"];
    private _dX = (_cX - _mX) * 0.75;
    private _dY = (_cY - _mY) * 0.75;
    _targetPos = [
        [0,0,_targetPos select 2],
        [0,0,0] distance2D _targetPos,
        ([0,0,0] getDir _targetPos) - _dX * 360
    ] call _fnc_relPos;

    client_cameraSettings set [1,(_dirH - _dX * 180) % 360];
    client_cameraSettings set [2,(_dirV - _dY * 100) max -89 min 89];
    client_cameraSettings set [3,_targetPos];
    client_mouseButtons set [1,[_mX,_mY]];
};

//--- Terminate when unit is dead
if (player getVariable ["dead",false]) then {
    closeDialog 0;
};