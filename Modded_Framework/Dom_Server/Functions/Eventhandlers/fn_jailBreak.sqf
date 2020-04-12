/*
	File: fn_jailBreak.sqf
	Author: Dom
	Description: Recieves and monitors the bomb state
*/
params [
	["_object",objNull,[objNull]],
	["_time",-1,[0]]
];

if (_time isEqualTo -1) then {
	jail_deviceSet = true;
	publicVariable "jail_deviceSet";

	private _pos = getPosATL _object;
	_pos set [2,0];
	private _device = createVehicle ["MW_device",_pos,[],0,"CAN_COLLIDE"];
	private _units = ["cop"] call DT_fnc_findPlayers;
	["The Jail's security system is being hacked!","red"] remoteExecCall ["DT_fnc_notify",_units];

	(nearestTerrainObjects [[9855.01,9631.01,0.455687],[],5]) params ["_prison"];
	[_prison,["alarm",500,1]] remoteExecCall ["say3D",-2];
	_prison animate ["Door1",1];
	[
		{
			params ["_prison","_device"];
			if (isNull _device) exitWith {jail_deviceSet = false; publicVariable "jail_deviceSet"};
			for "_i" from 2 to 14 do {
				_prison animate [format["Door%1",_i],1];
			};
			[
				{
					params ["_prison","_device"];
					if !(isNull _device) then {
						{
							for "_i" from 1 to 12 do {
								_prison animate [format["%1%2",_x,_i],-1];
							};
						} forEach ["a","b","c","d"];
						deleteVehicle _device;
					};
					jail_deviceSet = false;
					publicVariable "jail_deviceSet";
				},
				[_prison,_device],
				round(random 30)
			] call CBA_fnc_waitAndExecute;
		},
		[_prison,_device],
		round(random 20)
	] call CBA_fnc_waitAndExecute;
} else {
	jail_bombPlanted = true;
	publicVariable "jail_bombPlanted";
	private _bomb = createVehicle ["DemoCharge_Remote_Ammo_Scripted",[0,0,0],[],0,"CAN_COLLIDE"];
	_bomb attachTo [_object,[0,0,0]];
	//[_bomb,["alarm",500,1]] remoteExecCall ["say3D",-2]; need a sound

	private _bombTime = time;
	waitUntil {_bomb getVariable ["defused",false] || ((time - _bombTime) > _time)};

	private _units = ["cop"] call DT_fnc_findPlayers;
	if (_bomb getVariable ["defused",false]) then {
		["The bomb at the Jail was successfully defused.","green"] remoteExecCall ["DT_fnc_notify",_units];
		_bomb setVariable ["defused",nil,true];
	} else {
		["The bomb at the Jail has destroyed the gate!","red"] remoteExecCall ["DT_fnc_notify",_units];
		_bomb setDamage 1;
		_object setDamage 1;
	};

	jail_bombPlanted = false;
	publicVariable "jail_bombPlanted";
};