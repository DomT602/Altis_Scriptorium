/*
	File: fn_buyClothing.sqf
	Author: Dom
	Description: Buys selected clothing
*/
private _purchase = uiNamespace getVariable ["purchase",[]];
closeDialog 0;
private _totalPrice = 0;
{
	_x params ["_item","_price"];
	if !(_item isEqualTo "") then {
		_totalPrice = _totalPrice + _price;
		switch _forEachIndex do {
			case 0: {
				private _items = uniformItems player;
				removeUniform player; 
				player addUniform _item;
				{
					player addItemToUniform _x;
				} forEach _items;
			};
			case 1: {
				private _items = vestItems player;
				removeVest player; 
				player addVest _item;
				{
					player addItemToVest _x;
				} forEach _items;
			};
			case 2: {
				private _items = backpackItems player;
				removeBackpack player; 
				player addBackpack _item;
				{
					player addItemToBackpack _x;
				} forEach _items;
			};
			case 3: {
				removeGoggles player; 
				player addGoggles _item;
			};
			case 4: {
				removeHeadgear player; 
				player addHeadgear _item;
			};
		};
	};
} forEach _purchase;

["cash",-_totalPrice] call DT_fnc_handleMoney;