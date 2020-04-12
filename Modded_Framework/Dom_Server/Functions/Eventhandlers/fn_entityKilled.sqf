/*
	File: fn_entityKilled.sqf
	Author: Dom
	Description: Called when an entity is killed (for removing vehicles from DB currently)
*/
params [
	["_unit",objNull,[objNull]]
];

if (_unit isKindOf 'Car' || {_unit isKindOf 'Air'} || {_unit isKindOf 'Ship'}) then {
	[_unit getVariable ["plate",""]] call DB_fnc_soldVehicle;
	[
		{
			//if (random(10) > 8) then {
			//	[getPosATL _this,"small"] call DT_fnc_createFire;
			//};
			deleteVehicle _this;
		},
		_unit,
		60
	] call CBA_fnc_waitAndExecute;
};