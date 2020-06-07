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

if !(createDialog "DT_clothingShop") exitWith {};
uiNamespace setVariable ["purchase",[["",-1],["",-1],["",-1],["",-1],["",-1]]];

["Clothing","D_Base_Civ_2",[1158.886,902.669,0.081]] call DT_fnc_setupCamera;
private _tree = (findDisplay 1013) displayCtrl 1500;
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

private _taxPercentage = 1 + ((gov_taxArray select 1) / 100);
{
	private _index = _forEachIndex;
	private _itemArray = _x;
	{
		_x params ["_className","_buyPrice","_conditions"];
		if ([_conditions] call DT_fnc_conditionChecker) then {
			([_className] call DT_fnc_fetchDetails) params ["_name","_picture"];
			_tree tvAdd [[_index],_name];
			private _count = (_tree tvCount [_index]) - 1;
			_tree tvSetData [[_index,_count],_className];
			_tree tvSetPicture [[_index,_count],_picture];
			_buyPrice = round(_buyPrice * _taxPercentage);
			_tree tvSetValue [[_index,_count],_buyPrice];
		};
	} forEach _itemArray;
} forEach [_uniforms,_vests,_backpacks,_goggles,_headgear];