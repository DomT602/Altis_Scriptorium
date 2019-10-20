/*
	File: fn_initInbox.sqf
	Author: Dom
	Description: Initiliases the message inbox
*/

createDialog "DT_messages";
[phone_appOpen] call DT_fnc_updatePhone;
private _display = findDisplay 1034;
private _controlGroup = _display displayCtrl 2300;
(ctrlPosition _controlGroup) params ["_xPos","_yPos","_width","_length"];

private _pos = 0;

{
	_x params ["_number","_messages"];
	private _lastMessage = (_messages select (count _messages - 1)) select 1;
	{
		_x params [
			["_cNumber","",[""]],
			["_cName","",[""]]
		];
		
		if (_cNumber isEqualTo _number) exitWith {
			_number = _cName
		};
	} forEach phone_contacts;
	private _control = _display ctrlCreate ["RscPhoneText",-1,_controlGroup];
	
	_control ctrlSetStructuredText parseText format["%1<br/>%2",_number,_lastMessage];
	_control ctrlSetPosition [0,_pos,_width,ctrlTextHeight _control];
	_control ctrlCommit 0;
	
	_control ctrlAddEventHandler ["mouseButtonDown",format["%1 call DT_fnc_seeMessage",_x]];
	_control ctrlSetBackgroundColor [0,0,0,0.3];
	_pos = ((ctrlPosition _control) select 1) + ((ctrlPosition _control) select 3) + 0.01;
} forEach phone_inbox;