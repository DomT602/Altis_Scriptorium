#include "..\..\script_macros.hpp"
/*
	File: fn_personGPS.sqf
	Author: DomT602 (domt602@gmail.com)
	Description: Allows you to put a GPS tracker on another player
*/
params [
	["_unit",objNull,[objNull]]
];

if (isNull _unit || {player distance _unit > 3}) exitWith {};
if !("ItemGPS" in (items player)) exitWith {hint "You need a GPS."};

life_action_inUse = true;
private _upp = format ["Attaching GPS to %1.",name _unit];

disableSerialization;
"progressBar" cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable "life_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format ["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
private _cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };
    uiSleep 0.27;
    _cP = _cP + 0.02;
    _progress progressSetPosition _cP;
    _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_upp];
    if (_cP >= 1 || {!alive player} || {!isNull objectParent player} || {life_interrupted}) exitWith {};
};

life_action_inUse = false;
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";
if (isNull _unit) exitWith {};
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]};
if !(isNull objectParent player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"]};
player removeItem "ItemGPS";

hint format["You attached the GPS Tracker to the %1.",name _unit];

_unit setVariable ["tracked",true,false];