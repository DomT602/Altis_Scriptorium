/*
	File: fn_setupCamera.sqf
	Author: Dom
	Description: Sets up the preview camera
*/
params [
	["_type","",[""]],
	["_data","",["",objNull]],
	["_pos",[],[[]]]
];
if (_data isEqualType "") then {
	client_preview = _data createVehicleLocal _pos;
	if (_type isEqualTo "Clothing") then {
		client_preview setUnitLoadout (getUnitLoadout player);
		client_preview setFace (face player);
	} else {
		if (_type isEqualTo "Item") then {
			client_cameraSettings set [0,2];
			client_preview setPosATL _pos;
		};
	};
} else {
	client_preview = _data;	
};

client_target = createAgent ["Logic",position client_preview,[],0,"CAN_COLLIDE"];//createVehicleLocal?
client_target attachTo [client_preview,client_cameraSettings select 3,""];

client_camera = "CAMERA" camCreate position client_preview;
client_camera cameraEffect ["Internal", "Back"];
client_camera camPrepareFocus [-1,-1];
client_camera camPrepareFov 0.35;
client_camera camCommitPrepared 0;
["#(argb,8,8,3)color(0,0,0,1)",false,nil,0,[0,0.5]] call bis_fnc_textTiles;

[controlNull,0,0] call DT_fnc_handleMouse;
preview_handle = addMissionEventHandler ["draw3D",{call DT_fnc_updateCamera}];