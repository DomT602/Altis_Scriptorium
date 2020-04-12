/*
	File: fn_fetchDetails.sqf
	Author: Dom
	Description: Fetches details on an item - needed for different classes
*/
params [
	["_className","",[""]]
];
if (_className isEqualTo "") exitWith {};

private _section = call {
	if (isClass(configFile >> "CfgMagazines" >> _className)) exitWith {"CfgMagazines"};
	if (isClass(configFile >> "CfgWeapons" >> _className)) exitWith {"CfgWeapons"};
	if (isClass(configFile >> "CfgVehicles" >> _className)) exitWith {"CfgVehicles"};
	if (isClass(configFile >> "CfgGlasses" >> _className)) exitWith {"CfgGlasses"};
};

private _config = configFile >> _section >> _className;
private _displayName = getText(_config >> "displayName");
private _picture = getText(_config >> "picture");

[_displayName,_picture];
