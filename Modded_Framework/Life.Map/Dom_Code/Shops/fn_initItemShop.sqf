/*
	File: fn_initItemShop.sqf
	Author: Dom
	Description: Initiliases item shops
*/
params [
	["_target",objNull,[objNull]]
];

private _shop = (MB_Interaction_Target getVariable ['itemShop','']);
if !(isClass(missionConfigFile >> "Shops" >> "Items" >> _shop)) exitWith {};
private _shopTitle = getText(missionConfigFile >> "Shops" >> "Items" >> _shop >> "name");

if !(createDialog "DT_itemShop") exitWith {};
uiNamespace setVariable ["shop",_shop];
uiNamespace setVariable ["funds",0];
uiNamespace setVariable ["vendor",_target];

["Item","GroundWeaponHolder_Scripted",[1160.126,904.986,0.85]] call DT_fnc_setupCamera;
private _display = findDisplay 1007;
(_display displayCtrl 1101) ctrlSetStructuredText parseText _shopTitle;
private _tree = _display displayCtrl 1500;
_tree tvAdd [[],"Items"];
_tree tvAdd [[],"Inventory"];

private _taxPercentage = 1 + ((gov_taxArray select 1) / 100);
{
	_x params ["_className","_buyPrice","","_conditions"];
	if (_buyPrice != -1 && {[_conditions] call DT_fnc_conditionChecker}) then {
		([_className] call DT_fnc_fetchDetails) params ["_name","_picture"];
		_tree tvAdd [[0],_name];
		private _count = (_tree tvCount [0]) - 1;
		_tree tvSetData[[0,_count],_className];
		_tree tvSetPicture[[0,_count],_picture];
		_tree tvSetValue[[0,_count],_buyPrice];

		if (isArray (configFile >> "CfgWeapons" >> _className >> "magazines")) then {
			if (_className in ["ItemCompass","ItemWatch","ItemMap","ItemGPS","Binocular","Rangefinder","Toolkit","NVGoggles","NVGoggles_OPFOR","NVGoggles_INDEP","D_Earpiece"]) exitWith {};

			private _itemArray = getArray(configFile >> "CfgWeapons" >> _className >> "magazines");
			{
				_x params ["_class","_price"];
				private _index = _itemArray findIf {_x == _class};
				if (_index != -1) then {
					([_class] call DT_fnc_fetchDetails) params ["_name","_picture"];
					_tree tvAdd [[0,_count],_name];
					private _countMag = (_tree tvCount [0,_count]) - 1;
					_tree tvSetData[[0,_count,_countMag],_class];
					_tree tvSetPicture[[0,_count,_countMag],_picture];
					_price = round(_price * _taxPercentage);
					_tree tvSetValue[[0,_count,_countMag],_price];
				};
			} forEach (getArray(missionConfigFile >> "Shops" >> "Items" >> _shop >> "mags"));
		};
	};
} forEach (getArray(missionConfigFile >> "Shops" >> "Items" >> _shop >> "items"));

private _itemList = [];
private _myItems = [player] call DT_fnc_getItems;

private _itemArray = (getArray(missionConfigFile >> "Shops" >> "Items" >> _shop >> "items"));
_itemArray append (getArray(missionConfigFile >> "Shops" >> "Items" >> _shop >> "mags"));

{
	private _item = _x;
	if !(_x in _itemList) then {
		private _index = _itemArray findIf {_item == (_x select 0)};
		if !(_index isEqualTo -1) then {
			private _config = _itemArray select _index;
			_config params ["_className","","_sellPrice","_conditions"];
			if !(_sellPrice isEqualTo -1) then {
				if ([_conditions] call DT_fnc_conditionChecker) then {
					_itemList pushBack _x;
					([_className] call DT_fnc_fetchDetails) params ["_name","_picture"];
					private _itemCount = {_className == _x} count _myItems;
					if (_itemCount > 1) then {
						_tree tvAdd [[1],format ["[%2] %1",_name,_itemCount]];
					} else {
						_tree tvAdd [[1],_name];
					};
					private _count = (_tree tvCount [1]) - 1;
					_tree tvSetData[[1,_count],_className];
					_tree tvSetPicture[[1,_count],_picture];
				};
			};
		};
	};
} forEach _myItems;