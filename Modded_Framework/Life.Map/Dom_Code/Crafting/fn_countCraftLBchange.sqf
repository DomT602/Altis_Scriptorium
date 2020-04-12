/*
	File: fn_countCraftLBchange.sqf
	Author: Dom
	Description: Called when a different selection is made on crafting menu
*/

params [
	"",
	["_index",-1,[0]]
];

private _canCraft = true;
private _display = findDisplay 1003;
private _tree = _display displayCtrl 1500;
private _infoBox = _display displayCtrl 1100;
private _selectionPath = tvCurSel _tree;
(parseSimpleArray (_tree tvData _selectionPath)) params [["_class","",[""]],["_requiredMaterials",[],[[]]],["_requiredCount",[],[[]]],["_cost",0,[0]]];
private _amount = _index + 1; //counter listbox
private _myItems = [player] call DT_fnc_getItems;

private _text = format["<img size='5' image='%1'></img><br/>",_tree tvPicture _selectionPath];
{
	private _neededCount = _requiredCount select _forEachIndex;
	private _className = _x;
	private _ownCount = {_className == _x} count _myItems;
	([_className] call DT_fnc_fetchDetails) params ["_name"];
	_neededCount = _neededCount * _amount;
	if (_ownCount >= _neededCount) then {
		_text = _text + format["<t color='#8cff9b'>%1x %2</t><br/>",_neededCount,_name];
	} else {
		_text = _text + format["<t color='#ff0000'>%1x %2</t><br/>",_neededCount,_name];
		if (_canCraft) then {
			_canCraft = false;
		};
	};
} forEach _requiredMaterials;

if !(_cost isEqualTo 0) then {
	_cost = _cost * _amount;
	if ((player getVariable ["cash",0]) > _cost) then {
		_text = _text + format["<t color='#8cff9b'>$%1</t><br/>",_cost];
	} else {
		_text = _text + format["<t color='#ff0000'>$%1</t><br/>",_cost];
		if (_canCraft) then {
			_canCraft = false;
		};
	};
};
_infoBox ctrlSetStructuredText parseText _text;
ctrlEnable [1600,_canCraft];