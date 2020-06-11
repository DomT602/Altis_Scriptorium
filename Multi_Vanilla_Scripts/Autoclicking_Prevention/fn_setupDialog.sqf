/*
    File: fn_setupDialog.sqf
    Author: DomT602
    Description: Sets up the display for the autoclick preventer
*/
params [
	["_display",displayNull,[displayNull]]
];

private _idd = ctrlIDD _display;
("getNumber (_x >> 'idd') isEqualTo _idd" configClasses configFile) params ["_path"];

private _configString = str _path;
private _startIndex = (_configString find ".bin/") + 5;
private _displayName = _configString select [_startIndex];

{
	if (ctrlType _x in [1,16]) then { //1 is normal buttons, 16 is shortcut buttons
		private _action = getText(configFile >> _displayName >> "controls" >> (ctrlClassName _x) >> "onButtonClick");
		if (_action != "") then {
			_x ctrlRemoveAllEventHandlers "mouseButtonClick";
			_action = format ["[""%1""] call life_fnc_clickerQueue",_action];
			_x ctrlAddEventHandler ["mouseButtonClick",_action];
		};
	};
} forEach (allControls _display);