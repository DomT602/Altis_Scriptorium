/*
	File: fn_previewClothing.sqf
	Author: Dom
	Description: Previews selected clothing
*/
params [
	["_control",controlNull,[controlNull]],
	["_selectionPath",[],[[]]]
];

private _price = _control tvValue _selectionPath;
private _item = _control tvData _selectionPath;
_selectionPath params ["_filter"];
private _purchase = uiNamespace getVariable ["Shop_Purchase",[]];
_purchase set [_filter,[_item,_price]];

switch _filter do {
	case 0: {removeUniform client_preview; client_preview addUniform _item};
	case 1: {removeVest client_preview; client_preview addVest _item};
	case 2: {removeBackpack client_preview; client_preview addBackpack _item};
	case 3: {removeGoggles client_preview; client_preview addGoggles _item};
	case 4: {removeHeadgear client_preview; client_preview addHeadgear _item};
};

private _singleText = ((findDisplay 1013) displayCtrl 1100);
private _totalText = ((findDisplay 1013) displayCtrl 1101);
_singleText ctrlSetStructuredText parseText format ["<t size='0.7'>Price: <t color='#8cff9b'>$%1</t></t>",str(_price)];

private _totalPrice = 0;
{
	_x params ["","_price"];
	if !(_price isEqualTo -1) then {
		_totalPrice = _totalPrice + _price;
	};
} forEach _purchase;

if (_totalPrice > client_cash) then {
	_totalText ctrlSetStructuredText parseText format ["<t size='0.7'>Price: <t color='#ff0000'>$%1 </t>You lack: <t color='#8cff9b'>$%2</t></t>",str(_totalPrice),str(_totalPrice - client_cash)];
	ctrlEnable [1200,false];
} else {
	_totalText ctrlSetStructuredText parseText format ["<t size='0.7'>Price: <t color='#8cff9b'>$%1</t></t>",str(_totalPrice)];
	ctrlEnable [1200,true];
};