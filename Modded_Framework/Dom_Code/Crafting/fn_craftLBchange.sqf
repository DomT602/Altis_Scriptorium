/*
	File: fn_craftLBchange.sqf
	Author: Dom
	Description: Called when a different selection is made on crafting menu
*/

params [
	["_control",controlNull,[controlNull]],
	["_selectionPath",[],[[]]]
];

private _canCraft = true;
private _display = findDisplay 1003;
private _ingredList = _display displayCtrl 1501;
(parseSimpleArray format ["%1",(_control tvData _selectionPath)]) params [["_class","",[""]],["_requiredMaterials",[],[[]]],["_cost",0,[0]]];
if (_class isEqualTo "") exitWith {	//location is red
	lbClear _ingredList;
	_ingredList lbAdd "Wrong location";
	ctrlEnable [2400,false];
};
private _amount = (tvCurSel (_display displayCtrl 1502)) + 1; //counter listbox

private _myItems = [];
_myItems append (uniformItems player);
_myItems append (vestItems player);
_myItems append (backpackItems player);

lbClear _ingredList;
{
	_x params ["_class","_neededCount","_icon"];
	private _ownCount = {_class == _x} count _myItems;
	([_class] call DT_fnc_fetchDetails) params ["_name","_picture"];
	_neededCount = _neededCount * _amount;
	_ingredList lbAdd format["%1x %2",_neededCount,_name];
	_ingredList lbSetPicture [(lbSize 1501) - 1,_picture];
	if (_ownCount >= _neededCount) then {
		_ingredList lbSetColor [(lbSize 1501) - 1,[0,1,0,1]];
	} else {
		_ingredList lbSetColor [(lbSize 1501) - 1,[1,0,0,1]];
		if (_canCraft) then {
			_canCraft = false;
		};
	};
} forEach _requiredMaterials;

if !(_cost isEqualTo 0) then {
	_cost = _cost * _amount;
	_ingredList lbAdd str(_cost);
	if (client_cash > _cost) then {
		_ingredList lbSetColor [(lbSize 1501) - 1,[0,1,0,1]];
	} else {
		_ingredList lbSetColor [(lbSize 1501) - 1,[1,0,0,1]];
		if (_canCraft) then {
			_canCraft = false;
		};
	};
};

ctrlEnable [2400,_canCraft];