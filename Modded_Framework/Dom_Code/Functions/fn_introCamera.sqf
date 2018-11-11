 /*
	File: fn_introCamera.sqf
	Author: Dom
	Description: When a player connects to the server, plays an intro (while the player is initialising)
*/


private _camera = "camera" camCreate ((getPosATL player) vectorAdd [0,0,1500]);
_camera cameraEffect ["internal","back"];
showCinemaBorder false;
_camera camSetTarget player;
_camera camSetFOV 0.7;
_camera camCommit 0.25;
waitUntil {camCommitted _camera};

_camera camSetFOV 2.000;
_camera camSetTarget player;
_camera camSetRelPos [0,-2.5,5];
_camera camCommit 3;
waitUntil {camCommitted _camera};

_camera camSetFOV 1.500;
_camera camSetTarget player;
_camera camSetRelPos [0,-1.5,2];
_camera camCommit 1;
waitUntil {camCommitted _camera};

_camera camSetTarget player;
_camera camSetRelPos [0,-1,1.85];
_camera camCommit 0.5;
waitUntil {camCommitted _camera};

_camera camSetTarget player;
_camera camSetRelPos [0,-0.05,1.85];
_camera camCommit 0.25;
waitUntil {camCommitted _camera};

_camera cameraEffect ["terminate","back"];
camDestroy _camera;