/*
	File: fn_moveDrugDealer.sqf
	Author: Dom
	Description: Handles moving the drug dealer to a new position
*/

private _dealerPositions = [[0,0,0],[1,1,1]];
private _units = nearestObjects[(visiblePositionASL drug_dealer),["CAManBase"],300];
_units = _units - [drug_dealer];

if !(_units isEqualTo []) then {
	waitUntil {
		(count (nearestObjects[(visiblePositionASL drug_dealer),["CAManBase"],300]) < 2)
	};
};

drug_dealer setPosATL (selectRandom _dealerPositions);