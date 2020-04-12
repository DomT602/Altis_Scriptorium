/*
	File: fn_dialPad.sqf
	Author: Dom
	Description: Fills in the selected number
*/
params [
	["_number","",[""]]
];

//[player,["number_enter",25,1]] remoteExecCall ["say3D",-2];
private _numbers = uiNamespace getVariable ["callNumber",""];
private _finalNumber = format ["%1%2",_numbers,_number];
((findDisplay 1033) displayCtrl 1102) ctrlSetStructuredText parseText format["<t color='#7A7A7A' align='center' size='1.5'>%1</t>",_finalNumber];
uiNamespace setVariable ["callNumber",_finalNumber];