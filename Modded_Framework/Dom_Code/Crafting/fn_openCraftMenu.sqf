/*
	File: fn_openCraftMenu.sqf
	Author: Dom
	Description: Opens and populates the crafting menu
*/

createDialog "Crafting_Menu";
private _display = findDisplay 1003;
private _control = _display displayCtrl 1500;

private _basicOptions = missionConfigFile >> "Crafting" >> "Basic";
for "_i" from 0 to count(_basicOptions) - 1 do {
	private _curCfg = _basicOptions select _i;
	private _class = getText(_curCfg >> "productClass");
	private _requiredMaterials = getArray(_curCfg >> "requiredMaterials");
	private _location = getText(_curCfg >> "location");
	private _cost = getNumber(_curCfg >> "cost");
	([_class] call DT_fnc_fetchDetails) params ["_text","_icon"];

	if !(_location isEqualTo "") then {
		if (player distance (getMarkerPos _location) < 30) then {
			_control lbAdd format["%1",_text];
			_control lbSetData [(lbSize 1500) - 1,(str([_class,_requiredMaterials,_cost]))];
			_control lbSetPicture [(lbSize 1500) - 1,_icon];
		};
	} else {
		_control lbAdd format["%1",_text];
		_control lbSetData [(lbSize 1500) - 1,(str([_class,_requiredMaterials,_cost]))];
		_control lbSetPicture [(lbSize 1500) - 1,_icon];
	};
};

if (player getVariable ["level_crafting",0] > 20) then {
	private _advancedOptions = missionConfigFile >> "Crafting" >> "Advanced";
	for "_i" from 0 to count(_advancedOptions) - 1 do {
		private _curCfg = _advancedOptions select _i;
		private _class = getText(_curCfg >> "productClass");
		private _requiredMaterials = getArray(_curCfg >> "requiredMaterials");
		private _location = getText(_curCfg >> "location");
		private _cost = getNumber(_curCfg >> "cost");
		([_class] call DT_fnc_fetchDetails) params ["_text","_icon"];

		if !(_location isEqualTo "") then {
			if (player distance (getMarkerPos _location) < 30) then {
				_control lbAdd format["%1",_text];
				_control lbSetData [(lbSize 1500) - 1,(str([_class,_requiredMaterials,_cost]))];
				_control lbSetPicture [(lbSize 1500) - 1,_icon];
			};
		} else {
			_control lbAdd format["%1",_text];
			_control lbSetData [(lbSize 1500) - 1,(str([_class,_requiredMaterials,_cost]))];
			_control lbSetPicture [(lbSize 1500) - 1,_icon];
		};
	};
};

private _countBox = _display displayCtrl 1502;
for "_i" from 1 to 10 do {
	_countbox lbAdd str(_i);
};
ctrlEnable [2400,false];