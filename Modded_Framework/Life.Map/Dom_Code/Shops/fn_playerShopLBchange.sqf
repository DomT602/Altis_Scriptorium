/*
	File: fn_itemShopLBChange.sqf
	Author: Dom
	Description: Called on the LB change
*/
params [
	["_control",controlNull,[controlNull]],
	["_index",-1,[0]]
];
if (_index isEqualTo -1) exitWith {};

private _display = findDisplay 1042;
private _button = _display displayCtrl 1600;
private _infoBox = _display displayCtrl 1102;
private _price = (parseSimpleArray(_control lbData _index)) select 1;

if (_price > (player getVariable ["cash",0])) then {
	_button ctrlEnable false;
	_infoBox ctrlSetStructuredText parseText format ["Buy Price: <t color='#ff0000'>$%1</t><br/>You lack: <t color='#8cff9b'>$%2</t></t>",_price,(_price - (player getVariable ["cash",0]))];
} else {
	_button ctrlEnable true;
	_infoBox ctrlSetStructuredText parseText format ["Buy Price: <t color='#8cff9b'>$%1</t></t>",_price];
};