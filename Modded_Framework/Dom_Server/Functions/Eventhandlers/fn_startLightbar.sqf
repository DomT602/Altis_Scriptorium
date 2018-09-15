/*
	File: fn_startLightbar.sqf
	Author: Dom
	Description: Starts and monitors the lightbar
*/

params [
	["_vehicle",objNull,[objNull]]
];

switch (typeOf _vehicle) do {
	case "Default": {
		private _blueLightPos = [0,0,1];
		private _redLightPos = [0,0,1];
		private _light = "PS_Client/gottaBeWhereTheLightTextureIs";

		private _lightBlue = "#lightpoint" createVehicle (getPosATL _vehicle);    
		_lightBlue setLightBrightness 0.1;   
		_lightBlue setLightAmbient [0, 0, 1];    
		_lightBlue setLightColor [0, 0, 1];
		_lightBlue setLightDayLight true; 
		_lightBlue attachTo [_vehicle,_blueLightPos]; 
		_lightBlue setLightAttenuation [3,4,4,0,10,30];    

		private _lightRed = "#lightpoint" createVehicle (getPosATL _vehicle);    
		_lightRed setLightBrightness 0;   
		_lightRed setLightAmbient [1, 0, 0];    
		_lightRed setLightColor [1, 0, 0];
		_lightRed setLightDayLight true; 
		_lightRed attachTo [_vehicle,_redLightPos]; 
		_lightRed setLightAttenuation [3,4,4,0,10,30];   

		while {_vehicle getVariable ["lightbar",false]} do {
			if !(alive _vehicle) exitWith {}; 
			_lightBlue setLightBrightness 0; 
			_lightRed setLightBrightness 0.1;
			_vehicle setObjectTexture [1,""]; //do this for each set of lights, "" = off, _light = on
			_vehicle setObjectTexture [2,_light]; 
			sleep 0.2; 
			_lightBlue setLightBrightness 0.1; 
			_lightRed setLightBrightness 0; 
			sleep 0.2; 
		};

		_vehicle setObjectTexture [1,""]; //reset each section of lightbar
		_vehicle setObjectTexture [2,""]; 
		deleteVehicle _lightBlue;
		deleteVehicle _lightRed;
	};
};