/*
	File: fn_setupPhone.sqf
	Author: Dom
	Description: Sets extra stuff for EMS/Cops
*/
if !(phone_apps isEqualTo []) then {
	phone_apps = [];
};

private _faction = player getVariable ["faction","civ"];
if (_faction isEqualTo "cop") then {
	phone_apps pushback ["nromal_icon","selected_icon",{closeDialog 0; ["police"] call DT_fnc_govFreq}];
	phone_apps pushback ["","",{}];
} else {
	if (_faction isEqualTo "medic") then {
		phone_apps pushback ["","",{}];
		phone_apps pushback ["","",{}];
	};
};