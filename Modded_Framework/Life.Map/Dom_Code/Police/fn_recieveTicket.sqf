/*
	File: fn_recieveTicket.sqf
	Author: Dom
	Description: Recieves ticket details and opens the dialog
*/
params [
	["_bail",false,[true]],
	["_name","",[""]],
	["_reason","",[""]],
	["_value",0,[0]],
	["_officer","",[""]]
];

createDialog "DT_recieveTicket";
private _display = findDisplay 1016;
(_display displayCtrl 1100) ctrlSetStructuredText parseText _name;
(_display displayCtrl 1101) ctrlSetStructuredText parseText _reason;
(_display displayCtrl 1102) ctrlSetStructuredText parseText str(_value);
(_display displayCtrl 1103) ctrlSetStructuredText parseText _officer;

uiNamespace setVariable ["details",[_bail,_name,_reason,_value,_officer]];
uiNamespace setVariable ["cop",remoteExecutedOwner];