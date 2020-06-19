/*
	File: fn_DBasync.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Commits an asynchronous call to ExtDB3
*/
params [
	["_queryStmt", "", [""]],
	["_mode", 0, [0]],
	["_multi",false,[false]]
];

private _key = "extDB3" callExtension format["%1:%2:%3",_mode, (call extDB_SQL_CUSTOM_ID), _queryStmt];
if (_mode isEqualTo 1) exitWith {true};

_key = parseSimpleArray format ["%1",_key];
_key = _key select 1;
private _queryResult = "extDB3" callExtension format ["4:%1", _key];

//Make sure the data is received
if (_queryResult isEqualTo "[3]") then {
	for "_i" from 0 to 1 step 0 do {
		if !(_queryResult isEqualTo "[3]") exitWith {};
		_queryResult = "extDB3" callExtension format ["4:%1", _key];
	};
};

// extDB3 returned that result is Multi-Part Message
if (_queryResult isEqualTo "[5]") then {
	_queryResult = "";
	for "_i" from 0 to 1 step 0 do {
		private _pipe = "extDB3" callExtension format ["5:%1", _key];
		if (_pipe isEqualTo "") exitWith {};
		_queryResult = _queryResult + _pipe;
	};
};
_queryResult = parseSimpleArray _queryResult;
if ((_queryResult select 0) isEqualTo 0) exitWith {diag_log format ["extDB3: Protocol Error: %1", _queryResult]; []};
private _return = (_queryResult select 1);
if (!_multi && !(_return isEqualTo [])) then {
	_return = _return select 0;
};
_return