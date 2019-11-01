/*
	File: fn_questionLocation.sqf
	Author: Dom
	Description: Ask where the drug dealer or black market dealer could be
*/
params [
	["_blackMarket",false,[false]],
	["_unit",objNull,[objNull]]
];

if (CBA_missionTime - (_unit getVariable ["dealerTimer",0]) < 300) exitWith {["I can't remember anything right now...","red"] call DT_fnc_notify};
if ((player getVariable ["cash",0]) < 100) exitWith {
	["I'm not telling you anything unless you buy me a few drinks! ($100)"] call DT_fnc_notify;
};
["cash",-100] call DT_fnc_handleMoney;
_unit setVariable ["dealerTimer",CBA_missionTime];
if (random 4 < 1) exitWith {["Thanks for the drink - but I don't actually know any information."] call DT_fnc_notify;};

private _locations = getArray(missionConfigFile >> "Misc" >> "dealerPositions");
private _toShow = [(dealer_positions select _blackMarket)];
private _max = (count _locations) - 1;
while {count _toShow < 3} do {
	private _random = round(random _max);
	_toShow pushBackUnique _random;
};

private _marks = [];
{
	(_locations select _x) params ["_pos"];
	_pos = _pos vectorAdd [random [-30,0,30],random [-30,0,30],0];
	private _marker = createMarkerLocal [format["dealerLocation%1",_forEachIndex],_pos];
	_marks pushBack _marker;
	_marker setMarkerShapeLocal "ELLIPSE";
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerSizeLocal [50,50];
	_marker setMarkerBrushLocal "SolidFull";
	_marker setMarkerAlphaLocal 0.5;
} forEach _toShow;
["I've marked where I've heard the dealer might be.","green"] call DT_fnc_notify;
["The markers will last 5 minutes."] call DT_fnc_notify;

[
	{
		{
			deleteMarkerLocal _x;
		} forEach _this;
	},
	_marks,
	300
] call CBA_fnc_waitAndExecute;