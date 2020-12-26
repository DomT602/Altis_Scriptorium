#include "\a3\editor_f\Data\Scripts\dikCodes.h"
/*
	File: XEH_preClientInit.sqf
	Author: CBA & Dom
	Description: Inits the customisable keybinds via CBA
*/
[["Community Here","Vehicle"],"unlockLock", "Unlock/Lock", {if (client_blockActions) exitWith {}; call DT_fnc_lockSwitch}, "", [DIK_U, [false, false, false]]] call CBA_fnc_addKeybind;
[["Community Here","Vehicle"],"seatbeltSwitch", "Seatbelt", {if (client_blockActions) exitWith {}; call DT_fnc_seatbelt}, "", [DIK_B, [false, false, false]]] call CBA_fnc_addKeybind;
[["Community Here","General"],"medicalMenu", "Medical Menu", {
	if (client_blockActions || dialog) exitWith {}; 
	if (isNull objectParent player && isPlayer cursorObject) then {
		[cursorObject] call DT_fnc_openMedicalMenu
	} else {
		[player] call DT_fnc_openMedicalMenu
	};
}, "", [DIK_H, [false, false, false]]] call CBA_fnc_addKeybind;
[["Community Here","General"],"interaction", "Interaction Menu", {if (client_blockActions) exitWith {}; [cursorObject] call DT_fnc_openRadial}, "", [DIK_LWIN, [false, false, false]]] call CBA_fnc_addKeybind;
[["Community Here","General"],"phone", "Open phone", {if (client_blockActions) exitWith {}; call DT_fnc_openPhone}, "", [DIK_Y, [false, false, false]]] call CBA_fnc_addKeybind;
[["Community Here","General"],"chargePhone", "Charge phone", {if (client_blockActions) exitWith {}; call DT_fnc_chargePhone}, "", [DIK_C, [true, false, false]]] call CBA_fnc_addKeybind;
[["Community Here","General"],"companyMenu", "Company menu", {if (client_blockActions) exitWith {}; call DT_fnc_openCompanyMenu}, "", [DIK_F2, [false, false, false]]] call CBA_fnc_addKeybind;
[["Community Here","General"],"craftingMenu", "Crafting menu", {if (client_blockActions) exitWith {}; call DT_fnc_openCraftMenu}, "", [DIK_F3, [false, false, false]]] call CBA_fnc_addKeybind;
[["Community Here","General"],"holsterSwitch", "Holster", {if (client_blockActions) exitWith {}; call DT_fnc_holster}, "", [DIK_H, [true, false, false]]] call CBA_fnc_addKeybind;
[["Community Here","Police"],"sirenSwitch", "Switch sirens", {if (client_blockActions) exitWith {}; call DT_fnc_switchSirens}, "", [DIK_9, [false, false, false]]] call CBA_fnc_addKeybind;
[["Community Here","Police"],"lightbarSwitch", "Switch lightbar", {if (client_blockActions) exitWith {}; call DT_fnc_switchLightbar}, "", [DIK_8, [false, false, false]]] call CBA_fnc_addKeybind;
[["Community Here","General"],"surrender", "Surrender", {
	if (client_blockActions || !isNull objectParent player) exitWith {}; 
	call DT_fnc_switchSurrender;
}, "", [DIK_F2, [true, false, false]]] call CBA_fnc_addKeybind;
[["Community Here","Police"],"restrain", "Restrain", {if (client_blockActions || (player getVariable ["faction","cop"] != "cop")) exitWith {}; [cursorObject] call DT_fnc_restrain}, "", [DIK_R, [true, false, false]]] call CBA_fnc_addKeybind;
[["Community Here","General"],"knockOut", "Knock out", {if (client_blockActions) exitWith {}; [cursorObject] spawn DT_fnc_knockOut}, "", [DIK_G, [true, false, false]]] call CBA_fnc_addKeybind;
[["Community Here","Police"],"tablet", "Police tablet", {if (client_blockActions) exitWith {}; call DT_fnc_initDatabase}, "", [DIK_7, [false, false, false]]] call CBA_fnc_addKeybind;
[["Community Here","General"],"earplugs", "Earplugs", {if (client_blockActions) exitWith {}; if (client_earPlugs) then {["Earplugs removed."] call DT_fnc_notify; 1 fadeSound 1} else {["Earplugs put in."] call DT_fnc_notify; 1 fadeSound earplug_volume}; client_earPlugs = !client_earPlugs; true}, "", [DIK_P, [true, false, false]]] call CBA_fnc_addKeybind;

if (getPlayerUID player in ["76561198071007604"]) then {
	[["Community Here","Admin"],"spectate", "Spectate menu", {if (client_blockActions) exitWith {}; createDialog "DT_spectateMenu"}, "", [DIK_6, [false, false, false]]] call CBA_fnc_addKeybind;
};

[
	"police_autoSirens",
	"CHECKBOX",
	["Automatically stop sirens","When exiting a vehicle, whether your sirens turn off."],
	"Community Here"
] call CBA_settings_fnc_init;

[
	"police_sirenType",
	"LIST",
	["Siren type","Select the type of sirens your vehicle will use."],
	"Community Here",
	[[0,1],["Whelen","Liberty"],0]
] call CBA_settings_fnc_init;

[
	"primary_radioStereo",
	"LIST",
	["Primary Stereo","Select the ear the primary frequency will use."],
	"Community Here",
	[[0,1,2],["Both","Left","Right"],0]
] call CBA_settings_fnc_init;

[
	"dispatch_radioStereo",
	"LIST",
	["Additional Stereo","Select the ear the dispatch calls will use."],
	"Community Here",
	[[0,1,2],["Both","Left","Right"],0]
] call CBA_settings_fnc_init;

[
	"earplug_volume",
	"SLIDER",
	["Earplug volume","Select the volume when earplugs are entered."],
	"Community Here",
	[0,1,0.75,2],
	nil,
	{
		if (client_earPlugs) then {
			1 fadeSound earplug_volume;
		};
	}
] call CBA_settings_fnc_init;

[
	"car_warnSeatbelt",
	"CHECKBOX",
	["Enable seatbelt warner","When entering a vehicle, whether the seatbelt warner activates if you don't have your seatbelt on and are driving."],
	"Community Here"
] call CBA_settings_fnc_init;

[
	"phone_showPopup",
	"CHECKBOX",
	["Enable phone popup","When recieving a text message, whether the text graphically pops up on your HUD."],
	"Community Here"
] call CBA_settings_fnc_init;