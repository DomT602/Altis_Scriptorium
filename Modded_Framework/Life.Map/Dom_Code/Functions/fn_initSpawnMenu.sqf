/*
	File: fn_initSpawnMenu.sqf
	Author: Dom
	Description: Initiliases the spawn menu and populates it
*/
params [
	["_houses",[],[[]]]
];

createDialog "DT_spawnMenu";
private _display = findDisplay 1049;
_display displaySetEventHandler ["KeyDown","true"];

private _spawnPoints = getArray(missionConfigFile >> "Misc" >> "spawnPoints");
private _listbox = _display displayCtrl 1500;
{
	_x params ["_name","_marker","_conditions"];
	if ([_conditions] call DT_fnc_conditionChecker) then {
		_listbox lbAdd _name;
		_listbox lbSetData [(lbSize _listbox) - 1,str(getMarkerPos _marker)];
	};
} forEach _spawnPoints;

{
	private _name = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
	_listbox lbAdd _name;
	private _spawnCoords = selectRandom (_x buildingPos -1);
	if (_spawnCoords isEqualTo [0,0,0]) then {_spawnCoords = getPosATL _x};
	_listbox lbSetData [(lbSize _listbox) - 1,str(_spawnCoords)];
} forEach _houses;

showCinemaBorder false;
DT_spawnCamera = "camera" camCreate [worldSize / 2,worldSize / 2,500];
DT_spawnCamera cameraEffect ["internal","back"];
_listbox lbSetCurSel 0;