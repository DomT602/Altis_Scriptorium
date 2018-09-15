/*
    File: fn_conditionChecker.sqf
    Author: Dom
    Description: Checks conditions on items in shops
*/
params [
	["_conditions","",[""]]
];

if (_conditions isEqualTo "") exitWith {true};

private _return = false;
if (call compile _conditions) then {
    _return = true;
};
_return