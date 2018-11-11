/*
	File: fn_setPlate.sqf
	Author: Dom
	Description: Sets the plate textures
*/

params [
	["_vehicle",objNull,[objNull]],
	["_author","Default",[""]]
];

waitUntil {!isNil {_vehicle getVariable "plate"}};
private _plate = _vehicle getVariable "plate";
if (_author isEqualTo "Default") exitWith {_vehicle setPlateNumber _plate};
_plate = _plate splitString "";
_plate reSize 7;

private _numbers = ["0","1","2","3","4","5","6","7","8","9"];
{
	if (isNil "_x") then {
		_plate set [_forEachIndex,""];
	} else {
		if (_x in _numbers) then {
			_plate set [_forEachIndex,(parseNumber _x)];
		};
	};
} forEach _plate;
_plate params ["_plate1","_plate2","_plate3","_plate4","_plate5","_plate6","_plate7"];

switch _author do {
	case "Jonzie": {
		{
			if (_x isEqualTo "") then {
				_vehicle setObjectTextureGlobal [(_forEachIndex + 1), ""];
			} else {
				_vehicle setObjectTextureGlobal [(_forEachIndex + 1), format ["\Jonzie_Carpack\Universal_Cars\Number_Plates\%1.paa",_x]];
			};
		} forEach [_plate1,_plate2,_plate3,_plate4,_plate5,_plate6,_plate7];
	};
	case "Ivory": { //need to do a isMultiplayer check
		{
			if (_x isEqualTo "") then {
				_vehicle setObjectTextureGlobal [(_forEachIndex + 4), ""];
			} else {
				_vehicle setObjectTextureGlobal [(_forEachIndex + 4), format ["\ivory_data\license\%1.paa",_x]];
			};
		} forEach [_plate1,_plate2,_plate3,_plate4,_plate5,_plate6,_plate7];
	};
};