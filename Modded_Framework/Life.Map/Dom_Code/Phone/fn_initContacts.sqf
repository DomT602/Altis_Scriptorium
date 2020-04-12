/*
	File: fn_initContacts.sqf
	Author: Dom
	Description: Initiliases the contacts menu
*/

createDialog "DT_contacts";
[phone_appOpen] call DT_fnc_updatePhone;
private _display = findDisplay 1036;
private _controlGroup = _display displayCtrl 2300;
(ctrlPosition _controlGroup) params ["_xPos","_yPos","_width","_length"];

private _pos = 0;

{
	_x params ["","_name"];
	
	private _control = _display ctrlCreate ["RscPhoneText",-1,_controlGroup];
	_control ctrlSetStructuredText parseText format["<img image='\Dom_UI\phone\icons\messagebox.paa'></img>%1",_name];
	_control ctrlSetPosition [0,_pos,_width,ctrlTextHeight _control];
	_control ctrlCommit 0;
	
	_control ctrlAddEventHandler ["mouseButtonDown",format["['load',%1] call DT_fnc_editContact",_x]];
	_control ctrlSetBackgroundColor [0,0,0,0.3];
	_pos = ((ctrlPosition _control) select 1) + ((ctrlPosition _control) select 3) + 0.01;
} forEach phone_contacts;