/*
	File: fn_medicalLoop.sqf
	Author: Dom
	Description: Sets up the medical loop via CBA PFH
*/
"colorCorrections" ppEffectEnable true;
[
	{
		if (CBA_missionTime > client_tempTime) then {
			client_tempTime = CBA_missionTime + 30;
			call DT_fnc_calculateTemperature;
		};
		if (player getVariable ["dead",false]) exitWith {};
		(player getVariable ["injuries",[]]) params ["_head","_torso","_leftArm","_rightArm","_leftLeg","_rightLeg"];
		(player getVariable ["bleeding",[]]) params ["_headBleed","_torsoBleed","_leftArmBleed","_rightArmBleed","_leftLegBleed","_rightLegBleed"];

		private _blood = player getVariable ["blood",5000];
		private _bleeding = _headBleed + _torsoBleed + _leftArmBleed + _rightArmBleed + _leftLegBleed + _rightLegBleed;
		if (_bleeding > 0) then {
			_blood = (_blood - _bleeding) max 0;
			player setVariable ["blood",_blood,true];
			["blood"] call DT_fnc_updateHUDPartial;
		};
		if (_blood < 1 || (getOxygenRemaining player) < 0.05) exitWith {
			[player] call DT_fnc_onPlayerKilled;
		};

		private _legs = _leftLeg + _rightLeg;
		if (_legs < 1.5) then {
			if (player getHit "legs" != 0) then {
				player setHit ["legs",0];
			};
		} else {
			if (player getHit "legs" != 1) then {
				player setHit ["legs",1];
			};
		};

		private _arms = _leftArm + _rightArm;
		if !(unitRecoilCoefficient player isEqualTo (1 + _arms)) then {
			player setUnitRecoilCoefficient (1 + _arms);
		};
		if (_arms > 0.75) then {
			addCamShake [(2 * _arms),1,10];
		};

		if (_head > 0.95 && {(floor(random 10)) isEqualTo 0}) exitWith {
			[player] call DT_fnc_onPlayerKilled;
		};

		private _pain = if (player getVariable ["morphine",false]) then {0} else {(_head + _torso + _arms + _legs) / 6};
		"colorCorrections" ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1 - _pain],[0.2,0,0,0]];
		"colorCorrections" ppEffectCommit 1;
	},
	1
] call CBA_fnc_addPerFrameHandler;