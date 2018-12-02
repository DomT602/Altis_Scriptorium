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
private _bItems = _basicCfg >> "Items";
private _bMaterials = _basicCfg >> "Materials";
private _bWeapons = _basicCfg >> "Weapons";
private _bVehicles = _basicCfg >> "Vehicles";

{
	private _index = _forEachIndex;
	for "_i" from 0 to (count(_x) - 1) do {
		private _curCfg = _x select _i;
		private _class = getText(_curCfg >> "productClass");
		private _requiredMaterials = getArray(_curCfg >> "requiredMaterials");
		private _location = getText(_curCfg >> "location");
		private _cost = getNumber(_curCfg >> "cost");
		([_class] call DT_fnc_fetchDetails) params ["_text","_icon"];

		_tree tvAdd [[_index],_text];
		_tree tvSetPicture [[_index,_i],_icon];
		if (_location isEqualTo "" || player distance (getMarkerPos _location) < 10) then {
			_tree tvSetData [[_index,_i],(str([_class,_requiredMaterials,_cost]))];
		}  else {
			_tree tvSetColor [[_index,_i],[1,0,0,1]];
		};
		
	};
} forEach [_bItems,_bMaterials,_bWeapons,_bVehicles];

if (player getVariable ["level_crafting",0] > 20) then {
	private _advancedCfg = _baseCfg >> "Advanced";
	private _aItems = _advancedCfg >> "Items";
	private _aMaterials = _advancedCfg >> "Materials";
	private _aWeapons = _advancedCfg >> "Weapons";
	private _aVehicles = _advancedCfg >> "Vehicles";

	{
		private _index = _forEachIndex;
		for "_i" from 0 to (count(_x) - 1) do {
			private _curCfg = _x select _i;
			private _class = getText(_curCfg >> "productClass");
			private _requiredMaterials = getArray(_curCfg >> "requiredMaterials");
			private _location = getText(_curCfg >> "location");
			private _cost = getNumber(_curCfg >> "cost");
			([_class] call DT_fnc_fetchDetails) params ["_text","_icon"];

			_tree tvAdd [[_index],_text];
			_tree tvSetPicture [[_index,_i],_icon];
			if (_location isEqualTo "" || player distance (getMarkerPos _location) < 10) then {
				_tree tvSetData [[_index,_i],(str([_class,_requiredMaterials,_cost]))];
			}  else {
				_tree tvSetColor [[_index,_i],[1,0,0,1]];
			};
		};
	} forEach [_aItems,_aMaterials,_aWeapons,_aVehicles];
};

private _countBox = _display displayCtrl 1502;
for "_i" from 1 to 10 do {
	_countbox lbAdd str(_i);
};
ctrlEnable [2400,false];