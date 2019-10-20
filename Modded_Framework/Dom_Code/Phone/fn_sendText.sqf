/*
	File: fn_sendText.sqf
	Author: Dom
	Description: Sends a text message
*/
private _display = findDisplay 1040;
private _message = ctrlText 1400;
private _targetNumber = ctrlText 1401;
if (isNull _display) then {
	_targetNumber = uiNamespace getVariable ["number",""];
	_display = findDisplay 1035;
};
private _myNumber = player getVariable ["phoneNumber",""];

if (_message isEqualTo "") exitWith {["You didn't enter a message.","orange"] call DT_fnc_notify};
if (_targetNumber isEqualTo "") exitWith {["You didn't enter a number.","orange"] call DT_fnc_notify};
if (count _targetNumber > 6 || count _targetNumber < 3) exitWith {["Invalid number, text failed.","orange"] call DT_fnc_notify};
_message = (_message splitString "&") joinString "and";

if (_targetNumber isEqualTo "911") then {
	private _units = [];
	{
		if (_x getVariable ["faction","civ"] in ["cop","medic"]) then {
			_units pushBack _x
		};
	} forEach playableUnits;
	[_message,_myNumber,date,true,profileName] remoteExecCall ["DT_fnc_recieveText",_units];
} else {
	private _toText = objNull;
	{
		private _selNumber = _x getVariable ["phoneNumber",""];
		if (_selNumber isEqualTo _targetNumber) exitWith {
			_toText = _x
		};
	} forEach playableUnits;
	if !(isNull _toText) then {
		[_message,_myNumber,date,false] remoteExecCall ["DT_fnc_recieveText",_toText];
	} else {
		_message = "This number is not currently avaliable, try again later.";
		[_targetNumber,_message] call DT_fnc_popupPhone;
	};
	private _index = phone_inbox findIf {_x select 0 isEqualTo _targetNumber};
	if (_index isEqualTo -1) then {
		phone_inbox pushBack [_targetNumber,[[true,_message]]];
	} else {
		(phone_inbox select _index) params ["_number","_messages"];
		_messages pushBack [true,_message];
	};
};
(_display displayCtrl 1400) ctrlSetText "";
if (isNull (findDisplay 1040)) then {
	private _pos = uiNamespace getVariable ["height",0];
	_display = findDisplay 1035;
	private _controlGroup = _display displayCtrl 2300;
	(ctrlPosition _controlGroup) params ["_xPos","_yPos","_width","_length"];
	private _control = _display ctrlCreate ["RscPhoneText",-1,_controlGroup];
	_control ctrlSetStructuredText parseText _message;
	_control ctrlSetPosition [(_width / 2),_pos,(_width / 2),(ctrlTextHeight _control)];
	_control ctrlCommit 0;
	_control ctrlSetPosition [(_width / 2),_pos,(_width / 2),(ctrlTextHeight _control)];
	_control ctrlCommit 0;
	_control ctrlSetBackgroundColor [0,0,1,1];
	_pos = ((ctrlPosition _control) select 1) + ((ctrlPosition _control) select 3) + 0.01;
	uiNamespace setVariable ["height",_pos];
} else {
	closeDialog 0;	
};