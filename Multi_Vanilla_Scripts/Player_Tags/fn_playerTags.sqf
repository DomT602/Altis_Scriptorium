#include "..\..\script_macros.hpp"
/*
	File: fn_playerTags.sqf
	Author: DomT602 (domt602@gmail.com)
	Description: Displays the name of the player if known, otherwise just displays their UID
*/

#define iconID 78000
#define scale 0.8

if (visibleMap || {!alive player} || {dialog}) exitWith {
    500 cutText["","PLAIN"];
};

private _ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
if (isNull _ui) then {
    500 cutRsc["Life_HUD_nameTags","PLAIN"];
    _ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
};

private _units = nearestObjects[(visiblePosition player),["Man"],10];
_units = _units - [player];

private _masks = LIFE_SETTINGS(getArray,"clothing_masks");

private _index = -1;
{
    private "_name";
    _idc = _ui displayCtrl (iconID + _forEachIndex);
    if (alive _x && {isPlayer _x}) then {
    	(visiblePositionASL _x) params ["_xPos","_yPos"];
        _pos = [_xPos, _yPos, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5];
        _sPos = worldToScreen _pos;
        _distance = _x distance player;
            if (count _sPos > 1 && {_distance < 8}) then {
            	if ((headgear _x) in _masks || (goggles _x) in _masks || (uniform _x) in _masks) then {
                    _name = format["%1 - Masked",_uid];
                } else {
	                private _uid = getPlayerUID _x;
	                private _saved = profileNamespace getVariable "DT_names";
	                private _savedName = "";

	                {
	                    params [
	                    	["_savedUID","",[""]],
	                    	["_savedName","",[""]]
	                    ];

	                    if(_savedUID isEqualTo _uid) exitWith {_savedName = _savedName};
	                } forEach _saved;

                    _name = if !(_savedName isEqualTo "") then {
                        format["%1 - %2",_uid,_savedName];
                    } else {
                        format["%1",_uid];
                    };

	                _idc ctrlSetStructuredtext parseText _name;
	                _idc ctrlSetPosition [_sPos select 0, _sPos select 1, 0.4, 0.65];
	                _idc ctrlSetScale scale;
	                _idc ctrlSetFade 0;
	                _idc ctrlCommit 0;
	                _idc ctrlShow true;
	            };
            } else {
                _idc ctrlShow false;
            };
    } else {
        _idc ctrlShow false;
    };
    _index = _forEachIndex;
} forEach _units;
(_ui displayCtrl (iconID + _index + 1)) ctrlSetStructuredtext parseText "";