/*
	File: fn_playerTags.sqf
	Author: Dom
	Description: Displays DBid and name if known
*/

private _units = nearestObjects[(visiblePosition player),["CAManBase"],6];
_units = _units - [player];
private _masks = [];

{
	if (isPlayer _x && {!(_x getVariable ["dead",false])} && {!(lineIntersects[eyePos player,eyePos _x,player,_x])}) then {
		private _pos = visiblePosition _x;
		_pos set [2,(_x modelToWorld [0,0,0] select 2) + 2];

		private _DBid = _x getVariable ["DBid",-1];
		private _text = ["",_x] call DT_fnc_findName;

		_text = if ((headgear _x) in _masks || {(goggles _x) in _masks} || {_text isEqualTo ""}) then {
			format["%1",_DBid];
		} else {
			format["%1 - %2",_DBid,_text];
		};

		private _icon = "";
		if !(player getVariable ["TFAR",true]) then {_icon = "\Dom_Client\Textures\connection.paa"};
		drawIcon3D [_icon, [0,0,0,1], _pos, 1.5, 1.5, 0, _text, 1, 0.04, "PuristaBold", "center"];
	};
} forEach _units;