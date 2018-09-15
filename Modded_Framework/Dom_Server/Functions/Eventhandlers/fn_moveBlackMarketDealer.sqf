/*
	File: fn_moveBlackMarketDealer.sqf
	Author: Dom
	Description: Handles moving the black market dealer to a new position
*/

(selectRandom [[[0,0,0],100],[[1,1,1],100]]) params ["_location","_direction"];
private _units = nearestObjects[(visiblePositionASL black_market_dealer),["CAManBase"],300];
_units = _units - [black_market_dealer];

if !(_units isEqualTo []) then {
	waitUntil {
		(count (nearestObjects[(visiblePositionASL black_market_dealer),["CAManBase"],300]) < 2)
	};
};

black_market_dealer setPosATL _location;
black_market_dealer setDir _direction;