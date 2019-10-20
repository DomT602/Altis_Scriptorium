/*
	File: fn_handleFurnitureKey.sqf
	Author: Dom
	Description: Handles key presses for placing furniture
*/
params [
	["_ctrl",-1,[0]],
	["_code",-1,[0]],
	["_shift",false,[false]],
	["_ctrl",false,[false]],
	["_alt",false,[false]]
];
private _handled = false;
	
switch _code do {
	case 57: { //space to put object down
		private _house = nearestObject [player,"House"];
		if !(_house in client_keys) exitWith {["You need to be near a house you have keys to.","orange"] call DT_fnc_notify};
		detach furniture_vehicle;
		[furniture_vehicle,_house] remoteExecCall ["DB_fnc_insertFurniture",2];
		furniture_vehicle = objNull;
		furniture_xPos = 0;
		furniture_yPos = 1;
		(findDisplay 46) displayRemoveEventHandler ["KeyDown",furnitureKeyHandler];
		_handled = true;				
	};

	case 72: { //NUM_8 move forward
		private _distance = 0.5;
		if (_shift) then {_distance = 1};
		furniture_yPos = furniture_yPos + _adjust;
		furniture_vehicle attachTo [player,[furniture_xPos,furniture_yPos,(getPosATL param [2,0])]];
		_handled = true;
	};

	case 80: { //NUM_2 move backwards
		private _distance = 0.5;
		if (_shift) then {_distance = 1};
		furniture_yPos = furniture_yPos - _adjust;
		furniture_vehicle attachTo [player,[furniture_xPos,furniture_yPos,(getPosATL param [2,0])]];
		_handled = true;
	};
	
	case 77: { //NUM_6 move right
		private _distance = 0.5;
		if (_shift) then {_distance = 1};
		furniture_xPos = furniture_xPos + _adjust;
		furniture_vehicle attachTo [player,[furniture_xPos,furniture_yPos,(getPosATL param [2,0])]];
		_handled = true;
	};

	case 75: { //NUM_4 move left
		private _distance = 0.5;
		if (_shift) then {_distance = 1};
		furniture_xPos = furniture_xPos - _adjust;
		furniture_vehicle attachTo [player,[furniture_xPos,furniture_yPos,(getPosATL param [2,0])]];
		_handled = true;
	};

	case 76: { //NUM_5 to cancel
		detach furniture_vehicle;
		private _className = typeOf furniture_vehicle;
		deleteVehicle furniture_vehicle;
		furniture_vehicle = objNull;
		furniture_xPos = 0;
		furniture_yPos = 1;
		(findDisplay 46) displayRemoveEventHandler ["KeyDown",furnitureKeyHandler];
		player addItem _className;
		_handled = true;
	};
};
_handled;