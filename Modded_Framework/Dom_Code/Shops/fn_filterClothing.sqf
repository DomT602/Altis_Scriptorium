/*
    File: fn_filterClothing.sqf
    Author: Dom
    Description: Previews selected clothing
*/
params [
    ["_control",controlNull,[controlNull]],
    ["_index",0,[0]]
];
if (isNull _control) exitWith {};

uiNamespace setVariable ["Shop_Filter",_index];
private _shop = uiNamespace getVariable ["Shop_Type","civ"];

private _selections = switch _index do {
    case 0: {getArray(missionConfigFile >> "Shops" >> "Clothing" >> _shop >> "uniforms")};
    case 1: {getArray(missionConfigFile >> "Shops" >> "Clothing" >> _shop >> "vests")};
    case 2: {getArray(missionConfigFile >> "Shops" >> "Clothing" >> _shop >> "backpacks")};
    case 3: {getArray(missionConfigFile >> "Shops" >> "Clothing" >> _shop >> "goggles")};
    case 4: {getArray(missionConfigFile >> "Shops" >> "Clothing" >> _shop >> "headgear")};
};

private _list = ((findDisplay 1013) displayCtrl 1500);
lbClear _list;
{
    _x params ["_className","_buyPrice","_conditions"];
    if ([_conditions] call DT_fnc_conditionChecker) then {
        ([_className] call DT_fnc_fetchDetails) params ["_name","_picture"];
        _list lbAdd format ["%1",_name];
        _list lbSetData[(lbSize _list)-1,_className];
        _list lbSetPicture[(lbSize _list)-1,_picture];
        _list lbSetValue[(lbSize _list)-1,_buyPrice];
    };
} forEach _selections;