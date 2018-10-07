/*
    File: fn_itemShopLBChange.sqf
    Author: Dom
    Description: Called on the LB change
*/
params [
    ["_evhStuff",[],[[]]]
];
_evhStuff params [
    ["_control",controlNull,[controlNull]],
    ["_index",-1,[0]]
];
if (_mode isEqualTo -1 || {isNull _control}) exitWith {closeDialog 0};

if (_index isEqualTo -1) exitWith {["Nothing selected.","orange"] call DT_fnc_notify};

private _info = ((findDisplay -1) displayCtrl -1);
private _price = _control lbValue _index;

if (_price > client_cash) then {
    _info ctrlSetStructuredText parseText format ["<t size='0.7'>Price: <t color='#ff0000'>$%1</t><br/>You lack: <t color='#8cff9b'>$%2</t></t>",str(_price),str(_price - client_cash)];
} else {
    _info ctrlSetStructuredText parseText format ["<t size='0.7'>Price: <t color='#8cff9b'>$%1</t></t>",str(_price)];
};