/*
	File: fn_spawnSelectionChanged.sqf
	Author: Dom
	Description: Updates map and camera positions once spawn selection is changed
*/
params [
	["_control",controlNull,[controlNull]],
	["_index",0,[0]]
];

private _position = parseSimpleArray (_control lbData _index);

private _display = findDisplay 1049;
private _mapControl = _display displayCtrl 1200;
_mapControl ctrlMapAnimAdd [2,0.3,_position];
ctrlMapAnimCommit _mapControl;

DT_spawnCamera camSetTarget _position;
DT_spawnCamera camSetRelPos [0,270,500];
DT_spawnCamera camCommit 2;