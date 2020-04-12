/*
	File: fn_initRankChange.sqf
	Author: Dom
	Description: Opens and populates the rank change menu
*/
private _faction = player getVariable ["faction","civ"];
if !(MB_Interaction_Target getVariable ["faction","civ"] isEqualTo _faction) exitWith {["You must be on as the same faction."] call DT_fnc_notify};

switch _faction do {
	case "cop": {
		createDialog "DT_policeRankMenu";
		private _display = findDisplay 1023;
		private _nameBox = _display displayCtrl 1101;
		private _tree = _display displayCtrl 1500;
		private _name = ["Unknown",MB_Interaction_Target] call DT_fnc_findName;
		_nameBox ctrlSetStructuredText parseText _name;

		private _rank = player getVariable ["copRank",0];
		if (_rank < 4) exitWith {closeDialog 0};
		if (MB_Interaction_Target getVariable ["copRank",0] >= _rank) exitWith {closeDialog 0; ["You can only promote ranks lower then yourself."] call DT_fnc_notify};

		private _department = player getVariable ["department","Patrol"];
		private _departments = ["Patrol","Department of Corrections","Highway Patrol","SWAT","DTU"];
		if (_department in ["Patrol","Department of Corrections","Highway Patrol"] && _rank != 7) then {_departments resize 3};

		{
			_tree tvAdd [[],_x];
			for "_i" from 1 to (_rank-1) do {
				private _rankName = ["cop",_i,_forEachIndex] call DT_fnc_rankName;
				_tree tvAdd [[_forEachIndex],_rankName];
			};
		} forEach _departments;
	};
	case "medic": {
		createDialog "DT_promotionMenu";
		private _display = findDisplay 1006;
		private _nameBox = _display displayCtrl 9200;
		private _tree = _display displayCtrl 9201;
		private _name = ["Unknown",MB_Interaction_Target] call DT_fnc_findName;
		_nameBox ctrlSetText _name;

		private _rank = player getVariable ["medicRank",0];
		if (_rank < 4) exitWith {closeDialog 0};
		if (MB_Interaction_Target getVariable ["medicRank",0] >= _rank) exitWith {closeDialog 0; ["You can only promote ranks lower then yourself."] call DT_fnc_notify};

		private _department = player getVariable ["department","EMS"];
		private _departments = ["EMS","Search and Rescue","Fire Department"];

		{
			_tree tvAdd [[],_x];
			for "_i" from 1 to (_rank-1) do {
				private _rankName = ["medic",_i,_forEachIndex] call DT_fnc_rankName;
				_tree tvAdd [[_forEachIndex],_rankName];
			};
		} forEach _departments;

	};
	case "civ": {
		createDialog "DT_promotionMenu";
		private _display = findDisplay 1006;
		private _nameBox = _display displayCtrl 9200;
		private _tree = _display displayCtrl 9201;
		private _name = ["Unknown",MB_Interaction_Target] call DT_fnc_findName;
		_nameBox ctrlSetText _name;

		private _rank = player getVariable ["dojRank",0];
		if (_rank < 4) exitWith {closeDialog 0};
		if (MB_Interaction_Target getVariable ["dojRank",0] >= _rank) exitWith {closeDialog 0; ["You can only promote ranks lower then yourself."] call DT_fnc_notify};

		_tree tvAdd [[],"Department of Justice"];
		for "_i" from 1 to (_rank-1) do {
			private _rankName = ["civ",_i,_forEachIndex] call DT_fnc_rankName;
			_tree tvAdd [[0],_rankName];
		};
	};
};