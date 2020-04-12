/*
	File: fn_cameraLBchange.sqf
	Author: Dom
	Description: Selects the newly chosen camera
*/
params [
	["_control",controlNull,[controlNull]],
	["_index",-1,[0]]
];
if (_index isEqualTo -1) exitWith {};

(parseSimpleArray (_control lbData _index)) params [["_cameraObj",objNull,[objNull]],"_camera"];
if (isNull _cameraObj) exitWith {
	["This camera was destroyed.","red"] call DT_fnc_notify;
	_control lbDelete _index;
	_control lbSetCurSel 0;
};
_camera cameraEffect ["internal","back"];