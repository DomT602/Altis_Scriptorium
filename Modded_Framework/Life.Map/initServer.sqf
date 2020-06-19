[] call compile preprocessFileLineNumbers "\Dom_Server\init.sqf";
[] spawn {
	waitUntil {time > 0};
	setDate (missionStart select [0,5]);
	setTimeMultiplier 4;
};