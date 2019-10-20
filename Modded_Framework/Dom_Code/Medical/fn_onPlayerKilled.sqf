/*
	File: fn_onPlayerKilled.sqf
	Author: Dom
	Description: Handles when a player dies
*/
params [
	["_unit",objNull,[objNull]]
];
private _killer = objNull;
if ((CBA_missionTime - (client_lastDamage select 0)) < 2) then {
	_killer = client_lastDamage select 1;
};

client_blockActions = true;
if !(isNull objectParent _unit) then {
	unassignVehicle _vehicle;
	_unit action ["getOut",vehicle _unit];
};
private _obj = "Land_Can_V3_F" createVehicleLocal [0,0,0];
_obj setMass 1e10;
_obj attachTo [_unit, [0,0,0], "Spine3"];
_obj setVelocity [0,0,6];
detach _obj;
[
	{
		deleteVehicle _this; 
	},
	_obj
] call CBA_fnc_execNextFrame;

if (TF_tangent_sw_pressed) then {
	call TFAR_fnc_onSwTangentReleased;
};

while {dialog} do {
	closeDialog 0;
};

_unit setVariable ["dead",true,true];
_unit setVariable ["tf_unable_to_use_radio",true];
_unit setVariable ["tf_voiceVolume",0,true];
if (_unit getVariable ["restrained",false]) then {
	_unit setVariable ["restrained",false,true];
};

{
	detach _x;
} forEach attachedObjects _unit;

createDialog "DeathScreen";
private _display = findDisplay 1002;
death_camera  = "CAMERA" camCreate (getPosATL _unit);
death_camera cameraEffect ["Internal","Back"];
death_camera camSetTarget _unit;
death_camera camSetRelPos [0,15.7,10.10];
death_camera camSetFOV .5;
death_camera camSetFocus [50,0];
death_camera camCommit 0;

_display displaySetEventHandler ["KeyDown","true"];

private _killedBy = _display displayCtrl 7306;
private _evidence = [];
if (isNull _killer || _killer isEqualTo _unit) then {
	_evidence pushBack "bled out due to open wounds"
} else {
	_killedby ctrlSetText format["Killed by: %1",name _killer];
	([currentWeapon _killer] call DT_fnc_fetchDetails) params ["_name"];
	_evidence pushBack _name;
	_evidence pushBack (player distance _killer);
};
_unit setVariable ["evidence",_evidence,true];

private _timer = _display displayCtrl 7301;
private _respawnBtn = _display displayCtrl 7302;
_respawnBtn ctrlEnable false;
[
	{
		params ["_unit","_timer","_respawnBtn","_time"];
		_timer ctrlSetText format["Respawn available in: %1",[(_time - CBA_missionTime),"MM:SS"] call BIS_fnc_secondsToString];
		!(_unit getVariable ["dead",false])
	},
	{
		true
	},
	[_unit,_timer,_respawnBtn,CBA_missionTime + 600],
	600,
	{
		params ["_unit","_timer","_respawnBtn"];
		_respawnBtn ctrlEnable true;
		_timer ctrlSetText "You can now respawn";
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
	}
] call CBA_fnc_waitUntilAndExecute;

[
	{
		params [
			["_unit",objNull,[objNull]],
			["_handle",-1,[0]]
		];
		private _display = findDisplay 1002;
		if (isNull _display) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};

		private _nearby = 99999;
		{
			if (!(_x getVariable ["dead",false]) && _x != _unit) then {
				private _distance = (getPosATL _unit) distance _x;
				if (_distance < _nearby) then {_nearby = _distance};
			};
		} forEach (["medic"] call DT_fnc_findPlayers);
		(_display displayCtrl 7304) ctrlSetText format["Medics: %1",(["medic",true] call DT_fnc_countFaction)];
		if (_nearby isEqualTo 99999) then { 
			(_display displayCtrl 7305) ctrlSetText "Nearest: None"; 
		} else { 
			(_display displayCtrl 7305) ctrlSetText format["Nearest: %1m",(round _nearby)]; 
		};
		
		if !(animationState _unit in ["deadstate","unconscious"]) then {[_unit,"deadstate"] remoteExecCall ["switchMove",-2]};
		if (getOxygenRemaining _unit < 1) then {
			_unit setOxygenRemaining 1;
		};
		if !(speed _unit isEqualTo 0) then {
			death_camera camSetTarget _unit; 
			death_camera camSetRelPos [0,15.7,10.10]; 
			death_camera camCommit 0;
		};
	},
	0,
	_unit
] call CBA_fnc_addPerFrameHandler;

private _cash = _unit getVariable ["cash",0];
if (_cash > 0) then {
	(getPosATL _unit) params ["_xPos","_yPos"];
	private _pile = createVehicle ["Land_Money_F",[_xPos,_yPos,0],[],0,"NONE"];
	_pile setVariable ["cash",_cash,true];
	_unit setVariable ["cash",0,[clientOwner,2]];
};

private _medics = ["medic"] call DT_fnc_findPlayers;
if !(_medics isEqualTo []) then {
	[format["Someone requires medical attention at %1, it is marked on your map.",mapGridPosition player]] remoteExecCall ["DT_fnc_notify",_medics];
};