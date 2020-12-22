 /*
	File: fn_introCamera.sqf
	Author: Dom
	Description: Plays the intro camera
*/
params [
	["_camera",objNull,[objNull]]
];

showCinemaBorder false;
if (isNull _camera) then {
	_camera = "camera" camCreate ((getPosATL player) vectorAdd [0,0,500]);
};
_camera cameraEffect ["internal","back"];
_camera camSetTarget player;
_camera camSetFOV 0.7;
_camera camCommit 0.1;
waitUntil {camCommitted _camera};

_camera camSetFOV 2;
_camera camSetRelPos [0,-2.5,3];
_camera camCommit 3;
waitUntil {camCommitted _camera};

_camera camSetFOV 1.5;
_camera camSetRelPos [0,-1.5,2];
_camera camCommit 1;
waitUntil {camCommitted _camera};

_camera camSetRelPos [0,-1,1.85];
_camera camCommit 0.5;
waitUntil {camCommitted _camera};

_camera camSetRelPos [0,-0.05,1.85];
_camera camCommit 0.25;
waitUntil {camCommitted _camera};

_camera cameraEffect ["terminate","back"];
camDestroy _camera;