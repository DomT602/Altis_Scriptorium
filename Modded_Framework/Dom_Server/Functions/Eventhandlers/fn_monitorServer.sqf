/*
	File: fn_monitorServer.sqf
	Author: Dom
	Description: Monitors the uptime of the server, and does certain events during this time (set password in server.cfg)
*/
//[round(random 4)] remoteExec ["BIS_fnc_earthquake",-2]; do this randomly and set fire to some buildings etc
[black_market_dealer] spawn server_fnc_moveDealer;
[
	{
		params ["_arguments"];
		_arguments params ["_i"];
		if (_i mod 2 isEqualTo 0) then {
			[drug_dealer] spawn server_fnc_moveDealer;
			if (_i isEqualTo 22) then {
				["Server restarting in 30 minutes."] remoteExecCall ["systemChat",-2];
			};
		} else {
			[black_market_dealer] spawn server_fnc_moveDealer;
		};
		if (_i mod 4 isEqualTo 0) then {
			private _hoursToGo = 6 - (_i / 4);
			["This server restarts every 6 hours."] remoteExecCall ["systemChat",-2];
			[format["Server restarting in %1 hours.",_hoursToGo]] remoteExecCall ["systemChat",-2];
		};
		if (_i isEqualTo 23) then {
			["Server restarting in 15 minutes."] remoteExecCall ["systemChat",-2];
			[_this select 1] call CBA_fnc_removePerFrameHandler;
			[
				{
					["Server restarting in 10 minutes."] remoteExecCall ["systemChat",-2];
					[
						{
							["Server restarting in 5 minutes, sync and log off to ensure your data is saved."] remoteExecCall ["systemChat",-2];
							"password" serverCommand "#lock";
							[
								{
									["Server restarting in 1 minute."] remoteExecCall ["systemChat",-2];
									{
										"password" serverCommand format["#kick %1",name _x];
									} forEach playableUnits;
									[
										{
											"password" serverCommand "#restartServer";
										},
										30
									] call CBA_fnc_waitAndExecute;
								},
								120
							] call CBA_fnc_waitAndExecute;
						},
						300
					] call CBA_fnc_waitAndExecute;
				},
				300
			] call CBA_fnc_waitAndExecute;
		};
		call server_fnc_updateTemperature;
		_i = _i + 1;
		_arguments set [0,_i];
		diag_log format ["Server FPS:%1",diag_fps];
	},
	900,
	[0]
] call CBA_fnc_addPerFrameHandler;