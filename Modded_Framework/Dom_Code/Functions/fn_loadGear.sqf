/*
    File: fn_loadGear.sqf
    Author: Dom
    Description: Loads saved gear.
*/
removeAllItems player;
removeAllContainers player;
removeAllWeapons player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
if !(hmd player isEqualTo "") then {
    player unlinkItem (hmd player);
};

if (client_gear isEqualTo []) then {
    [(player getVariable ["faction","civ"])] call DT_fnc_defaultLoadout;
};
client_gear params [
    ["_clothing",[],[[]]],
    ["_items",[],[[]]],
    ["_weapons",[],[[]]],
    ["_mags",[],[[]]],
    ["_pItems",[]],
    ["_hItems",[]]
];

_clothing params ["_uniform","_vest","_backpack","_goggles","_headgear"];
if !(_uniform isEqualTo "") then {player addUniform _uniform};
if !(_vest isEqualTo "") then {player addVest _vest};
if !(_backpack isEqualTo "") then {player addBackpack _backpack};
if !(_goggles isEqualTo "") then {player addGoggles _goggles};
if !(_headgear isEqualTo "") then {player addHeadgear _headgear};

_items params ["_uItems","_vItems","_bItems","_aItems"];
_mags params ["_uMags","_vMags","_bMags"];
{player addItemToUniform _x} forEach _uItems;
{(uniformContainer player) addItemCargoGlobal [_x,1]} forEach _uMags;
{player addItemToVest _x} forEach _vItems;
{(vestContainer player) addItemCargoGlobal [_x,1]} forEach _vMags;
{player addItemToBackpack _x} forEach _bItems;
{(backpackContainer player) addItemCargoGlobal [_x,1]} forEach _bMags;
{player linkItem _x} forEach _aItems;

{
    if !(_x isEqualTo "") then {
        player addPrimaryWeaponItem _x
    };
} forEach _pItems;

{
    if !(_x isEqualTo "") then {
        player addHandgunItem _x
    };
} forEach _hItems;

_weapons params [["_primary","",[""]],["_secondary","",[""]],["_handgun","",[""]]];
if !(_primary isEqualTo "") then {player addWeapon _primary};
if !(_secondary isEqualTo "") then {player addWeapon _secondary};
if !(_handgun isEqualTo "") then {player addWeapon _handgun};