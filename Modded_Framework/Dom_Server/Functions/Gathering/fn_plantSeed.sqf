/*
	File: fn_plantSeed.sqf
	Author: Dom
	Description: Plants the seed, creating the vehicle and monitoring it
*/

params [
	["_position",[],[]],
	["_plant","",[""]]
];

_position params ["_xPos","_yPos","_zPos"];

(switch _plant do {
	case "Wheat_i": {["Wheat_vehicle",300,1.2]};
}) params ["_className","_time","_height"];

_time = _time + floor(random(50));
private _plant = createVehicle [_className,(_position vectorAdd [0,0,-_height]),[],0,"CAN_COLLIDE"];

private _growthTime = _time / 10;
private _growthHeight = _height / 10;
private _growthPercent = 0;

_plant setVariable ["growthPercent",0,true];

for "_i" from 0 to 9 step 1 do {
	uiSleep _growthTime;
	_growthPercent = _growthPercent + 10;
	_plant setVariable ["growthPercent",_growthPercent,true];
	_plant setPosATL ((getPosATL _plant) vectorAdd [0,0,_growthHeight]);
};