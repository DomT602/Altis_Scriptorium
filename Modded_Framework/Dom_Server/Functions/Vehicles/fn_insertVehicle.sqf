/*
	File: fn_insertVehicle.sqf
	Author: Dom
	Description: Recieves request to insert vehicle into DB and spawns it
*/
params [
	["_className","",[""]],
	["_spawnPoint","",[""]],
	["_unit",objNull,[objNull]],
	["_customisation",[0],[[]]]
];
if (_className isEqualTo "" || isNull _unit) exitWith {};
private _uid = getPlayerUID _unit;
private _faction = _unit getVariable ["faction","civ"];

private _plate = "";
private _letterArray = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
for "_i" from 0 to 1 step 0 do {
	private _randomPlate = "";
	private _plateArray = [];
	for "_y" from 0 to 2 do {
		_plateArray pushBack (selectRandom _letterArray)
	};
	_plateArray pushBack (1000 + round(random 8999));
	_randomPlate = _plateArray joinString "";

	private _return = [format["checkPlate:%1",_randomPlate],2] call MySQL_fnc_DBasync;
	if (_return isEqualTo []) exitWith {_plate = _randomPlate};
};

private _vehicle = createVehicle [_className,getMarkerPos _spawnPoint,[],0];
_vehicle setDir (markerDir _spawnPoint);

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;

if (_vehicle isKindOf "Car") then {
	for "_i" from 0 to 4 do {
		_customisation pushBack 0;
	};
	[_vehicle,_customisation] call DT_fnc_setCustomisation;
} else {
	[_vehicle,_customisation,false,0] call DT_fnc_setCustomisation;
};

_vehicle lock 2;
_vehicle setVariable ["keyHolders",[name _unit],true];
_vehicle setVariable ["plate",_plate,true];
_vehicle setPlateNumber _plate;
[_vehicle] remoteExecCall ["DT_fnc_recieveKey",remoteExecutedOwner];
[_uid,_vehicle] call server_fnc_handleKeys;

private _type = call {
	if (_vehicle isKindOf "Car") exitWith {"car"};
	if (_vehicle isKindOf "Air") exitWith {"air"};
	if (_vehicle isKindOf "Ship") exitWith {"ship"};
};
[format["insertVehicle:%1:%2:%3:%4:%5:%6",_faction,_className,_type,_uid,_plate,_customisation],1] call MySQL_fnc_DBasync;