/*
    File: fn_initRankChange.sqf
    Author: Dom
    Description: Opens and populates the rank change menu
*/
if (MB_Interaction_Target getVariable ["faction","civ"] isEqualTo "civ") exitWith {};
createDialog "DT_promotionMenu";

private _display = findDisplay 1006;
private _nameBox = _display displayCtrl 9200;
private _rankBox = _display displayCtrl 9201;
private _departmentBox = _display displayCtrl 9202;

private _name = ["Unknown",MB_Interaction_Target] call DT_fnc_findName;
_nameBox ctrlSetStructuredText parseText format["<t align='center'>%1</t>",_name];

switch (player getVariable ["faction","civ"]) do {
	case "cop": {
		private _rank = player getVariable ["cop_rank",0];
		if (_rank < 4) exitWith {closeDialog 0};
		if (MB_Interaction_Target getVariable ["cop_rank",0] >= _rank) exitWith {closeDialog 0; ["You can only promote ranks lower then yourself."] call DT_fnc_notify};

		private _ranks = ["Cadet","Officer","Corporal","Sergeant","Lieutenant","Captain","Chief"];
		for "_i" from 0 to (_rank - 1) do {
			_rankBox lbAdd (_ranks select _i);
		};

		private _department = player getVariable ["department","Patrol"];
		private _departments = ["Patrol","Department of Corrections","Highway Patrol","SWAT","DTU","High Command"];

		private _departmentNumber = 2;
		if !(_department in ["Patrol","Department of Corrections","Highway Patrol"]) then {_departmentNumber = 4};
		for "_i" from 0 to _departmentNumber do {
			_departmentBox lbAdd (_departments select _i);
		};
	};
	case "medic": {
		private _rank = player getVariable ["medic_rank",0];
		if (_rank < 4) exitWith {closeDialog 0};
		if (MB_Interaction_Target getVariable ["medic_rank",0] >= _rank) exitWith {closeDialog 0; ["You can only promote ranks lower then yourself."] call DT_fnc_notify};

		private _ranks = ["Probie","EMT","Senior EMT","Paramedic","Lieutenant","Captain","Commisioner"];
		for "_i" from 0 to (_rank - 1) do {
			_rankBox lbAdd (_ranks select _i);
		};

		private _department = player getVariable ["department","EMS"];
		private _departments = ["EMS","Search and Rescue","Fire Department","High Command"];

		for "_i" from 0 to 2 do {
			_departmentBox lbAdd (_departments select _i);
		};
	};
	case "doj": {};
};