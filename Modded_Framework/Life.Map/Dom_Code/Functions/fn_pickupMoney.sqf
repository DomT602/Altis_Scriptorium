/*
	File: fn_pickupMoney.sqf
	Author: Dom
	Description: Picks up money.
*/
params [
	["_pile",objNull,[objNull]]
];
if (isNull _pile) exitWith {};
	
private _value = _pile getVariable ["cash",100];

if (_value isEqualTo 0) then {
	if !(isNull client_carrying) exitWith {["You're already carrying something.","orange"] call DT_fnc_notify};
	["Stashing cash",30,"AinvPknlMstpSnonWnonDnon_medic_1","isNull objectParent player && player distance MB_Interaction_Target < 5 && !(isNull MB_Interaction_Target) || (player getVariable ['restrained',false])",
	{
		private _moneyBag = createVehicle ["Land_Sleeping_bag_blue_folded_F",getPosATL player,[],0];
		_moneyBag attachTo [player,[0.1,-0.18,0],"rfemur"];
		_moneyBag setVectorDirAndUp [[0.5,0.5,0],[-0.5,0.5,0]];
		client_carrying = _moneyBag;
		["You have filled a bag full of cash.","green"] call DT_fnc_notify;
		[player,""] remoteExecCall ["switchMove",-2];
	},
	{
		params [
			["_state",0,[0]]
		];

		[(switch _state do {
			case 1: {"Stashing cancelled."};
			case 2: {"You are dead."};
			case 3: {"Stashing failed."};
		}),"orange"] call DT_fnc_notify;
	}] call DT_fnc_progressBar;
} else {
	deleteVehicle _pile;
	player playMove "AinvPknlMstpSlayWrflDnon";
	["cash",_value] call DT_fnc_handleMoney;
	[format["You picked up $%1.",_value],"green"] call DT_fnc_notify;
};
