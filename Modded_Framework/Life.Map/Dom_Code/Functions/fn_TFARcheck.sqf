/*
	File: fn_TFARcheck.sqf
	Author: Dom
	Description: Checks clients TFAR status every 2 seconds via a CBA PFH
*/

[
	{
		private _somethingWrong = false;
		if !(call TFAR_fnc_isTeamSpeakPluginEnabled) then {
			titleText ["Please enable Task Force Radio in your TS3 Addons. | TS3 -> Tools -> Options -> Addons","BLACK"];
			_somethingWrong = true;
		} else {
			if !((call TFAR_fnc_getTeamSpeakServerName) isEqualTo "Teamspeak Server Name") then {
				titleText ["Please join the ServerHere teamspeak server. | ip","BLACK"];
				_somethingWrong = true;
			} else {
				if !((call TFAR_fnc_getTeamSpeakChannelName) isEqualTo "TaskForceRadio") then {
					titleText ["Please reload your Task Force Radio in your TS3 Addons to join the correct channel.","BLACK"];
					_somethingWrong = true;
				};
			};
		};
		if !(_somethingWrong) then {
			if !(player getVariable ["TFAR",true]) then {
				titleText ["","PLAIN"];
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