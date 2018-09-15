/*
	File: fn_escI.sqf
	Author: Dom
	Description: Handles when the escape menu and inventory menu is open
*/

(findDisplay 49) closeDisplay 2;
(findDisplay 602) closeDisplay 2;

[
	{
		isNull (findDisplay 49)
	},
	{
		[
			{
				!isNull (findDisplay 49) && (!isNull (findDisplay 602))
			},
			{
				call DT_fnc_escI
			}
		] call CBA_fnc_waitUntilAndExecute;
	}
] call CBA_fnc_waitUntilAndExecute;