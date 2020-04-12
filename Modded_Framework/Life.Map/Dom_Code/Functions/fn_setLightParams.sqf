/*
	File: fn_setLightParams.sqf
	Author: Dom
	Description: Sets the light parameters (as they are local to client)
*/
params [
	["_object",objNull,[objNull]],
	["_brightness",0.3,[0]],
	["_attenuation",[],[[]]],
	["_colour",[1,0.45,0],[[]]],
	["_ambient",[1,0.5,0],[[]]]
];

_object setLightBrightness _brightness;
_object setLightAttenuation _attenuation;
_object setLightColor _colour;
_object setLightAmbient _ambient;