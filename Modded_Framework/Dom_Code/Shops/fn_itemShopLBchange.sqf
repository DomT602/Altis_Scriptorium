/*
	File: fn_itemShopLBChange.sqf
	Author: Dom
	Description: Called on the LB change
*/
params [
	["_evhStuff",[],[[]]],
	["_mode",-1,[0]]
];
_evhStuff params [
	["_control",controlNull,[controlNull]],
	["_index",-1,[0]]
];
if (_mode isEqualTo -1 || {isNull _control}) exitWith {closeDialog 0};
private _shop = uiNamespace getVariable ["Shop_Type",""];
if (_index isEqualTo -1) exitWith {["Nothing selected.","orange"] call DT_fnc_notify};
private _display = findDisplay 1007;

switch _mode do {
	case 0: {
		private _primaryInfo = (_display displayCtrl 6100);
		private _price = _control lbValue _index;
		private _item = _control lbData _index;
		if (_price > client_cash) then {
			_primaryInfo ctrlSetStructuredText parseText format ["<t size='0.7'>Price: <t color='#ff0000'>$%1</t><br/>You lack: <t color='#8cff9b'>$%2</t></t>",str(_price),str(_price - client_cash)];
		} else {
			_primaryInfo ctrlSetStructuredText parseText format ["<t size='0.7'>Price: <t color='#8cff9b'>$%1</t></t>",str(_price)];
		};
		if (isArray (configFile >> "CfgWeapons" >> _item >> "magazines")) then {
			if (_item in ["ItemCompass","ItemWatch","ItemMap","ItemGPS","Binocular","Rangefinder","Toolkit","NVGoggles","NVGoggles_OPFOR","NVGoggles_INDEP","D_Earpiece"]) exitWith { //add stupid items here
				(_display displayCtrl 6001) ctrlShow false;
				(_display displayCtrl 6101) ctrlShow false;
				(_display displayCtrl 6201) ctrlShow false;
				(_display displayCtrl 6301) ctrlShow false;
			};
			(_display displayCtrl 6001) ctrlShow true;
			(_display displayCtrl 6101) ctrlShow true;
			(_display displayCtrl 6201) ctrlShow true;
			(_display displayCtrl 6301) ctrlShow true;
			private _itemArray = getArray(configFile >> "CfgWeapons" >> _item >> "magazines");
			private _secondaryList = (_display displayCtrl 6001);
			lbClear _secondaryList;
			{
				_x params ["_className","_buyPrice"];
				private _count = {_x == _className} count _itemArray;
				if (_count > 0) then {
					private _name = getText(configFile >> "CfgMagazines" >> _className >> "displayName");
					private _picture = getText(configFile >> "CfgMagazines" >> _className >> "picture");
					_secondaryList lbAdd _name;
					_secondaryList lbSetData[(lbSize _secondaryList)-1,_className];
					_secondaryList lbSetPicture[(lbSize _secondaryList)-1,_picture];
					_secondaryList lbSetValue[(lbSize _secondaryList)-1,_buyPrice];
				};
			} forEach (getArray(missionConfigFile >> "Shops" >> "Items" >> _shop >> "mags"));
		} else {
			(_display displayCtrl 6001) ctrlShow false;
			(_display displayCtrl 6101) ctrlShow false;
			(_display displayCtrl 6201) ctrlShow false;
			(_display displayCtrl 6301) ctrlShow false;
		};
	};
	case 1: {
		private _secondaryInfo = (_display displayCtrl 6101);
		private _price = _control lbValue _index;
		private _item = _control lbData _index;
		if (_price > client_cash) then {
			_secondaryInfo ctrlSetStructuredText parseText format ["<t size='0.7'>Price: <t color='#ff0000'>$%1</t><br/>You lack: <t color='#8cff9b'>$%2</t></t>",str(_price),str(_price - client_cash)];
		} else {
			_secondaryInfo ctrlSetStructuredText parseText format ["<t size='0.7'>Price: <t color='#8cff9b'>$%1</t></t>",str(_price)];
		};
	};

	case 2: {
		private _inventoryInfo = (_display displayCtrl 6102);
		private _item = _control lbData _index;
		private _itemArray = getArray(missionConfigFile >> "Shops" >> "Items" >> _shop >> "items");
		private _index2 = [_item,_itemArray] call DT_fnc_findIndex;
		(_itemArray select _index2) params ["","",["_sellPrice",0,[0]]];
		_inventoryInfo ctrlSetStructuredText parseText format ["<t size='0.7'>Price: <t color='#8cff9b'>$%1</t></t>",str(_sellPrice)];
		_control lbSetValue[_index,_sellPrice];
	};
};

