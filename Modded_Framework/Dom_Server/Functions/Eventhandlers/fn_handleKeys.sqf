/*
    File: fn_handleKeys.sqf
    Author: Dom
    Description: Handles keys so on rejoining players get keys reassigned
*/
params [
    ["_uid","",[""]],
    ["_input",objNull,[objNull,[]]],
    ["_mode",0,[0]]
];

if (_uid isEqualTo "") exitWith {};

switch _mode do {
    case 0: { //houses
        private _arr = [];
        {
            if (!isNull _x && {!(_x isKindOf "House")}) then {
                _arr pushBack _x;
            };
        } forEach _input;
        _arr = _arr - [objNull];
        missionNamespace setVariable [format["keys_%1",_uid],_arr];
    };

    case 1: { //vehicles
        if (isNull _input || _input isKindOf "House") exitWith {};
        _arr = missionNamespace getVariable [format["keys_%1",_uid],[]];
        _arr pushBack _input;
        _arr = _arr - [objNull];
        missionNamespace setVariable [format["keys_%1",_uid],_arr];
    };
};