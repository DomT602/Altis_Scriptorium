/*
	File: fn_dialPad.sqf
	Author: Dom
	Description: Fills in the selected number
*/

params [
	["_number",-1,[0]]
];

player say3D "number_enter";
private _numbers = uiNamespace getVariable "number_array";
private _finalNumber = format ["%1%2",_numbers,str(_number)];
((uiNamespace getVariable "DT_Phone") displayCtrl -1) ctrlSetStructuredText parseText format["<t color='#7A7A7A' align='center' size='1.5'>%1</t>",_finalNumber];
uiNamespace setVariable ["number_array",_finalNumber];