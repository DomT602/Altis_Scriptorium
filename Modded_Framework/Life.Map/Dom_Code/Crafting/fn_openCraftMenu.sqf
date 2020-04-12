/*
	File: fn_openCraftMenu.sqf
	Author: Dom
	Description: Opens and populates the crafting menu
*/

createDialog "DT_craftingMenu";
private _display = findDisplay 1003;
private _tree = _display displayCtrl 1500;

_tree tvAdd [[],"Items"];
_tree tvAdd [[],"Materials"];
_tree tvAdd [[],"Weapons"];
_tree tvAdd [[],"Vehicles"];

private _baseCfg = missionConfigFile >> "Crafting";
private _basicCfg = _baseCfg >> "Basic";
private _array = [];
_array pushBack getArray(_basicCfg >> "items");
_array pushBack getArray(_basicCfg >> "materials");
_array pushBack getArray(_basicCfg >> "weapons");
_array pushBack getArray(_basicCfg >> "vehicles");

if (player getVariable ["level_crafting",0] > 19) then {
	private _advancedCfg = _baseCfg >> "Advanced";
	_array pushBack getArray(_advancedCfg >> "items");
	_array pushBack getArray(_advancedCfg >> "materials");
	_array pushBack getArray(_advancedCfg >> "weapons");
	_array pushBack getArray(_advancedCfg >> "vehicles");
};

{
	private _index = _forEachIndex;
	if (_index > 3) then {_index = _index - 4};
	private _list = _x;
	{
		private _count = _forEachIndex;
		_x params ["_class","_requiredMaterials","_requiredCount","_conditions","_cost"];
		([_class] call DT_fnc_fetchDetails) params ["_text","_icon"];

		_tree tvAdd [[_index],_text];
		_tree tvSetPicture [[_index,_count],_icon];
		if ([_conditions] call DT_fnc_conditionChecker) then {
			_tree tvSetData [[_index,_count],str(_x)];
		}  else {
			_tree tvSetColor [[_index,_count],[1,0,0,1]];
			_tree tvSetData [[_index,_count],str([""])];
		};
	} forEach _list;
} forEach _array;

private _countBox = _display displayCtrl 2100;
for "_i" from 1 to 10 do {
	_countbox lbAdd str(_i);
};
ctrlEnable [1600,false];