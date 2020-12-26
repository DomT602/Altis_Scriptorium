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
if !(phone_showPopup) exitWith {[format["You have recieved a message from %1.",_brief]] call DT_fnc_notify};

private _fnc_showDetails = {
	params ["_brief","_message"];
	656 cutRsc ["DT_popupPhone","PLAIN"];
	private _phone = uiNamespace getVariable ["DT_popupPhone",displayNull];
	(_phone displayCtrl 1100) ctrlSetStructuredText parseText _brief;
	(_phone displayCtrl 1101) ctrlSetStructuredText parseText _message;
	(_phone displayCtrl 1200) ctrlSetText (phone_settings select 0);
	[
		{
			656 cutText ["","PLAIN"];
		},
		0,
		10
	] call CBA_fnc_waitAndExecute;
};

private _phone = uiNamespace getVariable ["DT_popupPhone",displayNull];
if (isNull _phone) then {
	[_brief,_message] call _fnc_showDetails;
} else {
	[
		{
			isNull (uiNamespace getVariable ["DT_popupPhone",displayNull])
		},
		{
			(_this select 0) call (_this select 1)
		},
		[[_brief,_message],_fnc_showDetails]
	] call CBA_fnc_waitUntilAndExecute;
};