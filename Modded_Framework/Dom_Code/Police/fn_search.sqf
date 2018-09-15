/*
	File: fn_search.sqf
	Author: Dom
	Description: Searches accordingly
*/
params [
	["_person",true,[true]]
];


if (_person) then {
	private _search = ctrlText -1;
	[4,_search] remoteExecCall ["DB_fnc_fetchData",2];
} else {
	private _search = ctrlText -1;
	if (count _search > 10) exitWith {["License plates cannot be this long.","red"] call DT_fnc_notify}; 
	private _vehicle = objNull;

	{	//or getPlateNumber _x;
		if ((_x getVariable ["plate",-1]) isEqualTo _search) exitWith {
			_vehicle = _x;
		};
	} forEach (allMissionObjects "Car" + allMissionObjects "Air" + allMissionObjects "Ship");

	if !(isNull _vehicle) then {
		(_vehicle getVariable ["key_holders",[]]) params ["_owner","Unknown",[""]];
		private _vehModel = typeOf _vehicle;
		private _vehName = getText(configFile >> "CfgVehicles" >> _vehModel >> "displayName");
		(getArray(missionConfigFile >> "Textures" >> "Vehicle" >> _vehModel >> "textures")) select (_vehicle getVariable ["veh_colour",0]) params ["_colour"];

		private _BOLO = police_veh_bolos findIf {_plate isEqualTo (_x param [0,-1])}; //veh bolos format: [{plate,model,colour,extra info}];
		private _pc = uiNamespace getVariable "PD_PC";
		(_pc displayCtrl -1) ctrlSetStructuredText _vehName;
		(_pc displayCtrl -1) ctrlSetStructuredText _colour;
		(_pc displayCtrl -1) ctrlSetStructuredText _owner;
		if !(_BOLO isEqualTo -1) then {
			ctrlShow [-1,false]; //bolo text
			ctrlShow [-1,false]; //button
		};
	} else {
		createDialog "none_found";
	};
};