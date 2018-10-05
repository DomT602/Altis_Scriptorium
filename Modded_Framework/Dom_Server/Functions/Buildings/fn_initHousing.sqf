/*
    File: fn_initHousing.sqf
    Author: Dom
    Description: Sets up housing
*/

private _houses = ["initHouses",2] call MySQL_fnc_DBasync;

{
	_x params [
		["_id",0,[0]],
		["_owner","",[""]],
		["_pos",[],[[]]],
		["_alarm",[],[[]]],
		["_shared",[],[[]]]
	];
	private _house = nearestObject [_pos,"House"];
	
	_house setVariable ["id",_id,true];
	_house setVariable ["owner",_owner,true];
	_house setVariable ["locked",true,true];
	_house setVariable ["house_key_holders",_shared,true];
	//_house setVariable ["alarm",_alarm,true];
	
	for "_i" from 1 to (getNumber(configFile >> "CfgVehicles" >> typeOf _house >> "numberOfDoors")) step 1 do {
		_house setVariable [(format ["bis_disabled_Door_%1", _i]),1,true];
	};
} forEach _houses;