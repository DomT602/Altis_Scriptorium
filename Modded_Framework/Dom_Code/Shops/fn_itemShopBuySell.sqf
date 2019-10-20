/*
	File: fn_itemShopBuySell.sqf
	Author: Dom
	Description: Handles buying or selling to a shop - started neat, ended messy :(
*/
private _display = findDisplay 1007;
private _tree = _display displayCtrl 1500;
private _selectionPath = tvCurSel _tree;
_selectionPath params ["_mode"];
if (count _selectionPath < 2) exitWith {["Nothing selected.","orange"] call DT_fnc_notify};

private _price = _tree tvValue _selectionPath;
private _item = _tree tvData _selectionPath;
([_item] call DT_fnc_fetchDetails) params ["_name"];

scopeName "main";
if (_mode isEqualTo 0) then {
	scopeName "buy";
	if (_price > (player getVariable ["cash",0])) exitWith {["You don't have enough money.","orange"] call DT_fnc_notify};
	([_item] call BIS_fnc_itemType) params ["_category","_type"];
	switch _category do {
		case "Weapon": {
			if (_type isEqualTo "Handgun") then {
				if (handgunWeapon player isEqualTo "") then {
					player addWeapon _item
				} else {
					if !(player canAdd _item) exitWith {["You don't have enough room for this item.","orange"] call DT_fnc_notify; breakTo "main"};
					player addItem _item
				};
			} else {
				if (primaryWeapon player isEqualTo "") then {
					player addWeapon _item
				} else {
					if !(player canAdd _item) exitWith {["You don't have enough room for this item.","orange"] call DT_fnc_notify; breakTo "main"};
					player addItem _item
				};
			};
		};
		case "Item": {
			switch _type do {
				case "GPS": {
					if (_item in (assignedItems player)) then {
						if !(player canAdd _item) exitWith {["You don't have enough room for this item.","orange"] call DT_fnc_notify; breakTo "main"};
						player addItem _item;
					} else {
						player linkItem _item;
					};
				};
				case "Map": {
					if (_item in (assignedItems player)) then {
						if !(player canAdd _item) exitWith {["You don't have enough room for this item.","orange"] call DT_fnc_notify; breakTo "main"};
						player addItem _item;
					} else {
						player linkItem _item;
					};
				};
				case "NVGoggles": {
					if (_item in (assignedItems player)) then {
						if !(player canAdd _item) exitWith {["You don't have enough room for this item.","orange"] call DT_fnc_notify; breakTo "main"};
						player addItem _item;
					} else {
						player linkItem _item;
					};
				};
				case "Radio": {
					if (_item in (assignedItems player)) then {
						if !(player canAdd _item) exitWith {["You don't have enough room for this item.","orange"] call DT_fnc_notify; breakTo "main"};
						player addItem _item;
					} else {
						player linkItem _item;
					};
				};
				case "Watch": {
					if (_item in (assignedItems player)) then {
						if !(player canAdd _item) exitWith {["You don't have enough room for this item.","orange"] call DT_fnc_notify; breakTo "main"};
						player addItem _item;
					} else {
						player linkItem _item;
					};
				};
				case "Binocular": {
					if (_item in (assignedItems player)) then {
						if !(player canAdd _item) exitWith {["You don't have enough room for this item.","orange"] call DT_fnc_notify; breakTo "main"};
						player addItem _item
					} else {
						player addWeapon _item
					};
				};
				default {
					if !(player canAdd _item) exitWith {["You don't have enough room for this item.","orange"] call DT_fnc_notify; breakTo "main"};
					player addItem _item;
				};
			};
		};
		case "Equipment": {
			switch _type do {
				case "Glasses": {
					if (goggles player isEqualTo "") then {
						player addGoggles _item
					} else {
						if !(player canAdd _item) exitWith {["You don't have enough room for this item.","orange"] call DT_fnc_notify; breakTo "main"};
						player addItem _item;
					};
				};
				case "Headgear": {
					if (headgear player isEqualTo "") then {
						player addHeadgear _item
					} else {
						if !(player canAdd _item) exitWith {["You don't have enough room for this item.","orange"] call DT_fnc_notify; breakTo "main"};
						player addItem _item;
					};
				};
				case "Vest": {
					if (vest player isEqualTo "") then {
						player addVest _item
					} else {
						if !(player canAdd _item) exitWith {["You don't have enough room for this item.","orange"] call DT_fnc_notify; breakTo "main"};
						player addItem _item;
					};
				};
				case "Uniform": {
					if (uniform player isEqualTo "") then {
						player addUniform _item
					} else {
						if !(player canAdd _item) exitWith {["You don't have enough room for this item.","orange"] call DT_fnc_notify; breakTo "main"};
						player addItem _item;
					};
				};
				case "Backpack": {
					if (backpack player isEqualTo "") then {
						player addBackpack _item
					} else {
						private _oldItems = backpackItems player;
						removeBackpack player;
						player addBackpack _item;
						{
							player addItemToBackpack _x;
						} forEach _oldItems;
					};
				};
			};
		};
		case "Magazine": {
			if !(player canAdd _item) exitWith {["You don't have enough room for this item.","orange"] call DT_fnc_notify; breakTo "main"};
			player addItem _item;
		};
	};
	["cash",-_price] call DT_fnc_handleMoney;
	[format["You bought a %1 for $%2.",_name,_price],"green"] call DT_fnc_notify;
	uiNamespace setVariable ["funds",(uiNamespace getVariable ["funds",0]) + _price];
} else {
	["cash",_price] call DT_fnc_handleMoney;
	player removeItem _item;
	[format["You sold a %1 for $%2.",_name,_price],"green"] call DT_fnc_notify;
	uiNamespace setVariable ["funds",(uiNamespace getVariable ["funds",0]) - _price];
	private _myItems = [player] call DT_fnc_getItems;
	if (_item in _myItems) then {
		([_className] call DT_fnc_fetchDetails) params ["_name"];
		private _itemCount = {_item == _x} count _myItems;
		private _text = if (_itemCount > 1) then {format["[%2] %1",_name,_itemCount]} else {_name};
		_tree tvSetText [_selectionPath,_text];
	} else {
		_tree tvDelete _selectionPath;
	};
};