/*
	File: fn_itemShopLBChange.sqf
	Author: Dom
	Description: Called on the LB change
*/
params [
	["_control",controlNull,[controlNull]],
	["_selectionPath",[],[[]]]
];
private _display = findDisplay 1007;
private _infoBox = _display displayCtrl 1102;
private _button = _display displayCtrl 1600;
if (_selectionPath isEqualTo [] || (count _selectionPath < 2)) exitWith {_infoBox ctrlSetStructuredText parseText ""; _button ctrlEnable false};
_selectionPath params ["_mode"];

switch _mode do {
	case 0: {
		if (ctrlText _button == "Sell") then {
			_button ctrlSetText "Buy";
		};
		private _cash = player getVariable ["cash",0];
		private _price = _control tvValue _selectionPath;
		private _item = _control tvData _selectionPath;
		if (_price > _cash) then {
			_button ctrlEnable false;
			_infoBox ctrlSetStructuredText parseText format ["Buy Price: <t color='#ff0000'>$%1</t><br/>You lack: <t color='#8cff9b'>$%2</t></t>",_price,(_price - _cash)];
		} else {
			_button ctrlEnable true;
			_infoBox ctrlSetStructuredText parseText format ["Buy Price: <t color='#8cff9b'>$%1</t></t>",_price];
		};

		clearItemCargo client_preview;
		clearWeaponCargo client_preview;
		clearMagazineCargo client_preview;
		client_preview addItemCargo [_item,1];
	};
	case 1: {
		if (ctrlText _button == "Buy") then {
			_button ctrlEnable true;
			_button ctrlSetText "Sell";
		};
		private _shop = uiNamespace getVariable ["shop",""];
		private _item = _control tvData _selectionPath;
		private _itemArray = getArray(missionConfigFile >> "Shops" >> "Items" >> _shop >> "items");
		private _selectionPath2 = _itemArray findIf {_item == (_x select 0)};
		(_itemArray select _selectionPath2) params ["","",["_sellPrice",0,[0]]];
		_infoBox ctrlSetStructuredText parseText format ["Sell Price: <t color='#8cff9b'>$%1</t></t>",_sellPrice];
		_control tvSetValue [_selectionPath,_sellPrice];
	};
};

