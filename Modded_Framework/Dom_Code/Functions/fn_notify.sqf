/*
	File: fn_notify.sqf
	Author: DomT602 (domt602@gmail.com)
	Description: Processes the given notification, places it into the notification array and monitors the notification
*/
params [
	["_message","",[""]],
	["_colour","blue",[""]],
	["_time",10,[0]]
];

private _colourCode = call {
	if (_colour isEqualTo "green") exitWith {"#1ea83c"};
	if (_colour isEqualTo "orange") exitWith {"#d1780c"};
	if (_colour isEqualTo "red") exitWith {"#d11414"};
	if (_colour isEqualTo "blue") exitWith {"#1e2adb"};
	if (_colour isEqualTo "grey") exitWith {"#696a7a"}; //add new colours below
};

_message = format["<t size='1.3' color='%1'>%2",_colourCode,((_message splitString "&") joinString "and")];

for "_i" from 15 to 1 step -1 do {
	DT_notifArray set [_i,DT_notifArray select (_i - 1)];
};

DT_notifCount = DT_notifCount + 1;
private _id = DT_notifCount;

DT_notifArray set [0,[_message,_id]];

call DT_fnc_showNotifs;

[
	{
		params [
			["_id",-1,[0]]
		];

		{
			_x params [
				"",
				["_oldID",-1,[0]]
			];
			if (_oldID isEqualTo _id) exitWith {
				DT_notifArray set [_forEachIndex,["",-1]];
				call DT_fnc_showNotifs;
			};
		} forEach DT_notifArray;
	},
	_id,
	_time
] call CBA_fnc_waitAndExecute;