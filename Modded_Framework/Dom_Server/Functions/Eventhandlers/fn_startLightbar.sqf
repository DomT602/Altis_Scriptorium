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
		private _position = [0,0,1];
		private _light = "Dom_Client/gottaBeWhereTheLightTextureIs";
		private _blue = [0,0,1];
		private _red = [1,0,0];

		private _light = "#lightpoint" createVehicle getPosATL _vehicle;
		_light setLightBrightness 1;
		_light setLightAmbient _blue;
		_light setLightColor _blue;
		_light setLightDayLight true;
		_light attachTo [_vehicle,_position];
		_light setLightAttenuation [3,4,4,0,10,30];

		while {_vehicle getVariable ["lightbar",false] && alive _vehicle} do {
			if (_vehicle getVariable ["siren",false]) then {

			} else {
				_light setLightBrightness 0.1;
				_vehicle setObjectTexture [1,""]; //do this for each set of lights, "" = off, _light = on
				_vehicle setObjectTexture [2,_light];
				_light setLightColor _red;
				_light setLightAmbient _red;
				sleep 0.2;
				_light setLightColor _blue;
				_light setLightAmbient _blue;
				sleep 0.2;
			};
		};
		_vehicle setObjectTexture [1,""]; //reset each section of lightbar
		_vehicle setObjectTexture [2,""];
		deleteVehicle _light;
	};
};