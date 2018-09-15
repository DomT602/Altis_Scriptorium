
if !(isServer) then {
	waitUntil {!isNull player};
	cutText ["Requesting player data from the server...","BLACK",1];
	call compile preprocessFileLineNumbers "initVars.sqf";
	call compile preProcessFileLineNumbers '\PS_Client\XEH_postClientInit.sqf';
	[getPlayerUID player,player] remoteExec ["DB_fnc_initialStats",2];
} else {
	[] call compile preprocessFileLineNumbers "\Dom_Server\init.sqf";
	[] spawn {
		waitUntil {time > 0};
		setDate (missionStart select [0,5]);
	};		
};