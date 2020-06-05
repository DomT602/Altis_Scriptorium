/*
	File: fn_updateGovData.sqf
	Author: Dom
	Description: Updates the chosen government information
*/
params [
	["_option","",[""]],
	["_data",[],[[]]]
];

if (_option isEqualTo "taxes") then {
	[format["updateGovTax:%1",_data],1] call MySQL_fnc_DBasync;
	gov_taxArray = _data;
	publicVariable "gov_taxArray";
};
