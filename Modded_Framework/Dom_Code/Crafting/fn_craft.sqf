/*
	File: fn_craft.sqf
	Author: Dom
	Description: Craft selected item
*/

private _display = findDisplay 1003;
private _control = _display displayCtrl 1500;
private _index = lbCurSel _control;
if (_index isEqualTo -1) exitWith {["You haven't selected an item to craft.","orange"] call DT_fnc_notify};
if (lbCurSel 1502 isEqualTo -1) exitWith {["You haven't selected a quantity to craft.","orange"] call DT_fnc_notify};

(parseSimpleArray format["%1",(_control lbData _index)]) params ["_class","_requiredMaterials","_cost"];
private _amount = (lbCurSel (_display displayCtrl 1502)) + 1;

{
	_x params ["_className","_neededCount"];
	for "_i" from 1 to (_neededCount * _amount) do {
		player removeItem _className;
	};
} forEach _requiredMaterials;

client_cash = client_cash - (_cost * _amount);

closeDialog 0;

["Crafting",_amount,"AinvPknlMstpSnonWnonDnon_medic_1","true",
{
	params [
		["_class","",[""]],
		["_amount",1,[0]]
	];
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
[_class,_amount]] call DT_fnc_progressBar;

