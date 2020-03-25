/*
    File: fn_clickerQueue.sqf
    Author: DomT602
    Description: Handles queue clicker
    Usage: ['[] call life_fnc_bankWithdraw'] call life_fnc_clickerQueue;
*/
params [
	["_action","",[""]]
];
if (_action isEqualTo "") exitWith {};

if (life_clickQueue isEqualTo []) then {
	{//start loop with 0.1 second delay
		if (life_clickQueue isEqualTo []) exitWith {}; //stop loop here

		private _clickQueue = life_clickQueue;
		life_clickQueue = [];
		//_clickQueue = _clickQueue arrayIntersect _clickQueue;

		{
			call compile _x;
		} forEach _clickQueue;
	}; //end loop
};
life_clickQueue pushBackUnique ["%1",_action]; //pushBackUnique makes this unnecessary

//Usage: (findDisplay xxx) displayAddEventHandler ["MouseButtonDown",life_fnc_clickerQueue];
params [
	["_control",controlNull,[controlNull]],
	["_button",controlNull,[controlNull]]
];
if (isNull _button) exitWith {};

private _action = buttonAction _button;
if (_action isEqualTo "") exitWith {};

if (life_clickQueue isEqualTo []) then {
	{//start loop with 0.1 second delay
		if (life_clickQueue isEqualTo []) exitWith {}; //stop loop here

		private _clickQueue = life_clickQueue;
		life_clickQueue = [];
		_clickQueue = _clickQueue arrayIntersect _clickQueue;

		{
			call compile _x;
		} forEach _clickQueue;
	}; //end loop
};
life_clickQueue pushBackUnique ["%1",_action];
