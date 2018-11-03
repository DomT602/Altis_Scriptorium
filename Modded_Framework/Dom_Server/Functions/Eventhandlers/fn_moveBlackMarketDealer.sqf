/*
	File: fn_moveBlackMarketDealer.sqf
	Author: Dom
	Description: Handles moving the black market dealer to a new position
*/

(selectRandom [[[0,0,0],100],[[1,1,1],100]]) params ["_location","_direction"];
private _currentPos = getPosATL black_market_dealer;

waitUntil {
	(playableUnits findIf {_x distance _currentPos < 300}) isEqualTo -1
};

black_market_dealer setPosATL _location;
black_market_dealer setDir _direction;