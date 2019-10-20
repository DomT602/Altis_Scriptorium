/*
	File: fn_useATM.sqf
	Author: Dom
	Description: Triggered when an ATM button is pressed
*/
params [
	["_type",0,[0]],
	["_all",false,[false]]
];

private _display = findDisplay 1030;
if (isNull _display) then {_display = findDisplay 1038};
private _bank = _display displayCtrl 1101;
private _companyBank = _display displayCtrl 1102;

switch _type do {
	case 0: {
		private _value = ctrlText (_display displayCtrl 1400);
		if !([_value,0] call DT_fnc_checkNumber) exitWith {};
		_value = parseNumber _value;
		if (_value > (player getVariable ["bank",0])) exitWith {["You don't have enough money in your bank.","orange"] call DT_fnc_notify};
		["cash",_value] call DT_fnc_handleMoney;
		["bank",-_value] call DT_fnc_handleMoney;
		[format["You withdrew $%1 from your bank account.",_value],"green"] call DT_fnc_notify;
		_bank ctrlSetStructuredText parseText format["$%1",(player getVariable ["bank",0])];
	};
	case 1: {
		private _value = if (_all) then {(player getVariable ["cash",0])} else {parseNumber(ctrlText 1400)};
		if (_value < 1) exitWith {["Invalid value.","red"] call DT_fnc_notify};
		if (_value > (player getVariable ["cash",0])) exitWith {["You don't have enough money on you.","orange"] call DT_fnc_notify};
		["cash",-_value] call DT_fnc_handleMoney;
		["bank",_value] call DT_fnc_handleMoney;
		[format["You deposited $%1 into your bank account.",_value],"green"] call DT_fnc_notify;
		_bank ctrlSetStructuredText parseText format["$%1",(player getVariable ["bank",0])];
	};
	case 2: {
		private _index = lbCurSel 2100;
		if (_index isEqualTo -1) exitWith {["You need to select someone.","red"] call DT_fnc_notify};
		private _value = ctrlText (_display displayCtrl 1400);
		if !([_value,0] call DT_fnc_checkNumber) exitWith {};
		_value = parseNumber _value;
		private _uid = lbData[2100,_index];
		private _unit = [_uid] call DT_fnc_findPlayer;
		if (isNull _unit) exitWith {};
		if (_value > (player getVariable ["bank",0])) exitWith {["You don't have enough money in your bank.","orange"] call DT_fnc_notify};
		lbSetCurSel [2100,-1];
		["bank",-_value] call DT_fnc_handleMoney;
		[format["You transferred $%1 to %2.",_value,name _unit],"green"] call DT_fnc_notify;
		[_value,player,true] remoteExecCall ["DT_fnc_recieveMoney",_unit];
		_bank ctrlSetStructuredText parseText format["$%1",(player getVariable ["bank",0])];
	};
	case 3: {
		private _company = player getVariable ["company",""];
		if (_company isEqualTo "") exitWith {};
		if (player getVariable ["companyRank",0] != 3) exitWith {["Only a company owner can withdraw funds."] call DT_fnc_notify};
		private _value = ctrlText (_display displayCtrl 1400);
		if !([_value,0] call DT_fnc_checkNumber) exitWith {};
		_value = parseNumber _value;
		private _compBank = uiNamespace getVariable ["compFunds",0];
		if (_value > _compBank) exitWith {["You don't have enough money in your bank.","orange"] call DT_fnc_notify};
		["bank",_value] call DT_fnc_handleMoney;
		_compBank = _compBank - _value;
		uiNamespace setVariable ["compFunds",_compBank];
		[format["You withdrew $%1 from your companies bank account.",_value],"green"] call DT_fnc_notify;
		_bank ctrlSetStructuredText parseText format["$%1",(player getVariable ["bank",0])];
		_companyBank ctrlSetStructuredText parseText format["Company funds: $%1",_compBank];
		[_company,1,_value] remoteExecCall ["DB_fnc_updateCompany",2];
	};
	case 4: {
		private _company = player getVariable ["company",""];
		if (_company isEqualTo "") exitWith {};
		private _value = ctrlText (_display displayCtrl 1400);
		if !([_value,0] call DT_fnc_checkNumber) exitWith {};
		_value = parseNumber _value;
		private _compBank = uiNamespace getVariable ["compFunds",0];
		if (_value > (player getVariable ["bank",0])) exitWith {["You don't have enough money in your bank.","orange"] call DT_fnc_notify};
		["bank",-_value] call DT_fnc_handleMoney;
		_compBank = _compBank + _value;
		uiNamespace setVariable ["compFunds",_compBank];
		[format["You deposited $%1 into your companies bank account.",_value],"green"] call DT_fnc_notify;
		_bank ctrlSetStructuredText parseText format["$%1",(player getVariable ["bank",0])];
		_companyBank ctrlSetStructuredText parseText format["Company funds: $%1",_compBank];
		[_company,0,_value] remoteExecCall ["DB_fnc_updateCompany",2];
	};
};