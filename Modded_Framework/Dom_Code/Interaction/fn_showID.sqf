/*
	File: fn_showID.sqf
	Author: Dom
	Description: Shows the ID of the sender
*/
params [
	["_name","",[""]],
	["_faction","",[""]]
];

private _fnc_showDetails = {
	params ["_name","_faction"];
	655 cutRsc ["DT_ID","PLAIN"];
	private _display = uiNamespace getVariable ["DT_ID",displayNull];
	(_display displayCtrl 1000) ctrlSetText _name;
	(_display displayCtrl 1001) ctrlSetText _faction;
	[
		{
			655 cutText ["","PLAIN"];
		},
		0,
		5
	] call CBA_fnc_waitAndExecute;
};

private _display = uiNamespace getVariable ["DT_ID",displayNull];
if (isNull _display) then {
	[_name,_faction] call _fnc_showDetails;
} else {
	[
		{
			isNull (uiNamespace getVariable ["DT_ID",displayNull])
		},
		{
			(_this select 0) call (_this select 1)
		},
		[[_name,_faction],_fnc_showDetails]
	] call CBA_fnc_waitUntilAndExecute;
};