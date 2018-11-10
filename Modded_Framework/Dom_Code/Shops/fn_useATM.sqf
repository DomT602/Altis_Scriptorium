/*
	File: fn_useATM.sqf
	Author: Dom
	Description: Triggered when an ATM button is pressed
*/

params [
	["_type",0,[0]],
	["_all",false,[false]]
];

switch _type do {
	case 0: {
		private _value = if (_all) then {client_cash} else {parseNumber(ctrlText -1)};
		if (_value < 0) exitWith {};
		if (_value > client_cash) exitWith {["You don't have enough money on you.","orange"] call DT_fnc_notify};
		client_cash = client_cash - _value;
		client_bank = client_bank + _value;
		[format["You withdrew $%1 from your bank account.",str(_value)],"green"] call DT_fnc_notify;
	};
	case 1: {
		private _value = if (_all) then {client_bank} else {parseNumber(ctrlText -1)};
		if (_value < 0) exitWith {};
		if (_value > client_bank) exitWith {["You don't have enough money in your bank.","orange"] call DT_fnc_notify};
		client_cash = client_cash + _value;
		client_bank = client_bank - _value;
		[format["You deposited $%1 into your bank account.",str(_value)],"green"] call DT_fnc_notify;
	};
	case 2: {
		if ((lbCurSel -1) isEqualTo -1) exitWith {["You need to select someone.","red"] call DT_fnc_notify};
		private _value = parseNumber(ctrlText -1);
		private _unit = call compile format ["%1",(lbData[-1,(lbCurSel -1)])];
		if (isNull _unit) exitWith {};
		if (_value > client_bank) exitWith {["You don't have enough money in your bank.","orange"] call DT_fnc_notify};
		if (_value > 999999) exitWith {["You can't transfer over $999999.","orange"] call DT_fnc_notify};
		client_bank = client_bank - _value;
		[format["You transferred $%1 to %2.",str(_value),name _unit],"green"] call DT_fnc_notify;
		[_value,player,true] remoteExecCall ["DT_fnc_recieveMoney",_unit];
	};
};

[0] call DT_fnc_saveStatsPartial;
call DT_fnc_initATM;