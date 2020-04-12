/*
	File: fn_seeMessage.sqf
	Author: Dom
	Description: Recieves a text message
*/
params [
	["_number","",[""]],
	["_messages",[],[[]]]
];

closeDialog 0;
createDialog "DT_seeMessage";
[phone_appOpen] call DT_fnc_updatePhone;
private _display = findDisplay 1035;
private _name = [_number] call DT_fnc_findContact;
if (_name isEqualTo "") then {
	(_display displayCtrl 1103) ctrlSetStructuredText parseText _number;
} else {
	(_display displayCtrl 1103) ctrlSetStructuredText parseText _name;
};

uiNamespace setVariable ["number",_number];
private _controlGroup = _display displayCtrl 2300;
(ctrlPosition _controlGroup) params ["_xPos","_yPos","_width","_length"];

private _pos = 0;

{
	_x params ["_own","_message"];
	private _control = _display ctrlCreate ["RscPhoneText",-1,_controlGroup];

	(if (_own) then {
		[(_width / 2),[0,0,1,1]]
	} else {
		[0,[0,1,0,1]]
	}) params ["_xShift","_colour"];
	_control ctrlSetStructuredText parseText _message;
	_control ctrlSetPosition [_xShift,_pos,(_width / 2),(ctrlTextHeight _control)];
	_control ctrlCommit 0;
	_control ctrlSetPosition [_xShift,_pos,(_width / 2),(ctrlTextHeight _control)];
	_control ctrlCommit 0;
	_control ctrlSetBackgroundColor _colour;
	_pos = ((ctrlPosition _control) select 1) + ((ctrlPosition _control) select 3) + 0.01;
} forEach _messages;

uiNamespace setVariable ["height",_pos];