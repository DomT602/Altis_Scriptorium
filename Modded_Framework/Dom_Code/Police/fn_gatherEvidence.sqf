/*
	File: fn_gatherEvidence.sqf
	Author: Dom
	Description: Gathers evidence in a variety of different circumstances
*/
params [
	["_unit",objNull,[objNull]]
];

private _evidence = _unit getVariable ["evidence",[]];
if (isPlayer _unit) then {
	_evidence params ["_weapon",["_distance",-1]];
	private _text = format["On inspection, this person %1.",_weapon];
	if (_distance != -1) then {
		private _distanceText = call {
			if (_distance > 1000) exitWith {"far away"};
			if (_distance > 500) exitWith {"relatively close"};
			"nearby"
		};
		_text = format["On inspection, you see rounds originating from a %1. The rounds seem to have originated from %2.",_weapon,_distanceText];
	};
	[_text] call DT_fnc_notify;
} else {
	if (_evidence isEqualTo []) exitWith {["I have nothing else to say."] call DT_fnc_notify};

	private _text = call {
		private _chance = random 10;
		if (_chance < 1) exitWith {"I can't really remember what the robber was wearing..."};
		if (_chance < 7) exitWith {format["The robber was wearing a %1.",(_evidence select 0)]};
		format["The robber was wearing a %1 and a %2.",(_evidence select 0),(_evidence select 1)]	
	};
	[_text] call DT_fnc_notify;
};
_unit setVariable ["evidence",nil,true];