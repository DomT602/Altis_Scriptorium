/*
	File: fn_TFARcheck.sqf
	Author: Dom
	Description: Checks clients TFAR status every 2 seconds via a CBA PFH
*/

diag_log "TFAR check loaded successfully";

[
	{
		private _somethingWrong = false;
		if !(call TFAR_fnc_isTeamSpeakPluginEnabled) then {
			titleText ["Please enable Task Force Radio in your TS3 Addons. | TS3 -> Tools -> Options -> Addons","BLACK"];
			_somethingWrong = true;
		} else {
			if !((call TFAR_fnc_getTeamSpeakServerName) isEqualTo "Modern RP") then {
				titleText ["Please join the Modern RP teamspeak server. | ts3.modernrp.net","BLACK"];
				_somethingWrong = true;
			} else {
				if !((call TFAR_fnc_getTeamSpeakChannelName) isEqualTo "TaskForceRadio") then {
					titleText ["Please reload your Task Force Radio in your TS3 Addons to join the correct channel.","BLACK"];
					_somethingWrong = true;
				};
			};
		};
		if !(_somethingWrong) then {
			titleText ["","PLAIN"];
			if !(player getVariable ["TFAR",true]) then {
				player setVariable ["TFAR",true,true];
			};
		} else {
			if (player getVariable ["TFAR",true]) then {
				player setVariable ["TFAR",false,true];
			};
		};
	},
	2
] call CBA_fnc_addPerFrameHandler;