/*
	File: fn_craft.sqf
	Author: Dom
	Description: Craft selected item
*/

private _display = findDisplay 1003;
private _tree = _display displayCtrl 1500;
private _selectionPath = tvCurSel _tree;
if (count _selectionPath isEqualTo 1) exitWith {["You haven't selected an item to craft.","orange"] call DT_fnc_notify};
if (lbCurSel 2100 isEqualTo -1) exitWith {["You haven't selected a quantity to craft.","orange"] call DT_fnc_notify};

(parseSimpleArray (_tree tvData _selectionPath)) params [["_class","",[""]],["_requiredMaterials",[],[[]]],["_requiredCount",[],[[]]],["_cost",0,[0]]];
private _amount = (lbCurSel (_display displayCtrl 2100)) + 1;
if !(player canAdd [_class,_amount]) exitWith {["You don't have enough inventory space.","orange"] call DT_fnc_notify};

["Crafting",(_amount * 3),"AinvPknlMstpSnonWnonDnon_medic_1","true",
{
	params [
		["_class","",[""]],
		["_amount",1,[0]],
		["_cost",0,[0]],
		["_requiredMaterials",[],[[]]],
		["_requiredCount",[],[[]]]
	];
	if !(_cost isEqualTo 0) then {
		["cash",-(_cost * _amount)] call DT_fnc_handleMoney;
	};
	{
		private _neededCount = _requiredCount select _forEachIndex;
		for "_i" from 1 to (_neededCount * _amount) do {
			player removeItem _x;
		};
	} forEach _requiredMaterials;
	for "_i" from 1 to _amount do {
		player addItem _class;
	};
	[format["You crafted %1x %2.",_amount,([_class] call DT_fnc_fetchDetails) select 0],"green"] call DT_fnc_notify;
},
{
	params [
		["_state",0,[0]]
	];

	[(switch _state do {
		case 1: {"Crafting cancelled."};
		case 2: {"You are dead."};
		case 3: {"Crafting failed."};
	}),"orange"] call DT_fnc_notify;
},
[_class,_amount,_cost,_requiredMaterials,_requiredCount]] call DT_fnc_progressBar;

