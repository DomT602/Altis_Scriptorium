/*
	File: fn_craftLBchange.sqf
	Author: Dom
	Description: Called when a different selection is made on crafting menu
*/

params [
    "",
    ["_index2",-1,[0]]
];

private _canCraft = true;
private _display = findDisplay 1003;
private _craftList = _display displayCtrl 1500;
private _ingredList = _display displayCtrl 1501;
private _index = lbCurSel _craftList;
(parseSimpleArray format ["%1",(_craftList lbData _index)]) params ["_class","_requiredMaterials","_cost"];
private _amount = _index2 + 1; //counter listbox

lbClear _ingredList;
{
	_x params ["_className","_neededCount","_icon"];
	private _ownCount = {_className isEqualTo _x} count ((uniformItems player) + (vestItems player) + (backpackItems player));
	([_className] call DT_fnc_fetchDetails) params ["_name","_picture"];
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