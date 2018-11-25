/*
    File: fn_refreshInventory.sqf
    Author: Dom
    Description: Refreshes the inventory of the player in the shop display
*/

private _shop = uiNamespace getVariable ["Shop_Type",""];
private _inventoryList = ((findDisplay 1007) displayCtrl 6002);
lbClear _inventoryList;

private _inventoryInfo = ((findDisplay 1007) displayCtrl 6102);
_inventoryInfo ctrlSetStructuredText parseText "";

private _myItems = [];
private _itemList = [];
private _itemArray = [];

_myItems append primaryWeaponItems player;
_myItems append (uniformItems player);
_myItems append (vestItems player);
_myItems append (backpackItems player);

_itemArray pushBack (getArray(missionConfigFile >> "Shops" >> "Items" >> _shop >> "items"));
_itemArray pushBack (getArray(missionConfigFile >> "Shops" >> "Items" >> _shop >> "mags"));

{
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
                                _inventoryList lbAdd _name;
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
_inventoryList lbSetCurSel -1;