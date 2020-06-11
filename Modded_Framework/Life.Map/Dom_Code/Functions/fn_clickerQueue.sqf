/*
    File: fn_clickerQueue.sqf
    Author: DomT602
    Description: Handles queue clicker
*/
params [
	["_action","",[""]]
];

client_clickQueue pushBackUnique _action;
if (client_clickHandler isEqualTo -1) then {
	client_clickHandler = [
		{
			if (client_clickQueue isEqualTo []) exitWith {
				[_this select 1] call CBA_fnc_removePerFrameHandler;
				client_clickHandler = -1;
			};

			private _clickQueue = client_clickQueue;
			client_clickQueue = [];

			{
				call compile _x;
			} forEach _clickQueue;
		},
		0.01
	] call CBA_fnc_addPerFrameHandler;
};