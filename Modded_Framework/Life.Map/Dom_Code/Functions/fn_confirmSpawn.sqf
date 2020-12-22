/*
	File: fn_spawnConfirm.sqf
	Author: Dom
	Description: Spawns player at selected location
*/

private _display = findDisplay 1049;
private _listbox = _display displayCtrl 1500;
private _index = lbCurSel _listbox;
private _position = parseSimpleArray (_listbox lbData _index);
player setVehiclePosition [_position,[],0];

closeDialog 0;
[DT_spawnCamera] spawn DT_fnc_introCamera;