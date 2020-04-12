/*
	File: fn_search.sqf
	Author: Dom
	Description: Searches accordingly
*/
params [
	["_person",true,[true]]
];

private _search = ctrlText 1400;
if (_person) then {
	[1,_search] remoteExecCall ["DB_fnc_fetchData",2];
} else {
	if (count _search > 8) exitWith {["License plates cannot be this long.","red"] call DT_fnc_notify}; 
	private _vehicle = objNull;

	{	//or getPlateNumber _x;
		if ((_x getVariable ["plate",""]) == _search) exitWith {
			_vehicle = _x;
		};
	} forEach (allMissionObjects "Car" + allMissionObjects "Air" + allMissionObjects "Ship");

	private _display = findDisplay 1020;
	if !(isNull _vehicle) then {
		private _owner = (_vehicle getVariable ["keyHolders",[]]) param [0,"Unknown",[""]];
		private _vehModel = typeOf _vehicle;
		private _vehName = getText(configFile >> "CfgVehicles" >> _vehModel >> "displayName");
		(getArray(missionConfigFile >> "Textures" >> "Vehicle" >> _vehModel >> "textures")) select (_vehicle getVariable ["customisation",[0]] select 0) params ["_colour"];

		private _BOLO = PD_vehBOLOs findIf {_search isEqualTo (_x select 0)};
		(_display displayCtrl 1101) ctrlSetStructuredText parseText _vehName;
		(_display displayCtrl 1102) ctrlSetStructuredText parseText _colour;
		(_display displayCtrl 1100) ctrlSetStructuredText parseText _owner;
		if (_BOLO != -1) then {
			_search = format["%1 - ACTIVE BOLO",_search];
		};
		(_display displayCtrl 1103) ctrlSetStructuredText parseText _search;
	} else {
		(_display displayCtrl 1101) ctrlSetStructuredText parseText "ERROR - VEHICLE NOT FOUND";
		(_display displayCtrl 1102) ctrlSetStructuredText parseText "ERROR - VEHICLE NOT FOUND";
		(_display displayCtrl 1103) ctrlSetStructuredText parseText "ERROR - VEHICLE NOT FOUND";
		(_display displayCtrl 1100) ctrlSetStructuredText parseText "ERROR - VEHICLE NOT FOUND";
	};
};