/*
	File: fn_createCamera.sqf
	Author: Dom
	Description: Sets up a portable camera
*/
params [
	["_position",[],[[]]]
];

private _cameraObj = createVehicle ["camera",_position,[],0];
_cameraObj addEventHandler ["handleDamage",{
	params ["_cameraObj"]; 
	private _index = client_cameras findIf {_x select 0 isEqualTo _cameraObj};
	if (_index isEqualTo -1) exitWith {};
	private _camera = (client_cameras select _index) select 1;
	_camera cameraEffect ["terminate","back"];
	deleteVehicle _cameraObj;
	camDestroy _camera;
	client_cameras deleteAt _index;
}];

private _camera = "CamCurator" camCreate _position;
//_camera cameraEffect ["internal","back"]; //FixedWithZoom
_camera camCommand "speedDefault 0";
_camera camCommand "speedMax 0";

client_cameras pushBack [_cameraObj,_camera]; //may have to make this send to server 