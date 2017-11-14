/*
	File: fn_nameMenu.sqf
	Author: DomT602 (domt602@gmail.com)
	Description: Initial checks on the unit, brings up the dialog to write their name
*/

closeDialog 0;
createDialog "DT_SetPlayerTag";
params [
	["_unit",objNull,[objNull]]
];

if (isNull _unit || {isNil "_unit"} || {!isPlayer _unit}) exitWith {};

if (isNil {profileNamespace getVariable "DT_Names"}) then {
	profileNamespace setVariable ["DT_Names",[]];
};