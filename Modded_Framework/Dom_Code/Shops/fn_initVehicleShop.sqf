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

if (_shop isEqualTo "" || {dialog}) exitWith {};

private _shopTitle = getText(missionConfigFile >> "Shops" >> "Vehicle" >> _shop >> "name");
private _conditions = getText(missionConfigFile >> "Shops" >> "Vehicle" >> _shop >> "conditions");
if !([_conditions] call DT_fnc_conditionChecker) exitWith {["You cannot use this shop.","orange"] call DT_fnc_notify};

createDialog "DT_vehShop";
ctrlSetText [1000,_shopTitle];
uiNamespace setVariable ["shopDetails",[_shop,_spawnPoints]];

private _display = findDisplay 1015;
private _control = (_display displayCtrl 1500);
(_display displayCtrl 1101) ctrlSetStructuredText parseText _shopTitle;
{
    _x params ["_className","_price","_conditions"];
    if ([_conditions] call DT_fnc_conditionChecker) then {
        private _name = getText(configfile >> "CfgVehicles" >> _className >> "displayName");
        private _picture = getText(configfile >> "CfgVehicles" >> _className >> "picture");
        _control lbAdd _name;
        private _index = (lbSize _control) - 1;
        _control lbSetPicture [_index,_picture];
        _control lbSetData [_index,_className];
        _control lbSetValue [_index,_price];
    };
} forEach (getArray(missionConfigFile >> "Shops" >> "Vehicle" >> _shop >> "vehicles"));

client_preview = "Land_HelipadEmpty_F" createVehicleLocal [197.97,10092.4,0.0570531];
client_target = createAgent ["Logic",position client_preview,[],0,"none"];
client_target attachTo [client_preview,client_cameraSettings select 3,""];

client_camera = "CAMERA" camCreate position client_preview;
client_camera cameraEffect ["Internal", "Back"];
client_camera camPrepareFocus [-1,-1];
client_camera camPrepareFov 0.75;
client_camera camCommitPrepared 0;
showCinemaBorder false;
["#(argb,8,8,3)color(0,0,0,1)",false,nil,0,[0,0.5]] call bis_fnc_textTiles;

["Clothing",[controlNull,0,0]] call DT_fnc_handleMouse;
preview_handle = addMissionEventHandler ["draw3D",{call DT_fnc_updateCamera}];

_control lbSetCurSel 0;
