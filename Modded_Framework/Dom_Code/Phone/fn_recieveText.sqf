/*
	File: fn_recieveText.sqf
	Author: Dom
	Description: Recieves a text message - phone_inbox in the format of [sender,message,summary]
*/
params [
	["_message","",[""]],
	["_incNumber","",[""]],
	["_date",[],[[]]],
	["_type",false,[false]],
	["_sender",objNull,[objNull]]
];
if (_message isEqualTo "" || {_incNumber isEqualTo ""} || {isNull _sender}) exitWith {};

private "_brief";
_date params ["_year","_month","_day","_hour","_minute"];
if (_type) then {
	_brief = format["911: %1 (%2) - %3-%4-%5 | %6:%7",name _sender,_incNumber,_day,_month,_year,_hour,_minute];
} else {
	private _name = "";
	{
		_x params [
			["_cName","",[""]],
			["_cNumber","",[""]]
		];
		
		if (_cNumber isEqualTo _incNumber) exitWith {
			_name = _cName
		};
	} forEach phone_contacts;
	_brief = format["SMS: %1 - %2-%3-%4 | %5:%6",_incNumber,_day,_month,_year,_hour,_minute];
	if !(_name isEqualTo "") then {
		_brief = format["SMS: %1 (%2) - %3-%4-%5 | %6:%7",_incNumber,_name,_day,_month,_year,_hour,_minute]
	};
};
phone_inbox pushBack [_message,_brief];
[_brief,_message] call DT_fnc_popupPhone;
phone_settings params ["_soundMode"];
if (_soundMode isEqualTo 1) then {
	player say3D ["some_buzz",50,1];
};

if (phone_appOpen isEqualTo 1) then {
	call DT_fnc_initInbox;
};