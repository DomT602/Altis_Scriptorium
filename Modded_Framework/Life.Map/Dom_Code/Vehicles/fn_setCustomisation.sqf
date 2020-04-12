/*
	File: fn_setCustomisation.sqf
	Author: Dom
	Description: Sets the customisation options on selected vehicle
*/
params [
	["_vehicle",objNull,[objNull]],
	["_data",-1,[0,[]]],
	["_local",false,[true]],
	["_type",0,[0]]
];
if (isNull _vehicle) exitWith {};

private _className = typeOf _vehicle;
if !(isClass (missionConfigFile >> "Textures" >> "Vehicle" >> _className)) then {
	diag_log format["Vehicle colour error: %1",_className];
	_className = "Default";
};
private _config = missionConfigFile >> "Modifications" >> "car";

if (_data isEqualType [] && {count _data > 1}) then {
	if !(_vehicle getVariable ["customisation",[]] isEqualTo _data) then {
		_vehicle setVariable ["customisation",_data,true];
	};
	_data params ["_texture","_rvmat","_plate","_tint","_wheelColour","_proxies"];

	private _textures = (getArray(missionConfigFile >> "Textures" >> "Vehicle" >> _className >> "textures")) param [_texture,[]] param [1,[]];
	{
		if (_local) then {
			_vehicle setObjectTexture [_forEachIndex,_x];
		} else {
			_vehicle setObjectTextureGlobal [_forEachIndex,_x];
		};
	} forEach _textures;

	private _plateTexture = (getArray(_config >> "plates") select _plate) select 1;
	private _rvmat = (getArray(_config >> "rvmats") select _rvmat) select 1;
	private _tintValue = (getArray(_config >> "tint") select _tint) select 1;
	private _wheelColourTexture = (getArray(_config >> "wheelColour") select _wheelColour) select 1;
	if (_local) then {
		_vehicle setObjectMaterial [0,_rvmat];
		_vehicle setObjectTexture [2,_plateTexture];
		_vehicle setObjectTexture [4,format["#(argb,8,8,3)color(0,0,0,%1,ca)",_tintValue]];
		_vehicle setObjectTexture [3,_wheelColourTexture];
		//proxies
	} else {
		_vehicle setObjectMaterialGlobal [0,_rvmat];
		_vehicle setObjectTextureGlobal [2,_plateTexture];
		_vehicle setObjectTextureGlobal [4,format["#(argb,8,8,3)color(0,0,0,%1,ca)",_tintValue]];
		_vehicle setObjectTextureGlobal [3,_wheelColourTexture];
		//proxies _vehicle animate ["",1];
	};
} else {
	if (_data isEqualType []) then {_data = _data select 0};
	switch _type do {
		case 0: {
			private _textures = (getArray(missionConfigFile >> "Textures" >> "Vehicle" >> _className >> "textures")) param [_data,[]] param [1,[]];
			{
				if (_local) then {
					_vehicle setObjectTexture [_forEachIndex,_x];
				} else {
					_vehicle setObjectTextureGlobal [_forEachIndex,_x];
				};
			} forEach _textures;
		};
		case 1: {
			private _rvmat = (getArray(_config >> "rvmats") select _data) select 1;
			if (_local) then {
				_vehicle setObjectMaterial [0,_rvmat];
			} else {
				_vehicle setObjectMaterialGlobal [0,_rvmat];
			};
		};
		case 2: {
			private _plateTexture = (getArray(_config >> "plates") select _data) select 1;
			if (_local) then {
				_vehicle setObjectTexture [2,_plateTexture];
			} else {
				_vehicle setObjectTextureGlobal [2,_plateTexture];
			};
		};
		case 3: {
			private _tintValue = (getArray(_config >> "tint") select _data) select 1;
			if (_local) then {
				_vehicle setObjectTexture [4,format["#(argb,8,8,3)color(0,0,0,%1,ca)",_tintValue]];
			} else {
				_vehicle setObjectTextureGlobal [4,format["#(argb,8,8,3)color(0,0,0,%1,ca)",_tintValue]];
			};
		};
		case 4: {
			private _wheelColourTexture = (getArray(_config >> "wheelColour") select _data) select 1;
			if (_local) then {
				_vehicle setObjectTexture [3,_wheelColourTexture];
			} else {
				_vehicle setObjectTextureGlobal [3,_wheelColourTexture];
			};
		};
		case 5: {

		};
	};
	if !(_local) then {
		private _var = _vehicle getVariable ["customisation",[]];
		_var set [_type,_data];
		_vehicle setVariable ["customisation",_var,true];
	};
};