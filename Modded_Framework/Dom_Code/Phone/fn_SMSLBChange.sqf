/*
	File: fn_SMSLBChange.sqf
	Author: Dom
	Description: Changes the message on screen when listbox is changed on phone
*/

private _index = lbCurSel -1;
(phone_inbox select _index) params ["_message"];
private _messageText = format["<t size='0.6' color='#FFFFFF' align='left'>%1</t>",_message];
((uiNamespace getVariable "DT_Phone") displayCtrl -1) ctrlSetStructuredText parseText _messageText;