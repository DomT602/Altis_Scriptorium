/*
	File: fn_itemShopBuySell.sqf
	Author: Dom
	Description: Handles buying or selling to a shop - started neat, ended messy :(
*/
disableSerialization;
params [
	["_mode",-1,[0]]
];

scopeName "main";
switch _mode do {
	case 0: {
		scopeName "buy";
		private _index = lbCurSel 6000;
		if (_index isEqualTo -1) exitWith {["Nothing selected.","orange"] call DT_fnc_notify};
		private _price = lbValue[6000,_index];
		private _item = lbData[6000,_index];
		([_item] call DT_fnc_fetchDetails) params ["_name"];
		if (_price > client_cash) exitWith {["You don't have enough money.","orange"] call DT_fnc_notify};
		([_item] call BIS_fnc_itemType) params ["_category","_type"]; //do this
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
		client_cash = client_cash - _price;
		[format["You bought a %1 for $%2.",_name,str(_price)],"green"] call DT_fnc_notify;
		[0] call DT_fnc_saveStatsPartial;
		[2] call DT_fnc_saveStatsPartial;
	};
	case 1: {
		private _index = lbCurSel 6001;
		if (_index isEqualTo -1) exitWith {["Nothing selected.","orange"] call DT_fnc_notify;};
		private _price = lbValue[6001,_index];
		private _item = lbData[6001,_index];
		([_item] call DT_fnc_fetchDetails) params ["_name"];
		if !(player canAdd _item) exitWith {["You don't have enough room for this item.","orange"] call DT_fnc_notify};
		if (_price > client_cash) exitWith {["You don't have enough money.","orange"] call DT_fnc_notify};
		client_cash = client_cash - _price;
		player addItem _item;
		[format["You bought a %1 for $%2.",_name,str(_price)],"green"] call DT_fnc_notify;
		[0] call DT_fnc_saveStatsPartial;
		[2] call DT_fnc_saveStatsPartial;
	};
	case 2: {
		private _index = lbCurSel 6002;
		if (_index isEqualTo -1) exitWith {["Nothing selected.","orange"] call DT_fnc_notify;};
		private _price = lbValue[6002,_index];
		private _item = lbData[6002,_index];
		([_item] call DT_fnc_fetchDetails) params ["_name"];
		client_cash = client_cash + _price;
		player removeItem _item;
		[format["You sold a %1 for $%2.",_name,str(_price)],"green"] call DT_fnc_notify;
		call DT_fnc_refreshInventory;
		[0] call DT_fnc_saveStatsPartial;
		[2] call DT_fnc_saveStatsPartial;
	};
};