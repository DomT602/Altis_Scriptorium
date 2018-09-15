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
		//private _rocks = [];
		for "_i" from 0 to round(random 2) step 1 do { 
			private _rockBit = createVehicle [_class, _pos, [], 0, "NONE"]; 
			//_rocks pushBack _rockBit;
		};
		for "_i" from 0 to round(random 3) step 1 do { 
			private _rockBit = createVehicle ["rockNormal", _pos, [], 0, "NONE"]; 
			//_rocks pushBack _rockBit;
		};
		if (round(random 10) > 6) then {
			private _gem = createVehicle [(selectRandom ["gem_1","gem_2"]), _pos, [], 0, "NONE"]; 
			//_rocks pushBack _gem;
		};

		/*[_rocks,_pos] spawn {
			params ["_rocks","_pos"];
			uiSleep 30;
			[_pos] call server_fnc_respawnRock;
			private _rockTime = time;
			waitUntil {_rocks isEqualTo [] || ((time - _rockTime) > 120)}; //check if picking up an item returns objNull/blank array
			if !(_rocks isEqualTo []) then {
				{
					if !(isNull _x) then {
						deleteVehicle _x;
					};
				} forEach _rocks;
			};
		};*/
	} else {
		_rock setVariable ["health",_health,false];
	};
};
