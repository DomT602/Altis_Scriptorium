/*
	File: fn_moveDealer.sqf
	Author: Dom
	Description: Handles moving a dealer to a new position
*/
params [
	["_object",objNull,[objNull]]
];

private _locations = getArray(missionConfigFile >> "Misc" >> "dealerPositions");
private _index = -1;
private _max = (count _locations) - 1;
while {_index isEqualTo -1} do {
	private _random = round(random _max);
	if !(_random in dealer_positions) then {
		_index = _random;
	};
};
(_locations select _index) params ["_location","_direction"];
private _currentPos = getPosATL _object;

waitUntil {
	(playableUnits findIf {_x distance _currentPos < 300}) isEqualTo -1
};

dealer_positions set [(if (_object isEqualTo drug_dealer) then {0} else {1}),_index];
publicVariable "dealer_positions";
_object setPosATL _location;
_object setDir _direction;