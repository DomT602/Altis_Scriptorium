#include "..\..\script_macros.hpp"
/*
	File: fn_showNotifs.sqf
	Author: DomT602 (domt602@gmail.com)
	Description: Displays the notification stored in the array
*/
private _block = "";
for "_i" from 0 to (MAX_MESSAGES - 1) do {
	(DT_notif_array select _i) params [["_text","",[""]]];
	if !(_text isEqualTo "") then {
		_block = _block + _text + "<br />";
	};
};

((uiNamespace getVariable ["DT_Notif_Display",displayNull]) displayCtrl 6591) ctrlSetStructuredText parseText _block;