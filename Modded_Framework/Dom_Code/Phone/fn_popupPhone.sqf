/*
	File: fn_popupPhone.sqf
	Author: Dom
	Description: When a message is recieved, shows a notification
*/

params [
	["_brief","",[""]],
	["_message","",[""]]
];
if (_brief isEqualTo "" || {_message isEqualTo ""}) exitWith {};

657 cutText ["","PLAIN"];
657 cutRsc ["DT_Phone_HUD","PLAIN"];
_brief = parseText format ["<t size='0.6' color='#e0e2ef' align='center'>%1</t>",_brief];
_message = parseText format ["<t size='0.6' color='#FFFFFF' align='left'>%1</t>",_message];
private _HUD = uiNamespace getVariable ["DT_Phone_HUD",displayNull];
(_HUD displayCtrl -1) ctrlSetStructuredText _brief;
(_HUD displayCtrl -1) ctrlSetStructuredText _message;
(_HUD displayCtrl -1) ctrlSetText (phone_settings select 1);

[
	{
		params ["_count"];
		if (_count isEqualTo (count phone_inbox)) then {
			657 cutText ["","PLAIN"];
		};
	},
	count phone_inbox,
	10
] call CBA_fnc_waitAndExecute;