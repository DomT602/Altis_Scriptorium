/*
	File: fn_medicalLoop.sqf
	Author: Dom
	Description: Handles the medical loop via CBA PFH
*/

[
	{
		if (player getVariable ["dead",false]) exitWith {};

		private _bleeding = player getVariable ["bleeding",0];
		if (_bleeding > 0) then {
			private _blood = player getVariable ["blood",5000];
			_blood = _blood - _bleeding;
			player setVariable ["blood",_blood,true];
		};
		if (_blood < 1) exitWith {
			[player] call DT_fnc_onPlayerKilled;
		};

		private _legs = player getVariable ["legs",0];
		if (_legs < 0.75) then {
			if (player getHit "legs" != 0) then {
				player setHit ["legs",0];
			};
		} else {
			if (player getHit "legs" != 1) then {
				player setHit ["legs",1];
			};
		};

		private _arms = player getVariable ["arms",0];
		if (_arms < 0.25) then {
			if !(unitRecoilCoefficient player isEqualTo 1) then {
				player setUnitRecoilCoefficient 1;
			};
		} else {
			if (_arms < 0.5) then {
				setCamShakeParams [0.0005, 0.0005, 0.0005, 0.0005, true];
				addCamShake [10, 2, 25];
				if !(unitRecoilCoefficient player isEqualTo 1.5) then {
					player setUnitRecoilCoefficient 1.5;
				};
			} else {
				if (_arms < 0.75) then {
					setCamShakeParams [0.0015, 0.0015, 0.0015, 0.0015, true];
					addCamShake [10, 2, 25];
					if !(unitRecoilCoefficient player isEqualTo 2) then {
						player setUnitRecoilCoefficient 2;
					};
				} else {
					setCamShakeParams [0.0025, 0.0025, 0.0025, 0.0025, true];
					addCamShake [10, 2, 25];
					if !(unitRecoilCoefficient player isEqualTo 3) then {
						player setUnitRecoilCoefficient 3;
					};
				};
			};
		};

		private _head = player getVariable ["head",0];
		if (_head > 0.95 && {(floor(random 10)) isEqualTo 0}) exitWith {
			[player] call DT_fnc_onPlayerKilled;
		};

		private _torso = player getVariable ["torso",0];
		private _pain = ((_head + _torso + _arms + _legs) / 4);
		if (_pain > 0.25 && !(player getVariable ["morphine",false])) then {
			"colorCorrections" ppEffectEnable true;
			"radialblur" ppEffectEnable true;
			if (_pain > 0.5) then {
				if (_pain > 0.75) then {
					"colorCorrections" ppEffectAdjust [1, 0.5, 0, [0.8,0.9,1,-0.3], [1,1,1,2], [-0.5,0,-1,5]];
					"radialBlur" ppEffectAdjust [0.01,0.2,0,0];
				} else {
					"colorCorrections" ppEffectAdjust [1, 0.5, 0, [0.8,0.9,1,-0.3], [1,1,1,2], [-0.5,0,-1,5]];
					"radialBlur" ppEffectAdjust [0.01,0.15,0.1,0.15]; 
				};
			} else {
				"colorCorrections" ppEffectAdjust [1, 0.5, 0, [0.8,0.9,1,-0.3], [1,1,1,2], [-0.5,0,-1,5]];
				"radialBlur" ppEffectAdjust [0.01,0.2,0.1,0.2];
			};
			"colorCorrections" ppEffectCommit 1; 
			"radialBlur" ppEffectCommit 1;
		} else {
			"colorCorrections" ppEffectEnable false;
			"radialblur" ppEffectEnable false;
		};
	},
	1
] call CBA_fnc_addPerFrameHandler;