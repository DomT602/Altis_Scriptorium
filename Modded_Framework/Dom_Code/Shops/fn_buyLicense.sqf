/*
	File: fn_buyLicense.sqf
	Author: Dom
	Description: Buys selected license
*/
params [
	["_type","",[""]]
];

if !(isClass (missionConfigFile >> "Licenses" >> _type)) exitWith {};
if (_type in client_licenses) exitWith {["You already have this license."] call DT_fnc_notify};
private _name = getText(missionConfigFile >> "Licenses" >> _type >> "displayName");
private _price = getNumber(missionConfigFile >> "Licenses" >> _type >> "price");

if (client_cash < _price) exitWith {[format["You do not have enough money for this license, it costs: $%1",_price],"orange"] call DT_fnc_notify};
client_cash = client_cash - _price;
client_licenses pushBack _type;

[0] call DT_fnc_saveStatsPartial;
[1] call DT_fnc_saveStatsPartial;

[format["You bought a %1 license for $%2.",_name,_price],"green"] call DT_fnc_notify;

