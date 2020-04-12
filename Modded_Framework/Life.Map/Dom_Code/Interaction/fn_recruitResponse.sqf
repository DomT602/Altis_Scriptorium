/*
	File: fn_recruitPlayer.sqf
	Author: Dom
	Description: Respond to the job offer
*/
params [
	["_faction","civ",[""]],
	["_unit",objNull,[objNull]]
];

private _name = ["Someone",_unit] call DT_fnc_findName;
private _action = [
	format ["%1 has offered you a job as a %2. Do you accept?",_name,_faction],
	"Recruitment",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;

if (_action) then {
	switch _faction do {
		case "cop": {
			player setVariable ["copRank",1,true];
			player setVariable ["department","Patrol",true];
		};
		case "medic": {
			player setVariable ["medicRank",1,true];
			player setVariable ["department","EMS",true];
		};
		case "civ": {
			player setVariable ["dojRank",1,true];
		};
	};
	[getPlayerUID player,_faction,1,0,_unit] remoteExecCall ["DB_fnc_adjustRank",2];
} else {
	["Job offer declined.","red"] call DT_fnc_notify;
	["Your job offer was declined.","red"] remoteExecCall ["DT_fnc_notify",_unit];
};
