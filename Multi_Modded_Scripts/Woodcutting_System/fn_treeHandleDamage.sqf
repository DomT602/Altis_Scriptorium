/*
	File: fn_treeHandleDamage.sqf
	Author: DomT602
	Description: Handles when a tree gets hit
*/

params [
	["_id","",[""]]
];

private _tree = objectFromNetId _id;
if (isNull _tree) exitWith {};
if !(alive _tree) exitWith {};

private _item = "Log"; //name of your virtual item
private _damage = 0.05; //choose the damage each axe swing does here, 1 = full damage in 1 hit, 0.05 means 20 hits for a tree to be felled.
_damage = ((damage _tree) + _damage) min 1;
_tree setDamage _damage;

if (_damage isEqualTo 1) then {
	[true,_item,1] remoteExecCall ["life_fnc_handleInv",remoteExecutedOwner];
	_tree hideObjectGlobal true;
};