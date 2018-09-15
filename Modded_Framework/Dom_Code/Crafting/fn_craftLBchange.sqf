/*
	File: fn_craftLBchange.sqf
	Author: Dom
	Description: Called when a different selection is made on crafting menu
*/

params [
    ["_control",controlNull,[controlNull]],
    ["_index",-1,[0]]
];

private _canCraft = true;
(call compile format ["%1",(_control lbData _index)]) params ["_class","_requiredMaterials","_cost"];
private _amount = (lbCurSel ((findDisplay 6250) displayCtrl 1502)) + 1; //counter listbox

lbClear 1501;
{
	_x params ["_className","_neededCount","_icon"];
	private _ownCount = {_className isEqualTo _x} count ((uniformItems player) + (vestItems player) + (backpackItems player));
	([_className] call DT_fnc_fetchDetails) params ["_name","_picture"];
	_neededCount = _neededCount * _amount;
	lbAdd [1501,format["%1x %2",_neededCount,_name]];
	lbSetPicture [1501,(lbSize 1501) - 1,_picture];
	if (_ownCount >= _neededCount) then {
		lbSetColor [1501,(lbSize 1501) - 1,[0,1,0,1]];
	} else {
		lbSetColor [1501,(lbSize 1501) - 1,[1,0,0,1]];
		if (_canCraft) then {
			_canCraft = false;
		};
	};
} forEach _requiredMaterials;

if !(_cost isEqualTo 0) then {
	_cost = _cost * _amount;
	lbAdd [1501,format["$%1",_cost]];
	if (client_cash > _cost) then {
		lbSetColor [1501,(lbSize 1501) - 1,[0,1,0,1]];
	} else {
		lbSetColor [1501,(lbSize 1501) - 1,[1,0,0,1]];
		if (_canCraft) then {
			_canCraft = false;
		};
	};
};

ctrlEnable [2400,_canCraft];