/*
	File: fn_showNotifs.sqf
	Author: DomT602 (domt602@gmail.com)
	Description: Displays the notification stored in the array
*/
private _block = "";
for "_i" from 0 to 14 do {
	(DT_notifArray select _i) params [["_text","",[""]]];
	if !(_text isEqualTo "") then {
		_block = _block + _text + "<br/>";
	};
};

((uiNamespace getVariable ["DT_Notifs",displayNull]) displayCtrl 1200) ctrlSetStructuredText parseText _block;