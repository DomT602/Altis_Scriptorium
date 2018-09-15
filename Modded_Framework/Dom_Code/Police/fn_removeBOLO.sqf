/*
	File: fn_removeBOLO.sqf
	Author: Dom
	Description: Removes selected BOLO
*/
params [
	["_vehicle",false,[false]]
];

if (player getVariable ["cop_rank",0] < 4) exitWith {};

if (_vehicle) then {
	private _listBox = (findDisplay -1) displayCtrl -1;
	private _index = lnbCurSelRow _box;
	police_veh_bolos deleteAt _index;
	publicVariable police_veh_bolos;
	_listBox lnbDeleteRow _index;
} else {
	
};

