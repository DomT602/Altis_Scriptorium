/*
	File: fn_modShopChange.sqf
	Author: Dom
	Description: Previews selected mod
*/
params [
	["_control",controlNull,[controlNull]],
	["_selectionPath",[],[[]]]
];
private _display = findDisplay 1045;
private _infoBox = _display displayCtrl 1102;
private _button = _display displayCtrl 1600;
if (_selectionPath isEqualTo [] || (count _selectionPath < 2)) exitWith {};

private _index = _control tvValue _selectionPath;
_selectionPath params ["_filter"];

private _configSearch = switch _filter do {
	case 0: {"textures"};
	case 1: {"rvmats"};
	case 2: {"plates"};
	case 3: {"tint"};
	case 4: {"wheelColour"};
	case 5: {"proxies"};
};

private _data = [];
if (_configSearch isEqualTo "textures") then {
	_data = (getArray(missionConfigFile >> "Textures" >> "Vehicle" >> (typeOf MB_Interaction_Target) >> "textures")) select _index;
} else {
	_data = (getArray(missionConfigFile >> "Modifications" >> "car" >> _configSearch)) select _index;
};
_data params ["_name","_mod","_conditions","_partPrice"];

private _purchase = uiNamespace getVariable ["purchase",[]];
_purchase set [_filter,[_index,_partPrice]];
[MB_Interaction_Target,_index,true,_filter] call DT_fnc_setCustomisation;

private _totalPrice = 0;
{
	_x params ["","_price"];
	if !(_price isEqualTo -1) then {
		_totalPrice = _totalPrice + _price;
	};
} forEach _purchase;

if (_totalPrice > (player getVariable ["cash",0])) then {
	_infoBox ctrlSetStructuredText parseText format ["Price: $%1<br/>Total: <t color='#ff0000'>$%2</t>",_partPrice,_totalPrice];
	_button ctrlEnable false;
} else {
	_infoBox ctrlSetStructuredText parseText format ["Price: $%1<br/>Total: <t color='#8cff9b'>$%2</t>",_partPrice,_totalPrice];
	_button ctrlEnable true;
};