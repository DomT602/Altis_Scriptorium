/*
	File: fn_addToPC.sqf
	Author: Dom
	Description: Inserts selected info into police computer
*/
params [
	["_type",0,[0]],
	["_mode",-1,[0]]
];

switch _type do {
	case 0: {
		private _name = ctrlText -1;
		if (_name isEqualTo "") exitWith {["You didn't enter a name.","orange"] call DT_fnc_notify};
		private _crimes = ctrlText -1;
		if (_crimes isEqualTo "") exitWith {["You didn't enter any crimes.","orange"] call DT_fnc_notify};
		private _time = ctrlText -1;
		if !([_time,0] call DT_fnc_checkNumber) exitWith {};
		_time = parseNumber _time;
		private _bail = ctrlText -1;
		if !([_bail] call DT_fnc_checkNumber) exitWith {};
		_bail = parseNumber _bail;

		[_name,_crimes,profileName,_time,_bail] remoteExecCall ["DB_fnc_insertArrest",2];
	};
	case 1: {
		private _name = ctrlText -1;
		if (_name isEqualTo "") exitWith {["You didn't enter a name.","orange"] call DT_fnc_notify};
		private _crimes = ctrlText -1;
		if (_crimes isEqualTo "") exitWith {["You didn't enter any crimes.","orange"] call DT_fnc_notify};
		private _cost = ctrlText -1;
		if !([_cost] call DT_fnc_checkNumber) exitWith {};
		_cost = parseNumber _cost;

		[_name,_crimes,profileName,_cost] remoteExecCall ["DB_fnc_insertTicket",2];
	};
	case 2: {
		private _name = ctrlText -1;
		if (_name isEqualTo "") exitWith {["You didn't enter a name.","orange"] call DT_fnc_notify};
		private _crimes = ctrlText -1;
		if (_crimes isEqualTo "") exitWith {["You didn't enter any crimes.","orange"] call DT_fnc_notify};
		private _notes = ctrlText -1;

		[_name,_crimes,profileName,_notes,_mode] remoteExecCall ["DB_fnc_insertWarrant",2];
	};
	case 3: {
		if (_mode isEqualTo 0) then {
			private _plate = ctrlText -1;
			private _model = ctrlText -1;
			private _colour = ctrlText -1;
			private _notes = ctrlText -1;
			private _toAdd = [_plate,_model,_colour,_notes];

			police_vehBOLOs pushBack _toAdd;
			publicVariable police_vehBOLOs;
		} else {
			//person bolo
		};
	};
};