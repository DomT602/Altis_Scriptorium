/*
	File: fn_openCraftMenu.sqf
	Author: Dom
	Description: Opens and populates the crafting menu
*/

createDialog "Crafting_Menu";
private _display = findDisplay 1003;
private _tree = _display displayCtrl 1500;

_tree tvAdd [[],"Items"];
_tree tvAdd [[],"Materials"];
_tree tvAdd [[],"Weapons"];
_tree tvAdd [[],"Vehicles"];

private _baseCfg = missionConfigFile >> "Crafting";
private _basicCfg = _baseCfg >> "Basic";
private _array = [];
_array pushBack (_basicCfg >> "Items");
_array pushBack (_basicCfg >> "Materials");
_array pushBack (_basicCfg >> "Weapons");
_array pushBack (_basicCfg >> "Vehicles");

if (player getVariable ["level_crafting",0] > 19) then {
	private _advancedCfg = _baseCfg >> "Advanced";
	_array pushBack (_advancedCfg >> "Items");
	_array pushBack (_advancedCfg >> "Materials");
	_array pushBack (_advancedCfg >> "Weapons");
	_array pushBack (_advancedCfg >> "Vehicles");
};

{
	private _list = _x;
	{
		_x params ["_class","_requiredMaterials","_location","_cost"];
		([_class] call DT_fnc_fetchDetails) params ["_text","_icon"];

		_tree tvAdd [[_index],_text];
		_tree tvSetPicture [[_index,_i],_icon];
		if (_location isEqualTo "" || player distance (getMarkerPos _location) < 10) then {
			_tree tvSetData [[_index,_i],(str([_class,_requiredMaterials,_cost]))];
		}  else {
			_tree tvSetColor [[_index,_i],[1,0,0,1]];
		};
	} forEach _list;
} forEach _array;

private _countBox = _display displayCtrl 1502;
for "_i" from 1 to 10 do {
	_countbox lbAdd str(_i);
};
ctrlEnable [2400,false];