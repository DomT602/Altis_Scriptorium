/*
	File: fn_handleItem.sqf
	Author: Dom
	Description: Handles double clicking of items
*/
params [
	["_control",controlNull,[controlNull]],
	["_index",-1,[0]]
];

private _item = _control lbData _index;
private _action = getText(missionConfigFile >> "Misc" >> "Items" >> _item);
if !(_action isEqualTo "") then {
	call compile _action;
	closeDialog 0;
};