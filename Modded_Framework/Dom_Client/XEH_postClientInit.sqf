#include "\a3\editor_f\Data\Scripts\dikCodes.h"
/*
	File: XEH_preClientInit.sqf
	Author: CBA & Dom
	Description: Inits the customisable keybinds via CBA
*/
[["CommunityHere","Vehicle"],"unlock_lock", "Unlock/Lock", {if (client_blockActions) exitWith {}; call DT_fnc_lockSwitch}, "", [DIK_U, [false, false, false]]] call CBA_fnc_addKeybind;
[["CommunityHere","Vehicle"],"seatbelt_switch", "Seatbelt", {if (client_blockActions) exitWith {}; call DT_fnc_seatbelt}, "", [DIK_F1, [false, false, false]]] call CBA_fnc_addKeybind;
[["CommunityHere","General"],"medical_menu", "Medical Menu", {
	if (client_blockActions) exitWith {}; 
	if (isNull objectParent player && isPlayer cursorObject) then {
	    [cursorObject] call DT_fnc_medicalMenuOther
	} else {
	    call DT_fnc_medicalMenuSelf
	};
}, "", [DIK_H, [false, false, false]]] call CBA_fnc_addKeybind;
[["CommunityHere","General"],"interaction", "Interaction Menu", {if (client_blockActions) exitWith {}; [cursorObject] call DT_fnc_openRadial}, "", [DIK_LWIN, [false, false, false]]] call CBA_fnc_addKeybind;
[["CommunityHere","General"],"phone", "Open phone", {if (client_blockActions) exitWith {}; call DT_fnc_openPhone}, "", [DIK_Y, [false, false, false]]] call CBA_fnc_addKeybind;
[["CommunityHere","General"],"holster_switch", "Holster", {if (client_blockActions) exitWith {}; call DT_fnc_holster}, "", [DIK_H, [true, false, false]]] call CBA_fnc_addKeybind;
[["CommunityHere","Police"],"siren_switch", "Switch sirens", {if (client_blockActions) exitWith {}; [0] call DT_fnc_switchSirens}, "", [DIK_9, [false, false, false]]] call CBA_fnc_addKeybind;
[["CommunityHere","Police"],"lightbar_switch", "Switch lightbar", {if (client_blockActions) exitWith {}; call DT_fnc_switchLightbar}, "", [DIK_8, [false, false, false]]] call CBA_fnc_addKeybind;
[["CommunityHere","General"],"surrender", "Surrender", {
	if (client_blockActions || !isNull objectParent player) exitWith {}; 
	call DT_fnc_switchSurrender;
}, "", [DIK_F2, [true, false, false]]] call CBA_fnc_addKeybind;
[["CommunityHere","Police"],"restrain", "Restrain", {if (client_blockActions) exitWith {}; [cursorObject] call DT_fnc_restrain}, "", [DIK_R, [true, false, false]]] call CBA_fnc_addKeybind;
[["CommunityHere","General"],"knock_out", "Knock out", {if (client_blockActions) exitWith {}; [cursorObject] call DT_fnc_knockOut}, "", [DIK_G, [true, false, false]]] call CBA_fnc_addKeybind;