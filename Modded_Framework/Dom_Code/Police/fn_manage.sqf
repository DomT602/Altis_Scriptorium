/*
	File: fn_manage.sqf
	Author: Dom
	Description: All functions to do with managing on the police tablet
*/
params [
	["_action","",[""]],
	["_data",[],[[]]]
];

switch _action do {
	case "updateAnnouncement": {
		private _display = findDisplay 1021;
		private _announcementBox = _display displayCtrl 1400;
		private _newAnnouncement = ctrlText _announcementBox;
		if !([_newAnnouncement] call DT_fnc_checkText) exitWith {};
		if (_newAnnouncement == PD_announcement) exitWith {["The announcement hasn't been changed.","orange"] call DT_fnc_notify};
		if (count _newAnnouncement > 139) exitWith {["The announcement is too long.","orange"] call DT_fnc_notify};
		["Announcement updated.","green"] call DT_fnc_notify;
		[_action,_newAnnouncement] remoteExecCall ["DB_fnc_manageUpdate",2];
	};
	case "updateThreat": {
		private _display = findDisplay 1021;
		private _threatBox = _display displayCtrl 1401;
		private _newThreat = ctrlText _threatBox;
		if (_newThreat == threat_level) exitWith {["The threat hasn't been changed.","orange"] call DT_fnc_notify};
		if !(_newThreat in ["Green","Amber","Red","Martial"]) exitWith {["Not a valid input.","red"] call DT_fnc_notify};
		["Threat updated.","green"] call DT_fnc_notify;
		[_action,_newThreat] remoteExecCall ["DB_fnc_manageUpdate",2];
	};
	case "populatePolice": {
		private _display = findDisplay 1021;
		if (isNull _display) exitWith {};
		private _people = _display displayCtrl 1500;
		private _ranksDeps = _display displayCtrl 1501;
		tvClear _people;
		_ranksDeps tvSetCurSel [-1];

		_people tvAdd [[],"Patrol"];
		_people tvAdd [[],"Department of Corrections"];
		_people tvAdd [[],"Highway Patrol"];
		_people tvAdd [[],"SWAT"];
		_people tvAdd [[],"DTU"];

		{
			_x params ["_uid","_name","_rank","_department"];
			private _rankName = ["cop",_rank,_department] call DT_fnc_rankName;
			private _brief = format["%1 - %2",_name,_rankName];
			_people tvAdd [[_department],_brief];
			_people tvSetData [[_department,(_people tvCount [_department])-1],str(_x)];
			_people tvSetValue [[_department,(_people tvCount [_department])-1],_rank];
		} forEach _data;

		{
			_people tvSortByValue [[_x],false];
		} forEach [0,1,2,3,4];

		if ((_ranksDeps tvCount []) isEqualTo 0) then {
			private _rank = player getVariable ["copRank",0];
			private _department = player getVariable ["department","Patrol"];
			private _departments = ["Patrol","Department of Corrections","Highway Patrol","SWAT","DTU"];
			if (_department in ["Patrol","Department of Corrections","Highway Patrol"] && _rank != 7) then {_departments resize 3};

			{
				private _index = _forEachIndex;
				_ranksDeps tvAdd [[],_x];
				for "_i" from 1 to (_rank-1) do {
					private _rankName = ["cop",_i,_index] call DT_fnc_rankName;
					_ranksDeps tvAdd [[_index],_rankName];
				};
			} forEach _departments;
		};
	};
	case "fire": {
		private _display = findDisplay 1021;
		private _tree = _display displayCtrl 1500;
		private _selectionPath = tvCurSel _tree;
		if (count _selectionPath < 2) exitWith {["You need to select somebody.","orange"] call DT_fnc_notify};
		(parseSimpleArray (_tree tvData _selectionPath)) params ["_uid","_name","_oldRank"];
		if (_oldRank >= (player getVariable ["copRank",0])) exitWith {["You can only fire ranks of those under you.","orange"] call DT_fnc_notify};
		_tree tvDelete _selectionPath;
		[format["You successfully fired %1.",_name]] call DT_fnc_notify;
		[_uid,"cop",0,0,player] remoteExecCall ["DB_fnc_adjustRank",2];
		private _unit = [_uid] call DT_fnc_findPlayer;
		if !(isNull _unit) then {
			_unit setVariable ["copRank",0,true];
			_unit setVariable ["department",nil,true];
			["Your have been fired from the police.","red"] remoteExecCall ["DT_fnc_notify",_unit];
		};
	};
	case "changeRank": {
		private _display = findDisplay 1021;
		private _tree = _display displayCtrl 1500;
		private _selectionPath = tvCurSel _tree;
		if (count _selectionPath < 2) exitWith {["You need to select somebody.","orange"] call DT_fnc_notify};
		private _data = parseSimpleArray (_tree tvData _selectionPath);
		_data params ["_uid","_name","_oldRank"];
		private _tree2 = _display displayCtrl 1501;
		private _rankSelection = tvCurSel _tree2;
		if (count _rankSelection < 2) exitWith {["You need to select a new rank and department.","orange"] call DT_fnc_notify};
		_rankSelection params ["_newDepartment","_newRank"];
		_newRank = _newRank + 1;

		if (_oldRank >= (player getVariable ["copRank",0])) exitWith {["You can only change ranks of those under you.","orange"] call DT_fnc_notify};
		_tree tvDelete _selectionPath;
		private _rankName = ["cop",_newRank,_newDepartment] call DT_fnc_rankName;
		private _brief = format["%1 - %2",_name,_rankName];
		_tree tvAdd [[_newDepartment],_brief];
		_tree tvSetData [[_newDepartment,(_tree tvCount [_newDepartment])-1],str(_data)];
		_tree tvSetValue [[_newDepartment,(_tree tvCount [_newDepartment])-1],_newRank];
		_tree tvSortByValue [[_newDepartment],false];
		_tree2 tvSetCurSel [-1];
		["Rank changed."] call DT_fnc_notify;
		[_uid,"cop",_newRank,_newDepartment,player] remoteExecCall ["DB_fnc_adjustRank",2];
		private _unit = [_uid] call DT_fnc_findPlayer;
		if !(isNull _unit) then {
			_unit setVariable ["copRank",_newRank,true];
			_unit setVariable ["department",(switch _newDepartment do {
				case 0: {"Patrol"};
				case 1: {"Department of Corrections"};
				case 2: {"Highway Patrol"};
				case 3: {"SWAT"};
				case 4: {"DTU"};
			}),true];
			["Your rank and department have been changed."] remoteExecCall ["DT_fnc_notify",_unit];
		};
	};
	case "close": {
		waitUntil {!isNull (findDisplay 1018)};
		private _display = findDisplay 1018;

		if !(PD_announcement isEqualTo "") then {
			(_display displayCtrl 1101) ctrlSetStructuredText parseText PD_announcement;
		};

		private _threat = switch threat_level do {
			case "Green": {format["<t color='#00CC00'>%1",threat_level]};
			case "Amber": {format["<t color='#FFBF00'>%1",threat_level]};
			case "Red": {format["<t color='#ff0000'>%1",threat_level]};
			case "Martial": {format["<t color='#8b0000'>%1 Law",threat_level]};	
		};
		(_display displayCtrl 1100) ctrlSetStructuredText parseText _threat;
	};
};