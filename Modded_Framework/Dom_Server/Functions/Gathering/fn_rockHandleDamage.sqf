/*
	File: fn_rockHandleDamage.sqf
	Author: Dom
	Description: Handles damage to a rock for mining
*/

params [
	["_rock",objNull,[objNull]],
	"",
	"",
	["_source",objNull,[objNull]]
];

if ((currentWeapon _source) == "Pickaxe") then {
	private _level = _source getVariable ["level_mining",0];
	private _type = _rock getVariable ["type","normal"];
	private _health = _rock getVariable ["health",50];
	private _damage = (round(_level / 5)) max 2;
	_health = _health - _damage;

	if (_health < 1) then  {
		private _pos = getPosATL _rock;
		deleteVehicle _rock;
		["mining",1] remoteExecCall ["DT_fnc_addExp",_source];
		private _class = switch _type do {
			case "normal": {"classname"};
		};
		nearestObjects [_pos,["GroundWeaponHolder"],3] params [["_holder",objNull,[objNull]]];
		if (isNull _holder) then {
			_holder = createVehicle ["GroundWeaponHolder",_pos,[],0,"CAN_COLLIDE"];
		};
		_holder addItemCargoGlobal [_className,round(random 2)];
		_holder addItemCargoGlobal ["rock_chunk",round(random 3)];
		if (round(random 10) > 6) then {
			_holder addItemCargoGlobal [(selectRandom ["Gem","Gem2"]),1];
		};
		[_pos] call server_fnc_respawnRock;
	} else {
		_rock setVariable ["health",_health,false];
	};
};
