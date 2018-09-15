/*
	File: fn_initInbox.sqf
	Author: Dom
	Description: Initiliases (or refreshes) the message inbox, _number comes from contacts menu if used
*/
params [
	["_number","",[""]]
];

private _phone = uiNamespace getVariable ["DT_Phone",displayNull];
if !(_number isEqualTo "") then {
	(_phone displayCtrl -1) ctrlSetText _number;
};

private _array = +phone_inbox; //make a deep copy of the array
_array = reverse _array; //get newest first
private _messageLB = _phone displayCtrl -1;
lbClear _messageLB;

{
	_x params ["",["_brief","",[""]]];
	_messageLB lbAdd _brief
} forEach _array;

lbSetCurSel [-1, 0];//idc