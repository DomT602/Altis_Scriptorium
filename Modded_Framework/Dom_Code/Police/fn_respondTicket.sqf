/*
	File: fn_respondTicket.sqf
	Author: Dom
	Description: Responds to the ticket
*/
params [
	["_choice",false,[false]]
];

private _value = uiNamespace getVariable ["Amount",100];
private _cop = uiNamespace getVariable ["Cop",objNull];
closeDialog 0;

if (_choice) then {
	if (client_cash > _value) then {
		client_cash = client_cash - _value;
		[format["Ticket of %1 was paid.",_value],"green"] remoteExecCall ["DT_fnc_notify",_cop];
	} else {
		[format["Ticket of %1 could not be paid - not enough money.",_value]] remoteExecCall ["DT_fnc_notify",_cop];
	};
} else {
	[format["Ticket of %1 was refused.",_value],"red"] remoteExecCall ["DT_fnc_notify",_cop];
};