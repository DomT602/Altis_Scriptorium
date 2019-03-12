/*
	File: fn_treeHandleDamage.sqf
	Author: Dom
	Description: Handles when a tree gets hit
*/
params [
	["_id","",[""]],
	["_level",1,[0]]
];

private _tree = objectFromNetId _id;
if (isNull _tree || !(alive _tree)) exitWith {};

private _damage = ((_level / 100) / 2) max 0.04;
_damage = ((damage _tree) + _damage) min 1;
_tree setDamage _damage;

if (_damage isEqualTo 1) then {
	//private _logs = [];
	for "_i" from 0 to round(random 4) step 1 do { 
		private _log = createVehicle ["Log", getPosATL _tree, [], 0, "NONE"]; 
		//_logs pushBack _log;
	};
	["woodcutting",1] remoteExecCall ["DT_fnc_addExp",remoteExecutedOwner];

	/*private _logTime = time;
	waitUntil {_logs isEqualTo [] || ((time - _logTime) > 150)};
	if !(_logs isEqualTo []) then {
		{
			if !(isNull _x) then {
				deleteVehicle _x;
			};
		} forEach _logs;
	};*/
	uiSleep 60;
	_tree hideObjectGlobal true;
};