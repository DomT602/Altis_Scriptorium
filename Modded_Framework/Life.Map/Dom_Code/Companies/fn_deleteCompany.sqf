/*
	File: fn_deleteCompany.sqf
	Author: Dom
	Description: Prompts the owner to check if he wants to delete his menu
*/
if !(player getVariable ["companyRank",-1] isEqualTo 3) exitWith {};
private _action = [
	"Are you sure you want to disband your company, you will lose any remaining funds, and make all your employees redundant.", //message
	"Disband company",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;

if (_action) then {
	[player getVariable "company"] remoteExecCall ["DB_fnc_deleteCompany",2]
} else {
   ["You did not disband your company."] call DT_fnc_notify;
};