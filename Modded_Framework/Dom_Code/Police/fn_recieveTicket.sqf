/*
	File: fn_recieveTicket.sqf
	Author: Dom
	Description: Recieves ticket details and opens the dialog
*/
params [
	["_unit",objNull,[objNull]],
	["_amount",100,[0]],
	["_reason","",[""]]
];

createDialog "DT_recieveTicket";
ctrlSetText [-1,_amount];
uiNamespace setVariable ["Amount",_amount];
ctrlSetText [-1,_reason];
uiNamespace setVariable ["Cop",_unit];