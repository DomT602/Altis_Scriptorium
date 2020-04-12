/*
	File: fn_initCameraMenu.sqf
	Author: Dom
	Description: Starts the camera menu
*/
if (client_cameras isEqualTo []) exitWith {["You have no cameras to view.","orange"] call DT_fnc_notify};
createDialog "DT_cameraMenu";
private _display = findDisplay -1;
private _cameraList = _display displayCtrl 1500;

{
	_cameraList lbAdd format["Camera %1",_forEachIndex];
	_cameraList lbSetData [_forEachIndex,str(_x)];
} forEach client_cameras;

_cameraList lbSetCurSel 0;