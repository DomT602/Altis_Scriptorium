/*
	File: fn_startSirens.sqf
	Author: Dom
	Description: Starts and monitors the sirens
*/

params [
	["_vehicle",objNull,[objNull]],
	["_type",0,[0]]
];

switch _type do {
	case 0: {
		while {_vehicle getVariable ["siren",false]} do {
			if (!alive _vehicle || !(_vehicle getVariable ["siren",false])) exitWith {};
			_vehicle say3D ["Whelen_Siren1",1000,1];
			sleep 5;
			if (!alive _vehicle || !(_vehicle getVariable ["siren",false])) exitWith {};
			_vehicle say3D ["Whelen_Siren2",1000,1];
			sleep 5;
			if (!alive _vehicle || !(_vehicle getVariable ["siren",false])) exitWith {};
			_vehicle say3D ["Whelen_Siren3",1000,1];
			sleep 5;
		};
	};
	case 1: {
		while {_vehicle getVariable ["siren",false]} do {
			if (!alive _vehicle || !(_vehicle getVariable ["siren",false])) exitWith {};
			_vehicle say3D ["Siren1",1000,1];
			sleep 10;
			if (!alive _vehicle || !(_vehicle getVariable ["siren",false])) exitWith {};
			_vehicle say3D ["Siren2",1000,1];
			sleep 4;
			if (!alive _vehicle || !(_vehicle getVariable ["siren",false])) exitWith {};
			_vehicle say3D ["Siren3",1000,1];
			sleep 4;
		};
	};
	case 2: {
		//ss2000 thing
	};
};

/*
	In class of UserActions for a vehicle (code 1):
		...
		condition="driver this isEqualTo player && (this getVariable ['lightbar',false])";
		statement = "this setVariable ['lightbar',false,true]; this setVariable ['siren',false,true];";

		In class of UserActions for a vehicle (code 3):
		...
		condition="driver this isEqualTo player && !(this getVariable ['siren',false])";
		statement = "if !(_vehicle getVariable ['lightbar',false] then {[this] spawn DT_fnc_genericLightbar}; [this] spawn DT_fnc_genericSiren;";

		In class of UserActions for a vehicle (code 2):
		...
		condition="driver this isEqualTo player && ((!this getVariable ['lightbar',false]) || ((this getVariable ['lightbar',false]) && (this getVariable ['siren',false])))";
		statement = "this setVariable ['siren',false,true]; if !(_vehicle getVariable ['lightbar',false] then {[this] spawn DT_fnc_genericLightbar};";
*/