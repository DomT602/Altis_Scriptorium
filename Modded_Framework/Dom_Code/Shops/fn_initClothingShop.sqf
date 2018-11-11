/*
	File: fn_initClothingShop.sqf
	Author: Dom
	Description: Initiliases item shops
*/
params [
	["_shop","",[""]]
];
if (_shop isEqualTo "") exitWith {};
if !(isClass(missionConfigFile >> "Shops" >> "Clothing" >> _shop)) exitWith {};
private _conditions = getText(missionConfigFile >> "Shops" >> "Clothing" >> _shop >> "conditions");
if !([_conditions] call DT_fnc_conditionChecker) exitWith {["You cannot use this shop.","orange"] call DT_fnc_notify};

client_preview = "C_man_polo_2_F" createVehicleLocal [190.764,10128.4,0];
client_preview setUnitLoadout (getUnitLoadout player);
client_preview setFace (face player);

if !(createDialog "DT_clothingShop") exitWith {deleteVehicle client_preview};
uiNamespace setVariable ["Shop_Purchase",[["",-1],["",-1],["",-1],["",-1],["",-1]]];

client_target = createAgent ["Logic",position client_preview,[],0,"NONE"];//createVehicleLocal?
client_target attachTo [client_preview,client_cameraSettings select 3,""];

client_camera = "CAMERA" camCreate position client_preview;
client_camera cameraEffect ["Internal", "Back"];
client_camera camPrepareFocus [-1,-1];
client_camera camPrepareFov 0.35;
client_camera camCommitPrepared 0;
showCinemaBorder false;
["#(argb,8,8,3)color(0,0,0,1)",false,nil,0,[0,0.5]] call bis_fnc_textTiles;

["Clothing",[controlNull,0,0]] call DT_fnc_handleMouse;
preview_handle = addMissionEventHandler ["draw3D",{call DT_fnc_updateCamera}];

private _tree = ((findDisplay 1013) displayCtrl 1500);
_tree tvAdd [[],"Uniforms"];
_tree tvAdd [[],"Vests"];
_tree tvAdd [[],"Backpacks"];
_tree tvAdd [[],"Goggles"];
_tree tvAdd [[],"Headgear"];

private _uniforms = getArray(missionConfigFile >> "Shops" >> "Clothing" >> _shop >> "uniforms");
private _vests = getArray(missionConfigFile >> "Shops" >> "Clothing" >> _shop >> "vests");
private _backpacks = getArray(missionConfigFile >> "Shops" >> "Clothing" >> _shop >> "backpacks");
private _goggles = getArray(missionConfigFile >> "Shops" >> "Clothing" >> _shop >> "goggles");
private _headgear = getArray(missionConfigFile >> "Shops" >> "Clothing" >> _shop >> "headgear");

{
	private _index = _forEachIndex;
	private _itemArray = _x;
	{
		_x params ["_className","_buyPrice","_conditions"];
		if ([_conditions] call DT_fnc_conditionChecker) then {
			([_className] call DT_fnc_fetchDetails) params ["_name","_picture"];
			_tree tvAdd [[_index],_name];
			private _count = (_tree tvCount [_index]) - 1;
			_tree tvSetData[[_index,_count],_className];
			_tree tvSetPicture[[_index,_count],_picture];
			_tree tvSetValue[[_index,_count],_buyPrice];
		};
	} forEach _itemArray;
} forEach [_uniforms,_vests,_backpacks,_goggles,_headgear];