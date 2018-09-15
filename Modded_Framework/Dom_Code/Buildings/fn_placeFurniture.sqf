/*
    File: fn_saveFurnitureInventory.sqf
    Author: Dom
    Description: Called from containerClosed EVH to update the gear
*/
params [
    ["_furniture","",[""]] //this is the physical item
];
if (_furniture isEqualTo "") exitWith {};

if !(nearestObject [player,"House"] in client_keys) exitWith {["You need to be near a house you have keys to.","orange"] call DT_fnc_notify};
if (count(player getVariable ["furniture",[]]) >= (getNumber(missionConfigFile >> "Buildings" >> "Houses" >> (typeOf _building) >> "maxFurniture"))) exitWith {["You can't fit any more furniture in this building.","orange"] call DT_fnc_notify};

private _className = switch _furniture do { //this gets the vehicle/classname
	case "Wardrobe": {"Furn_Ward_i"};
};
furniture_item_class = _furniture;

private _piece = _className createVehicle [0,0,0];
_piece enableSimulation false;
_piece attachTo [player,[0.1,1,1]];
furniture_vehicle = _piece;
//_altPos = [0.16, 3, ((boundingBoxReal _object) select 1) select 2];

clearWeaponCargoGlobal _piece;
clearMagazineCargoGlobal _piece;
clearItemCargoGlobal _piece;
clearBackpackCargoGlobal _piece;

furnitureKeyHandler = (findDisplay 46) displayAddEventHandler ["KeyDown", { 
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
			detach furniture_vehicle;
			[getPlayerUID player,furniture_vehicle] remoteExecCall ["DB_fnc_insertFurniture",2];
			furniture_vehicle = objNull;
			furniture_item_class = "";
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
			deleteVehicle furniture_vehicle;
			furniture_vehicle = objNull;
			furniture_xPos = 0;
			furniture_yPos = 1;
			(findDisplay 46) displayRemoveEventHandler ["KeyDown",furnitureKeyHandler];
			player addItem furniture_item_class;
			furniture_item_class = "";
			_handled = true;
		};
	};
	_handled;
}];