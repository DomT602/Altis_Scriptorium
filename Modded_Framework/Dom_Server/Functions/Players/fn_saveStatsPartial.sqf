/*
    File: fn_saveStatsPartial.sqf
	Author: Dom
	Description: Recieves request from client to update specific values
*/

params [
    ["_uid","",[""]],
    ["_side","civ",[""]],
    ["_mode",-1,[0]],
    ["_data",-1,[0,[],false]],
    ["_aditData",-1,[0,[]]]
];

if (_uid isEqualTo "") exitWith {};

switch _mode do {
    case 0: { //for money
        [format["updateMoney:%1:%2:%3",_data,_aditData,_uid],1] call MySQL_fnc_DBasync;
    };

    case 1: { //for licenses
        [format["updateLicenses:%1:%2",_data,_uid],1] call MySQL_fnc_DBasync;
    };

    case 2: { //for gear
        switch _side do {
            case "cop": {[format["updateCopGear:%1:%2",_data,_uid],1] call MySQL_fnc_DBasync;};
            case "civ": {[format["updateMedicGear:%1:%2",_data,_uid],1] call MySQL_fnc_DBasync;};
            case "medic": {[format["updateCivGear:%1:%2",_data,_uid],1] call MySQL_fnc_DBasync;};
        };
    };

    case 3: { //for position
        _data = if (count _data isEqualTo 3) then {_data} else {[0,0,0]};
        [format["updatePosition:%1:%2",_data,_uid],1] call MySQL_fnc_DBasync;
    };

    case 4: {
        [format["updateJail:%1:%2",_data,_uid],1] call MySQL_fnc_DBasync;
    };

    case 5: { //for keys
        [_uid,_data,0] call server_fnc_handleKeys;
    };

    case 6: { //for hunger, health & medical
        [format["updateStats:%1:%2",_data,_uid],1] call MySQL_fnc_DBasync;
    };

    case 7: { //for phone 
        [format["updatePhone:%1:%2:%3",_data,_aditData,_uid],1] call MySQL_fnc_DBasync;
    };

    case 8: {
        [format["updateSkills:%1:%2",_data,_uid],1] call MySQL_fnc_DBasync;
    };
};