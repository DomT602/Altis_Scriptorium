/*
	File: fn_buyLicense.sqf
	Author: Dom
	Description: Buys selected license
*/

params [
	["_type","",[""]]
];

if !(isClass (missionConfigFile >> "Licenses" >> _type)) exitWith {};
private _name = getText(missionConfigFile >> "Licenses" >> _type >> "displayName");
private _price = getNumber(missionConfigFile >> "Licenses" >> _type >> "price");
private _varName = format["license_%1",(getText(missionConfigFile >> "Licenses" >> _type >> "variable"))];

if (client_cash < _price) exitWith {[format["You do not have enough money for this license, it costs: $%1",str(_price)],"orange"] call DT_fnc_notify};
client_cash = client_cash - _price;

[0] call DT_fnc_saveStatsPartial;
[1] call DT_fnc_saveStatsPartial;

[format["You bought a %1 license for %2.",_name,str(_price)],"green"] call DT_fnc_notify;
missionNamespace setVariable [_varName,1];
