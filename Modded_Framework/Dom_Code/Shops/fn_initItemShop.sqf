/*
    File: fn_initItemShop.sqf
    Author: Dom
    Description: Initiliases item shops
*/
params [
    ["_shop","",[""]]
];
if (_shop isEqualTo "") exitWith {};
if (!isClass(missionConfigFile >> "Shops" >> "Items" >> _shop)) exitWith {};
private _shopTitle = getText(missionConfigFile >> "Shops" >> "Items" >> _shop >> "name");
private _conditions = getText(missionConfigFile >> "Shops" >> "Items" >> _shop >> "conditions");

if !([_conditions] call DT_fnc_conditionChecker) exitWith {["You cannot use this shop.","orange"] call DT_fnc_notify};

uiNamespace setVariable ["Shop_Type",_shop];

if !(createDialog "Item_Shop") exitWith {};

disableSerialization;

ctrlSetText[6200,_shopTitle];

ctrlShow [6001,false];
ctrlShow [6101,false];
ctrlShow [6201,false];
ctrlShow [6301,false];

private _display = findDisplay 1007;
private _primaryList = (_display displayCtrl 6000);
lbClear _primaryList;

{
    _x params ["_className","_buyPrice","","_conditions"];
    if ([_conditions] call DT_fnc_conditionChecker) then {
        ([_className] call DT_fnc_fetchDetails) params ["_name","_picture"];
        _primaryList lbAdd format ["%1",_name];
        _primaryList lbSetData[(lbSize _primaryList)-1,_className];
        _primaryList lbSetPicture[(lbSize _primaryList)-1,_picture];
        _primaryList lbSetValue[(lbSize _primaryList)-1,_buyPrice];
    };
} forEach (getArray(missionConfigFile >> "Shops" >> "Items" >> _shop >> "items"));

private _inventoryList = (_display displayCtrl 6002);
lbClear _inventoryList;

private _myItems = [];
private _itemList = [];
private _itemArray = [];

_myItems append (uniformItems player);
_myItems append (vestItems player);
_myItems append (backpackItems player);

_itemArray pushBack (getArray(missionConfigFile >> "Shops" >> "Items" >> _shop >> "items"));
_itemArray pushBack (getArray(missionConfigFile >> "Shops" >> "Items" >> _shop >> "mags"));
{//so this gets all items and checks if my item is in it, then same for magazines
    private _array = _x;
    {
        if !(_x isEqualTo "") then {
            if !(_x in _itemList) then {
                private _index = [_x,_array] call DT_fnc_findIndex;
                if !(_index isEqualTo -1) then {
                	private _config = _array select _index;
                	_config params ["_className","","_sellPrice","_conditions"];
                    if !(_sellPrice isEqualTo -1) then {
                        if ([_conditions] call DT_fnc_conditionChecker) then {
                            _itemList pushBack _x;
                            ([_className] call DT_fnc_fetchDetails) params ["_name","_picture"];
                            private _itemCount = {_x isEqualTo _className} count _config;
                            if (_itemCount > 1) then {
                                _inventoryList lbAdd format ["[%2] %1",_name,_itemCount];
                            } else {
                                _inventoryList lbAdd format ["%1",_name];
                            };
                            _inventoryList lbSetData[(lbSize _inventoryList)-1,_className];
                            _inventoryList lbSetPicture[(lbSize _inventoryList)-1,_picture];
                        };
                    };
                };
            };
        };
    } forEach _myItems;
} forEach _itemArray;