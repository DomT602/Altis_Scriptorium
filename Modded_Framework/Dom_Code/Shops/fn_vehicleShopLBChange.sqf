/*
	File: fn_vehicleShopLBChange.sqf
	Author: Dom
	Description: Called on the LB change
*/
params [
	["_control",controlNull,[controlNull]],
	["_index",-1,[0]]
];
if (_index isEqualTo -1) exitWith {};

private _className = _control lbData _index;
private _price = _control lbValue _index;

if !((typeOf client_preview) == _className) then {
	detach client_target;
	deleteVehicle client_preview;
	client_preview = _className createVehicleLocal [1162.055,884.241,0.1];
	//client_preview allowDamage false;
	client_target attachTo [client_preview,client_cameraSettings select 3,""];
};

private _display = findDisplay 1008;
private _config = configFile >> "CfgVehicles" >> _className;
(_display displayCtrl 1102) ctrlSetStructuredText parseText format [
	"Price: $%1 <br/>Max speed: %4<br/>Horsepower: %3<br/>Passenger seats: %4<br/>Fuel capacity: %5L",
	_price,getNumber(_config >> "maxSpeed"),getNumber(_config >> "enginePower"),getNumber(_config >> "transportSoldier"),getNumber(_config >> "fuelCapacity")
];

private _ctrl = _display displayCtrl 2100;
lbClear _ctrl;

if !(isClass(missionConfigFile >> "Textures" >> "Vehicle" >> _className)) then {
	_className = "Default"
};

{
	_x params ["_textureName","","_conditions"];
	if ([_conditions] call DT_fnc_conditionChecker) then {
		_ctrl lbAdd _textureName;
		_ctrl lbSetValue [(lbSize _ctrl)-1,_forEachIndex];
	};
} forEach (getArray(missionConfigFile >> "Textures" >> "Vehicle" >> _className >> "textures"));

_ctrl lbSetCurSel 0;