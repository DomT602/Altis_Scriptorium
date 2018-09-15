/*
	File: fn_sendText.sqf
	Author: Dom
	Description: Sends a text message
*/

private _message = ctrlText -1;
private _targetNumber = ctrlText -1;
private _myNumber = player getVariable ["phoneNumber",""];

if (_message isEqualTo "") exitWith {["You didn't enter a message.","orange"] call DT_fnc_notify};
if (_targetNumber isEqualTo "") exitWith {["You didn't enter a number.","orange"] call DT_fnc_notify};
//_message = toString((toArray _message) apply {[_x, 110] select (_x isEqualTo 38)}); removes & which bugs the message

if (_targetNumber isEqualTo "911") then {
	private _units = [];
	{
		if (_x getVariable ["faction","civ"] in ["cop","medic"]) then {
			_units pushBack _x
		};
	} forEach playableUnits;
	[_message,_myNumber,date,true,player] remoteExecCall ["DT_fnc_recieveText",_units];
} else {
	private _toText = objNull;
	{
		_selNumber = _x getVariable ["phoneNumber",""];
		if (_selNumber isEqualTo _targetNumber) exitWith {
			_toText = _x
		};
	} forEach playableUnits;
	if !(isNull _toText) then {
		[_message,_myNumber,date,false,player] remoteExecCall ["DT_fnc_recieveText",_toText];
	} else {
		_message = format["Sorry, the number: %1 is not avaliable, try again later!",_targetNumber];
		[_message,_myNumber,date,false,player] remoteExecCall ["DT_fnc_recieveText",player];
	};
};