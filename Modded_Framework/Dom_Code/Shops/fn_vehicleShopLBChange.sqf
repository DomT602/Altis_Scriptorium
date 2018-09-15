/*
	File: fn_vehicleShopLBChange.sqf
	Author: Dom
	Description: Called on the LB change
*/
disableSerialization;
params [
	["_control",controlNull,[controlNull]],
	["_index",-1,[0]]
];

private _className = _control lbData _index;
private _price = _control lbValue _index;

private _maxspeed = getNumber(configFile >> "CfgVehicles" >> _className >> "maxSpeed");
private _horsepower = getNumber(configFile >> "CfgVehicles" >> _className >> "enginePower");
private _passengerSeats = getNumber(configFile >> "CfgVehicles" >> _className >> "transportSoldier");
private _fuel = getNumber(configFile >> "CfgVehicles" >> _className >> "fuelCapacity");
if !((typeOf client_preview) == _className) then {
	detach client_target;
	deleteVehicle client_preview;
	client_preview = _className createVehicleLocal [130.881, 10103.191, 0];
	client_target attachTo [client_preview,client_cameraSettings select 3,""];
};

private _display = findDisplay 1015;
(_display displayCtrl 1200) ctrlSetStructuredText parseText format [
	("Price:")+ " <t color='#8cff9b'>$%1</t><br/>" +
	("Max speed:")+ " %2 km/h<br/>" +
	("Horsepower:")+ " %3<br/>" +
	("Passenger seats:")+ " %4<br/>" +
	("Fuel capacity:")+ " %5<br/>",
	str(_price),
	_maxspeed,
	_horsepower,
	_passengerSeats,
	_fuel
];

private _ctrl = (_display displayCtrl 2100);
lbClear _ctrl;

if (!isClass (missionConfigFile >> "Textures" >> "Vehicle" >> _className)) then {
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

true;
