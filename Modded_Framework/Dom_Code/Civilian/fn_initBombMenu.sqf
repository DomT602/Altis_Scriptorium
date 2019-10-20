/*
	File: fn_initBombMenu.sqf
	Author: Dom
	Description: Does some error checks before starting the jailbreak process
*/
if (typeOf MB_Interaction_Target isEqualTo "Land_PrisonGate") then {
	if (jail_bombPlanted) exitWith {["There is already a bomb planted.","orange"] call DT_fnc_notify};
	if (MB_Interaction_Target animationPhase "door_3_slide" > 0.5) exitWith {["The gate is already open.","orange"] call DT_fnc_notify};
	createDialog "DT_bombTimer";
} else {
	//bank
};