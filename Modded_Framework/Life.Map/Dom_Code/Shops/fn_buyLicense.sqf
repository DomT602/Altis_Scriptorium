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

if (_type in ["driver","pilot","truck"]) then {
	private _action = [
		format ["This test costs $%1 - are you ready to begin?",_price],
		format["License: %1",_name],
		"Start",
		"Cancel"
	] call BIS_fnc_guiMessage;
	if (_action) then {
		if ((player getVariable ["cash",0]) < _price) exitWith {[format["You do not have enough money for this license, it costs: $%1.",_price],"orange"] call DT_fnc_notify};
		["cash",-_price] call DT_fnc_handleMoney;
		[format["You paid $%1, your test will begin shortly.",_price]] call DT_fnc_notify;
		[_type] call DT_fnc_initTest;
	};
} else {
	private _action = [
		format ["This license costs $%1 - are you sure you want to buy it?",_price],
		format["License: %1",_name],
		"Start",
		"Cancel"
	] call BIS_fnc_guiMessage;
	if (_action) then {
		if ((player getVariable ["cash",0]) < _price) exitWith {[format["You do not have enough money for this license, it costs: $%1.",_price],"orange"] call DT_fnc_notify};
		["cash",-_price] call DT_fnc_handleMoney;
		client_licenses pushBack _type;
		[0] call DT_fnc_saveStatsPartial;
		[format["You bought a %1 license for $%2.",_name,_price],"green"] call DT_fnc_notify;
	};
};