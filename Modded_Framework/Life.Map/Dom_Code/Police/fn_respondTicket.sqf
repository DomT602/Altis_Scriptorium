/*
	File: fn_respondTicket.sqf
	Author: Dom
	Description: Responds to the ticket
*/
params [
	["_choice",false,[false]]
];

private _data = uiNamespace getVariable ["details",[]];
private _value = _data select 3;
private _cop = uiNamespace getVariable ["cop",-1];
closeDialog 0;

if (_choice) then {
	private _payType = "none";
	if ((player getVariable ["cash",0]) > _value) then {
		_payType = "cash";
	} else {
		if ((player getVariable ["bank",0]) > _value) then {
			_payType = "bank";
		};
	};

	if (_payType isEqualTo "none") exitWith {
		[format["Ticket of $%1 could not be paid - not enough money.",_value]] remoteExecCall ["DT_fnc_notify",_cop];
		["You couldn't pay the ticket, you don't have enough money.","orange"] call DT_fnc_notify;
	};
	
	[_payType,-_value] call DT_fnc_handleMoney;
	[format["Ticket of $%1 was successfully paid.",_value],"green"] remoteExecCall ["DT_fnc_notify",_cop];
	["You paid the ticket.","green"] call DT_fnc_notify;
	if !(_data select 0) then {
		_data deleteAt 0;
		_data remoteExecCall ["DB_fnc_insertTicket",2];
	};
} else {
	[format["Ticket of $%1 was refused.",_value],"red"] remoteExecCall ["DT_fnc_notify",_cop];
	["You refused to pay the ticket.","red"] call DT_fnc_notify;
};
