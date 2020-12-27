/*
	File: fn_plantSeed.sqf
	Author: Dom
	Description: Plants the seed, creating the vehicle and monitoring it
*/
params [
	["_position",[],[]],
	["_plant","",[""]]
];

(switch _plant do {
	case "Wheat_seed_i": {["Wheat_model",300,1.2]};
	case "Opium_seed_i": {["A3\plants_f\Bush\b_NeriumO2s_F.p3d",3,1.2]};
	case "Olive_seed_i": {["A3\plants_f\Bush\b_FicusC1s_F.p3d",300,1]};
	case "": {["A3\plants_f\Bush\b_NeriumO2s_white_F.p3d",15,1.2]};
}) params ["_modelPath","_time","_height"];

_time = _time + floor(random(50));
private _plant = createSimpleObject [_modelPath,(_position vectorAdd [0,0,(_height * -0.5)])];

private _growthTime = _time / 10;
private _growthHeight = _height / 7;

server_crops pushBack [_plant,CBA_missionTime,_growthTime,_growthHeight];

if (farming_handle isEqualTo -1) then {
	farming_handle = [
		{
			if (server_crops isEqualTo []) exitWith {
				[_this select 1] call CBA_fnc_removePerFrameHandler;
				farming_handle = -1;
			};
			private _toDelete = [];
			{
				_x params ["_object","_time","_partTime","_partHeight"];
				if (isNull _object) then {
					_toDelete pushBack _forEachIndex;
				} else {
					if ((CBA_missionTime - _time) > _partTime) then {
						private _growthPercent = _object getVariable ["growthPercent",0];
						_growthPercent = _growthPercent + 10;
						_object setVariable ["growthPercent",_growthPercent,true];
						_object setPosASL ((getPosASL _object) vectorAdd [0,0,_partHeight]);
						if (_growthPercent isEqualTo 100) then {
							_toDelete pushBack _forEachIndex;
						} else {
							(server_crops select _forEachIndex) set [1,CBA_missionTime];
						};
					};
				};
			} forEach server_crops;
			reverse _toDelete;
			{
				server_crops deleteAt _x;
			} forEach _toDelete;
		},
		1
	] call CBA_fnc_addPerFrameHandler;
};