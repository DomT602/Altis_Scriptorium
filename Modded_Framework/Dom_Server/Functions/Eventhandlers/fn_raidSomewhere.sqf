/*
    File: fn_jailBreak.sqf
    Author: Dom
    Description: Recieves and monitors the bomb state (needs gate in SQM)
*/

private _pos = getMarkerPos "rebel";
private _success = true;
rebel_started = true;
publicVariable rebel_started;
private _units = nearestObjects[_pos,["CAManBase"],100];
private _cops = [];

{
	if (_x getVariable ["faction","civ"] isEqualTo "cop") then {
		_cops pushBack _x;
	};
} forEach _units;

for "_i" from 0 to 900 do {
	{
		if (_x getVariable ["dead",false] || isNull _X || _x distance _pos > 100) then {
			_cops deleteAt _forEachIndex;
		};
	} forEach _cops;
	if (_cops isEqualTo []) exitWith {_success = false;}
	uiSleep 1;
};

if (_success) then {
	if (rebel_use) then {
		rebel_use = false;
		publicVariable rebel_use;
		[] spawn {
			uiSleep 1800;
			rebel_use = true;
			publicVariable rebel_use;
		};
	};
	["The police secured the weapon shipment."] remoteExecCall ["DT_fnc_notify",-2];
} else {
	["The police failed to secure the weapon shipment."] remoteExecCall ["DT_fnc_notify",-2];
};
rebel_time = time;
publicVariable rebel_time;
rebel_started = false;
publicVariable rebel_started;