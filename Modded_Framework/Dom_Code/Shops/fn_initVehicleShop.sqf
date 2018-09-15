/*
    File: fn_initVehicleShop.sqf
    Author: Dom
    Description: Initiliases the vehicle store
*/
params [
    ["_arguments",[],[[]]]
];
_arguments params [
    ["_shop","",[""]],
    ["_spawnPoints",[],[[]]]
];

disableSerialization;

if (_shop isEqualTo "" || {dialog}) exitWith {};

private _shopTitle = getText(missionConfigFile >> "Shops" >> "Vehicle" >> _shop >> "name");
private _conditions = getText(missionConfigFile >> "Shops" >> "Vehicle" >> _shop >> "conditions");
if !([_conditions] call DT_fnc_conditionChecker) exitWith {["You cannot use this shop.","orange"] call DT_fnc_notify};

createDialog "DT_vehShop";
ctrlSetText [1000,_shopTitle];
uiNamespace setVariable ["Veh_Shop_Details",[_shop,_spawnPoints]];

private _control = ((findDisplay 1015) displayCtrl 1500);
lbClear _control;

{
    _x params ["_className","_price","_conditions"];
    if ([_conditions] call DT_fnc_conditionChecker) then {
        private _name = getText(configfile >> "CfgVehicles" >> _className >> "displayName");
        private _picture = getText(configfile >> "CfgVehicles" >> _className >> "picture");
        _control lbAdd _name;
        _control lbSetPicture [(lbSize _control)-1,_picture];
        _control lbSetData [(lbSize _control)-1,_className];
        _control lbSetValue [(lbSize _control)-1,_price];
    };
} forEach (getArray(missionConfigFile >> "Shops" >> "Vehicle" >> _shop >> "vehicles"));

client_preview = "Land_HelipadEmpty_F" createVehicleLocal [130.881, 10103.191, 0];
client_target = createAgent ["Logic",position client_preview,[],0,"none"];
client_target attachTo [client_preview,client_cameraSettings select 3,""];

client_camera = "CAMERA" camCreate position client_preview;
client_camera cameraEffect ["Internal", "Back"];
client_camera camPrepareFocus [-1,-1];
client_camera camPrepareFov 0.75;
client_camera camCommitPrepared 0;
showcinemaBorder false;
["#(argb,8,8,3)color(0,0,0,1)",false,nil,0,[0,0.5]] call bis_fnc_textTiles;

["Clothing",[controlNull,0,0]] call DT_fnc_handleMouse;
preview_handle = addMissionEventHandler ["draw3D",{call DT_fnc_updateCamera}];

((findDisplay 1015) displayCtrl 1500) lbSetCurSel 0;
