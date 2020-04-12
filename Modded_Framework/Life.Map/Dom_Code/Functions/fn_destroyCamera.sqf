/*
	File: fn_destroyCamera.sqf
	Author: Dom
	Description: Destroys a chosen camera
*/
private _cameraList = (findDisplay -1) displayCtrl 1500;
private _index = lbCurSel _cameraList;
if (_index isEqualTo -1) exitWith {};

(parseSimpleArray (_cameraList lbData _index)) params [["_cameraObj",objNull,[objNull]],"_camera"];
_camera cameraEffect ["terminate","back"];
_cameraList lbDelete _index;
deleteVehicle _cameraObj;
camDestroy _camera;
client_cameras deleteAt _index;
//small noise?