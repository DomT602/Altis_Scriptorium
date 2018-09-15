/*
	File: fn_onFired.sqf
	Author: DomT602 (domt602@gmail.com)
	Description: Handles a fired 'weapon'
*/
params [
	"",
	["_weapon","",[""]]
];

if (_weapon isEqualTo "YourAxeClassnameHere") exitWith {
	private _classes = ["t_"];
	private _tree = objNull;
	private _objects = lineIntersectsWith [eyePos player, ATLtoASL (player modelToWorld [0, 3, 0]), player, objNull, true];
	{
		private _object = _x;
		private _class = toLower (str _object);
		{
			if ((_class find (toLower _x)) != -1) exitWith { 
				_tree = _object;
			};
		} forEach _classes;
		if !(isNull _tree) exitWith {};
	} forEach _objects;
	if (isNull _tree) exitWith {};

	if (alive _tree) then {
		[netId _tree] remoteExec ["TON_fnc_treeHandleDamage",2];
	};
};