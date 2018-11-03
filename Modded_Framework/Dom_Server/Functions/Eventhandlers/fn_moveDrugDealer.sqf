/*
	File: fn_moveDrugDealer.sqf
	Author: Dom
	Description: Handles moving the drug dealer to a new position
*/

(selectRandom [[[0,0,0],100],[[1,1,1],100]]) params ["_location","_direction"];
private _currentPos = getPosATL drug_dealer;

waitUntil {
	(playableUnits findIf {_x distance _currentPos < 300}) isEqualTo -1
};

drug_dealer setPosATL _location;
drug_dealer setDir _direction;