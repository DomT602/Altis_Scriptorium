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
	private _pos = getPosATL _tree;
	nearestObjects [_pos,["GroundWeaponHolder"],3] params [["_holder",objNull,[objNull]]];
	if (isNull _holder) then {
		_holder = createVehicle ["GroundWeaponHolder",_pos,[],0,"CAN_COLLIDE"];
	};
	_holder addItemCargoGlobal ["Log",round(random 4)];
	["woodcutting",1] remoteExecCall ["DT_fnc_addExp",remoteExecutedOwner];

	[
		{
			params ["_tree"];
			_tree hideObjectGlobal true;
		},
		_tree,
		60
	] call CBA_fnc_waitAndExecute;
};
