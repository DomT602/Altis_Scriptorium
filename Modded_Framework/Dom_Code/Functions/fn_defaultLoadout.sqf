/*
    File: fn_defaultLoadout.sqf
    Author: Dom
    Description: Loads default gear for selected faction.
*/

params [
    ["_faction","civ",[""]]
];

removeAllWeapons player;
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;

{
    player unassignItem _x;
    player removeItem _x;
} forEach (assignedItems player);

if !(hmd player isEqualTo "") then {
    player unlinkItem (hmd player);
};

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "PS_Phone";

if (_faction isEqualTo "civ") exitWith {
    private _clothing = ["D_FeelsBadManShorts"];
    player addUniform selectRandom _clothing;
};

if (_faction isEqualTo "medic") exitWith {
    (switch (player getVariable ["medic_rank",0]) do {
        case 1: {["PS_EMS_Probie","","PS_Invisible_Backpack"]};
        case 2: {};
        case 3: {};
        case 4: {};
        case 5: {};
        case 6: {};
        case 7: {};
    }) params ["_uniform","_vest","_backpack"];
    player addUniform _uniform;
    player addVest _vest;
    player addBackpack _backpack;
};


if (_faction isEqualTo "cop") exitWith {
    (switch (player getVariable ["cop_rank",0]) do {
        case 1: {["D_Police_Cadet","PoliceVest","AM_PoliceBelt"]};
        case 2: {["D_Police_Officer","PoliceVest","AM_PoliceBelt"]};
        case 3: {["D_Police_Corporal","PoliceVest","AM_PoliceBelt"]};
        case 4: {["D_Police_Sergeant","PoliceVest","AM_PoliceBelt"]};
        case 5: {["D_Police_Lieutenant","PoliceVest","AM_PoliceBelt"]};
        case 6: {["D_Police_Captain","PoliceVest","AM_PoliceBelt"]};
        case 7: {["D_Police_AsstChief","PoliceVest","AM_PoliceBelt"]};
    }) params ["_uniform","_vest","_backpack"];
    player addUniform _uniform;
    player addVest _vest;
    player addBackpack _backpack;
};  

