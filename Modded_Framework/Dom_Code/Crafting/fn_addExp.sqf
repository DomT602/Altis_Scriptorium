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
if !(_type in ["woodcutting","mining","fishing","farming","hunting"]) exitWith {["Invalid skill."] call DT_fnc_notify};

private _formatted = format["level_%1",_type];
private _exp = format["exp_%1",_type];
_exp = _exp + _amount;
private _level = player getVariable [_formatted,0];
if (_level isEqualTo 50) exitWith {}; //max level
private _nextLevel = _level + 1;
private _nextLevelExp = getNumber(missionConfigFile >> "Skills" >> (format["Level_%1",_nextLevel]) >> "experience");

if (_exp > _nextLevelExp) then {
	player setVariable [_formatted,_nextLevel,false];
	[format["You reached level %1 in %2.",_nextLevel,_type],"green"] call DT_fnc_notify;
	if (_nextLevel isEqualTo 50) then {
		[format["Congratulations, you have reached the max level in %1.",_type],"green"] call DT_fnc_notify;
	};
	[6] call DT_fnc_saveStatsPartial;
};