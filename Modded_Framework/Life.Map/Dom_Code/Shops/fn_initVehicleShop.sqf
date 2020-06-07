/*
	File: fn_initVehicleShop.sqf
	Author: Dom
	Description: Initiliases the vehicle store
*/
params [
	["_shop","",[""]],
	["_spawnPoints",[],[[]]]
];

if (_shop isEqualTo "") exitWith {};
private _shopTitle = getText(missionConfigFile >> "Shops" >> "Vehicle" >> _shop >> "name");

createDialog "DT_vehShop";
uiNamespace setVariable ["shopDetails",[_shop,_spawnPoints]];

private _display = findDisplay 1008;
private _control = _display displayCtrl 1500;
(_display displayCtrl 1101) ctrlSetStructuredText parseText _shopTitle;

private _taxPercentage = 1 + ((gov_taxArray select 0) / 100);
{
	_x params ["_className","_price","_conditions"];
	if ([_conditions] call DT_fnc_conditionChecker) then {
		private _name = getText(configfile >> "CfgVehicles" >> _className >> "displayName");
		private _picture = getText(configfile >> "CfgVehicles" >> _className >> "picture");
		_control lbAdd _name;
		private _index = (lbSize _control) - 1;
		_control lbSetPicture [_index,_picture];
		_control lbSetData [_index,_className];
		_price = round(_price * _taxPercentage);
		_control lbSetValue [_index,_price];
	};
} forEach (getArray(missionConfigFile >> "Shops" >> "Vehicle" >> _shop >> "vehicles"));

["Vehicle","Land_HelipadEmpty_F",[1162.055,884.241,0.081]] call DT_fnc_setupCamera;
_control lbSetCurSel 0;