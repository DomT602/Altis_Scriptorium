/*
    File: fn_clickerQueue.sqf
    Author: DomT602
    Description: Handles queue clicker
*/
params [
	["_action","",[""]]
];
if (_action isEqualTo "") exitWith {};

if (life_clickQueue isEqualTo []) then {
	0 spawn {
		if (life_clickQueue isEqualTo []) exitWith {};

		private _clickQueue = life_clickQueue;
		life_clickQueue = [];

		{
			call compile _x;
		} forEach _clickQueue;

		uiSleep 0.1;
	};
};
life_clickQueue pushBackUnique _action;