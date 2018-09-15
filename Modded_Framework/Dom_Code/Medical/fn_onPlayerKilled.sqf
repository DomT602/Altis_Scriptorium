/*
	File: fn_onPlayerKilled.sqf
	Author: Dom
	Description: Handles when a player dies
*/
params [
	["_unit",objNull,[objNull]],
	["_killer",objNull,[objNull]]
];
disableSerialization;

if  !((vehicle _unit) isEqualTo _unit) then {
	unAssignVehicle _unit;
	_unit action ["getOut", vehicle _unit];
	_unit setPosATL [(getPosATL _unit select 0) + 3, (getPosATL _unit select 1) + 1, 0];
};

[_unit,"deadstate"] remoteExecCall ["switchMove",-2];
client_blockActions = true;

_unit setVariable ["dead",true,true];
_unit setVariable ["restrained",false,true];
_unit setVariable ["tf_unable_to_use_radio",true];
_unit setVariable ["tf_voiceVolume",0,true];

if (dialog) then {
	closeDialog 0;
};

death_camera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder false;
death_camera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
death_camera camSetTarget _unit;
death_camera camSetRelPos [0,15.7,10.10];
death_camera camSetFOV .5;
death_camera camSetFocus [50,0];
death_camera camCommit 0;

(findDisplay 1002) displaySetEventHandler ["KeyDown","_this call DT_fnc_deathKeyHandler"];

private _killedBy = ((findDisplay 1002) displayCtrl 7306);
if (isNull _killer || _killer isEqualTo _unit) then {
	_killedby ctrlSetText "Bled out";
} else {
	_killedby ctrlSetText format["Killed by: %1",name _killer];
};

[_unit] spawn {
	params [
		["_unit",objNull,[objNull]]
	];
	disableSerialization;
	private _RespawnBtn = ((findDisplay 1002) displayCtrl 7302);
	private _Timer = ((findDisplay 1002) displayCtrl 7301);
	private _maxTime = time + 60;
	_RespawnBtn ctrlEnable false;
	waitUntil {_Timer ctrlSetText format ["Respawn Available in: %1",[(_maxTime - time),"MM:SS"] call BIS_fnc_secondsToString]; round(_maxTime - time) <= 0};
	_RespawnBtn ctrlEnable true;
	_Timer ctrlSetText "You can now respawn";
	[
		{
			!(player getVariable ["dead",false])
		},
		{
			true
		},
		0,
		300,
		{
			closeDialog 0;
			call DT_fnc_respawn;
		}
	] call CBA_fnc_waitUntilAndExecute;
};

[
	{
		params [
			["_unit",objNull,[objNull]],
			["_handle",-1,[0]]
		];
		private _display = findDisplay 1002;
		if (isNull _display) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};

		private _nearby = -1;
		{
			if (!(_x getVariable ["dead",false]) && _x != _unit) then {
				private _distance = (getPosATL _unit) distance _x;
				if (_distance < _nearby) then {_nearby = _distance};
			};
		} forEach (["medic"] call DT_fnc_findPlayers);
		(_display displayCtrl 7304) ctrlSetText format["Medics: %1",(["medic",true] call DT_fnc_countFaction)];
		if (_nearby isEqualTo -1) then { 
			(_display displayCtrl 7305) ctrlSetText "Nearest: None"; 
		} else { 
			(_display displayCtrl 7305) ctrlSetText format["Nearest: %1m",str(round _nearby)]; 
		};
		
		if !(animationState _unit isEqualTo "deadstate") then {[_unit,"deadstate"] remoteExecCall ["switchMove",-2]};
		if (getOxygenRemaining _unit < 1) then {
			_unit setOxygenRemaining 1;
		};
		if !(speed _unit isEqualTo 0) then {
			death_camera camSetTarget _unit; death_camera camSetRelPos [0,15.7,10.10]; death_camera camCommit 0;
		};
	},
	0,
	player
] call CBA_fnc_addPerFrameHandler;


if (client_cash > 0) then {
	(getPosATL _unit) params ["_xPos","_yPos"];
	private _pile = createVehicle ["Land_Money_F",[_xPos,_yPos,0],[],0,"NONE"];
	_pile setVariable ["cash",client_cash,true];
	client_cash = 0;
};

[0] call DT_fnc_saveStatsPartial;
[6] call DT_fnc_saveStatsPartial;
[3] call DT_fnc_saveStatsPartial;