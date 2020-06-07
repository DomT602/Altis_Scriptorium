/*
	File: fn_manageShop.sqf
	Author: Dom
	Description: Handles managing a player owned shop
*/
params [
	["_action","init",[""]]
];

if (_action isEqualTo "init") then {
	createDialog "DT_manageShop";
};
private _display = findDisplay 1041;
private _items = MB_Interaction_Target getVariable ["shop_inventory",[]];
private _shopItems = _display displayCtrl 1500;
private _myItems = _display displayCtrl 1501;

scopeName "main";
switch _action do {
	case "init": {
		if (MB_Interaction_Target getVariable ["shop_inUse",false]) exitWith {["Someone else is using this shop."] call DT_fnc_notify};
		MB_Interaction_Target setVariable ["shop_inUse",true,true];
		private _funds = MB_Interaction_Target getVariable ["shop_funds",0];
		(_display displayCtrl 1100) ctrlSetStructuredText parseText str(_funds);

		{
			_x params ["_item","_price","_quantity"];
			([_item] call DT_fnc_fetchDetails) params ["_name","_picture"];
			_shopItems lbAdd _name;
			_shopItems lbSetData [_forEachIndex,str(_x)];
			_shopItems lbSetPicture [_forEachIndex,_picture];
		} forEach _items;

		private _items = [];
		{
			if !(_x in _items) then {
				([_x] call DT_fnc_fetchDetails) params ["_name","_picture"];
				_myItems lbAdd _name;
				private _count = (lbSize _myItems) - 1;
				_myItems lbSetData [_count,_x];
				_myItems lbSetPicture [_count,_picture];
				_items pushBack _x;
			};
		} forEach ([player] call DT_fnc_getItems);
	};
	case "addItem": {
		private _maxListings = getNumber(missionConfigFile >> "Buildings" >> "Shops" >> typeOf MB_Interaction_Target >> "maxItems");
		//if ((count _items) isEqualTo _maxListings) exitWith {[format["You have reached the max listings for this shop (%1).",_maxListings],"orange"] call DT_fnc_notify};
		private _index = lbCurSel _myItems;
		if (_index isEqualTo -1) exitWith {["You didn't select an item.","orange"] call DT_fnc_notify};
		private _item = _myItems lbData _index;
		private _price = ctrlText (_display displayCtrl 1401);
		if !([_price,0] call DT_fnc_checkNumber) exitWith {};
		_price = parseNumber _price;
		private _quantity = ctrlText (_display displayCtrl 1400);
		if !([_quantity,0] call DT_fnc_checkNumber) exitWith {};
		_quantity = parseNumber _quantity;
		private _ownCount = {_item == _x} count ([player] call DT_fnc_getItems);
		if (_ownCount < _quantity) exitWith {[format["You only have %1 of these items in your inventory.",_ownCount],"orange"] call DT_fnc_notify};
		if (_ownCount isEqualTo _quantity) then {_myItems lbDelete _index};
		for "_i" from 1 to _quantity do {
			player removeItem _item;
		};
		private _array = [_item,_price,_quantity];
		_items pushBack _array;

		([_item] call DT_fnc_fetchDetails) params ["_name","_picture"];
		_shopItems lbAdd _name;
		private _count = (lbSize _shopItems) - 1;
		_shopItems lbSetData [_count,str(_array)];
		_shopItems lbSetPicture [_count,_picture];
		_shopItems lbSetCurSel _count;
		MB_Interaction_Target setVariable ["shop_inventory",_items,true];
		_myItems lbSetCurSel -1;
		[MB_Interaction_Target,1] remoteExecCall ["DB_fnc_updateShop",2];
	};
	case "removeItem": {
		private _index = lbCurSel _shopItems;
		if (_index isEqualTo -1) exitWith {["You didn't select an item.","orange"] call DT_fnc_notify};
		(parseSimpleArray (_shopItems lbData _index)) params ["_item","","_quantity"];
		if !(player canAdd [_item,_quantity]) exitWith {["You don't have enough room to remove this item.","orange"] call DT_fnc_notify};
		_shopItems lbDelete _index;
		_shopItems lbSetCurSel -1;
		_items deleteAt _index;
		MB_Interaction_Target setVariable ["shop_inventory",_items,true];
		for "_i" from 1 to _quantity do {
			player addItem _item;
		};
		private _inList = false;
		for "_i" from 0 to (lbSize _myItems)-1 do {
			private _class = _myItems lbData _i;
			if (_class isEqualTo _item) exitWith {
				_inList = true;
			};
		};
		if !(_inList) then {
			([_item] call DT_fnc_fetchDetails) params ["_name","_picture"];
			_myItems lbAdd _name;
			private _count = (lbSize _myItems) - 1;
			_myItems lbSetData [_count,_item];
			_myItems lbSetPicture [_count,_picture];
		};
		[MB_Interaction_Target,1] remoteExecCall ["DB_fnc_updateShop",2];
	};
	case "updateItem": {
		private _index = lbCurSel _shopItems;
		if (_index isEqualTo -1) exitWith {["You need to select an item from the shop.","orange"] call DT_fnc_notify};
		private _array = parseSimpleArray (_shopItems lbData _index);
		_array params ["_item","_oldPrice","_oldQuantity"];
		private _price = ctrlText (_display displayCtrl 1401);
		if !([_price,0] call DT_fnc_checkNumber) exitWith {};
		_price = parseNumber _price;
		private _quantity = ctrlText (_display displayCtrl 1400);
		if !([_quantity,0] call DT_fnc_checkNumber) exitWith {};
		_quantity = parseNumber _quantity;
		if (_price isEqualTo _oldPrice && {_quantity isEqualTo _oldQuantity}) exitWith {["You did not change anything."] call DT_fnc_notify};
		
		if (_price != _oldPrice) then {
			_array set [1,_price];
			["Price updated.","green"] call DT_fnc_notify;
		};
		if (_quantity != _oldQuantity) then {
			private _change = _oldQuantity - _quantity;
			if (_change > 0) then {
				if !(player canAdd [_item,_change]) exitWith {["You don't have enough room to remove this item.","orange"] call DT_fnc_notify; breakTo "main"};
				for "_i" from 1 to _change do {
					player addItem _item;
				};
				private _inList = false;
				for "_i" from 0 to (lbSize _myItems)-1 do {
					private _class = _myItems lbData _i;
					if (_class isEqualTo _item) exitWith {
						_inList = true;
					};
				};
				if !(_inList) then {
					([_item] call DT_fnc_fetchDetails) params ["_name","_picture"];
					_myItems lbAdd _name;
					private _count = (lbSize _myItems) - 1;
					_myItems lbSetData [_count,_item];
					_myItems lbSetPicture [_count,_picture];
				};
			} else {
				private _ownCount = {_item == _x} count ([player] call DT_fnc_getItems);
				_change = abs _change;
				if (_ownCount < _change) exitWith {[format["You only have %1 of these items in your inventory.",_ownCount],"orange"] call DT_fnc_notify; breakTo "main"};
				for "_i" from 1 to _change do {
					player removeItem _item;
				};
			};
			_array set [2,_quantity];
			["Quantity updated.","green"] call DT_fnc_notify;
		};
		
		_shopItems lbSetData [_index,str(_array)];
		_items set [_index,_array];
		MB_Interaction_Target setVariable ["shop_inventory",_items,true];
		[MB_Interaction_Target,1] remoteExecCall ["DB_fnc_updateShop",2];
	};
	case "withdrawFunds": {
		private _funds = MB_Interaction_Target getVariable ["shop_funds",0];
		if (_funds isEqualTo 0) exitWith {["There are no funds to withdraw.","orange"] call DT_fnc_notify};
		MB_Interaction_Target setVariable ["shop_funds",0,true];
		[format["You retrieved $%1 from the store.",_funds],"green"] call DT_fnc_notify;
		["cash",_funds] call DT_fnc_handleMoney;
		[MB_Interaction_Target,2] remoteExecCall ["DB_fnc_updateShop",2];
		(_display displayCtrl 1100) ctrlSetStructuredText parseText "0";
	};
	case "updateName": {
		private _oldName = MB_Interaction_Target getVariable ["shop_name",""];
		private _newName = ctrlText (_display displayCtrl 1402);
		if !([_newName] call DT_fnc_checkText) exitWith {};
		if (count _newName < 5) exitWith {["Name is too short.","orange"] call DT_fnc_notify};
		if (_oldName isEqualTo _newName) exitWith {["Shop name is unchanged."] call DT_fnc_notify};
		["Shop name updated.","green"] call DT_fnc_notify;
		MB_Interaction_Target setVariable ["shop_name",_newName,true];
		[MB_Interaction_Target,3] remoteExecCall ["DB_fnc_updateShop",2];

	};
	case "leftOnLBSelChanged": {
		private _index = param [1,-1,[0]];
		if (_index isEqualTo -1) exitWith {};
		(parseSimpleArray (_shopItems lbData _index)) params ["","_price","_quantity"];
		(_display displayCtrl 1401) ctrlSetText str(_price);
		(_display displayCtrl 1400) ctrlSetText str(_quantity);
		_myItems lbSetCurSel -1;
	};
	case "rightOnLBSelChanged": {
		private _index = param [1,-1,[0]];
		if (_index isEqualTo -1) exitWith {};
		private _item = _myItems lbData _index;
		private _quantity = {_item == _x} count ([player] call DT_fnc_getItems);
		(_display displayCtrl 1401) ctrlSetText "0";
		(_display displayCtrl 1400) ctrlSetText str(_quantity);
		_shopItems lbSetCurSel -1;
	};
};