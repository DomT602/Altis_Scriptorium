/*
	File: fn_addExp.sqf
	Author: Dom
	Description: Adds experience to selected skill and levels up if required
		["mining",1] call DT_fnc_addExp;
*/

params [
	["_type","",[""]],
	["_amount",0,[0]]
];

private _formatted = format["level_%1",_type];
private _level = player getVariable [_formatted,0];
if (_level isEqualTo 50) exitWith {}; //max level
private _nextLevel = _level + 1;
private _nextLevelExp = getNumber(missionConfigFile >> "Skills" >> (format["Level_%1",_nextLevel]) >> "experience");

switch _type do {
	case "woodcutting": {
		exp_woodcutting = exp_woodcutting + _amount;
		if (exp_woodcutting > _nextLevelExp) then {
			player setVariable [_formatted,_nextLevel,false];
			[format["You reached level %1 in %2.",_nextLevel,_type],"green"] call DT_fnc_notify;
			if (_nextLevel isEqualTo 50) then {
				["Congratulations, you have reached the max level in woodcutting.","green"] call DT_fnc_notify;
			};
		};
	};
	case "mining": {
		exp_mining = exp_mining + _amount;
		if (exp_mining > _nextLevelExp) then {
			player setVariable [_formatted,_nextLevel,true];
			[format["You reached level %1 in %2.",_nextLevel,_type],"green"] call DT_fnc_notify;
			if (_nextLevel isEqualTo 50) then {
				["Congratulations, you have reached the max level in mining.","green"] call DT_fnc_notify;
			};
		};
	};
	case "farming": {
		exp_farming = exp_farming + _amount;
		if (exp_farming > _nextLevelExp) then {
			player setVariable [_formatted,_nextLevel,false];
			[format["You reached level %1 in %2.",_nextLevel,_type],"green"] call DT_fnc_notify;
			if (_nextLevel isEqualTo 50) then {
				["Congratulations, you have reached the max level in farming.","green"] call DT_fnc_notify;
			};
		};
	};
	case "fishing": {
		exp_fishing = exp_fishing + _amount;
		if (exp_fishing > _nextLevelExp) then {
			player setVariable [_formatted,_nextLevel,false];
			[format["You reached level %1 in %2.",_nextLevel,_type],"green"] call DT_fnc_notify;
			if (_nextLevel isEqualTo 50) then {
				["Congratulations, you have reached the max level in fishing.","green"] call DT_fnc_notify;
			};
		};
	};

	case "hunting": {
		exp_hunting = exp_hunting + _amount;
		if (exp_hunting > _nextLevelExp) then {
			player setVariable [_formatted,_nextLevel,false];
			[format["You reached level %1 in %2.",_nextLevel,_type],"green"] call DT_fnc_notify;
			if (_nextLevel isEqualTo 50) then {
				["Congratulations, you have reached the max level in hunting.","green"] call DT_fnc_notify;
			};
		};
	};
};
[6] call DT_fnc_saveStatsPartial;
