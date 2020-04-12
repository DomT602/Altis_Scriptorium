/*
	File: fn_previewClothing.sqf
	Author: Dom
	Description: Previews selected clothing
*/
params [
	["_control",controlNull,[controlNull]],
	["_selectionPath",[],[[]]]
];
private _display = findDisplay 1013;
private _infoBox = _display displayCtrl 1102;
private _button = _display displayCtrl 1600;
if (_selectionPath isEqualTo [] || (count _selectionPath < 2)) exitWith {};

private _price = _control tvValue _selectionPath;
private _item = _control tvData _selectionPath;
_selectionPath params ["_filter"];
private _purchase = uiNamespace getVariable ["purchase",[]];
_purchase set [_filter,[_item,_price]];

switch _filter do {
	case 0: {removeUniform client_preview; client_preview addUniform _item};
	case 1: {removeVest client_preview; client_preview addVest _item};
	case 2: {removeBackpack client_preview; client_preview addBackpack _item};
	case 3: {removeGoggles client_preview; client_preview addGoggles _item};
	case 4: {removeHeadgear client_preview; client_preview addHeadgear _item};
};

private _totalPrice = 0;
{
	_x params ["","_price"];
	if !(_price isEqualTo -1) then {
		_totalPrice = _totalPrice + _price;
	};
} forEach _purchase;

if (_totalPrice > (player getVariable ["cash",0])) then {
	_infoBox ctrlSetStructuredText parseText format ["Price: $%1<br/>Total: <t color='#ff0000'>$%2</t>",_price,_totalPrice];
	_button ctrlEnable false;
} else {
	_infoBox ctrlSetStructuredText parseText format ["Price: $%1<br/>Total: <t color='#8cff9b'>$%2</t>",_price,_totalPrice];
	_button ctrlEnable true;
};