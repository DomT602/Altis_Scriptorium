/*
    File: fn_onMouseButtonDown.sqf
    Author: Dom
    Description: Handles when mouse button is pressed
*/

params [
	"",
	["_arguments",[],[[]]]
];
_arguments params ["", "_button", "_xPos", "_yPos"];

client_mouseButtons set [_button, [_xPos, _yPos]];
