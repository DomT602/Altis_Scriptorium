/*
	File: fn_applyRespirator.sqf
	Author: Dom
	Description: Puts the target on a respirator
*/
params [
	["_unit",objNull,[objNull]]
];

//if !("D_Respirator_i" in (magazines player)) exitWith {["You have no respirator.","orange"] call DT_fnc_notify};

[player] remoteExec ["DT_fnc_onRespirator",_unit];
[_unit,"Respirator applied"] call DT_fnc_recordMedical;
private _name = ["someone",MB_Interaction_Target] call DT_fnc_findName;

[format["You applied a respirator to %1.",_name],"green"] call DT_fnc_notify;