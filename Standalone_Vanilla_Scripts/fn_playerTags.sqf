#include "..\..\script_macros.hpp"
/*
	File: fn_playerTags.sqf
	Author: DomT602 (domt602@gmail.com)
	Description: Displays the name of the player, and then the name of the gang, or rank in a faction, aswell as a corresponding icon
	To-do: Place files in desired location, default (core/functions), add to functions.hpp, add following to core/init.sqf:
		["DT_playerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
	Populate donator colours fully, change cop/medic icons, ranks and colours if needed
	WORK IN PROGRESS
*/

private _units = nearestObjects[(visiblePositionASL player),["Man"],10];
_units = _units - [player]; //remove this if you want to see your own player tag
private _masks = LIFE_SETTINGS(getArray,"clothing_masks");

{
	if (isPlayer _x && {alive _x} && {!(lineIntersects[eyePos player,eyePos _x,player,_x])}) then {
		if !((headgear _x) in _masks || (goggles _x) in _masks || (uniform _x) in _masks) then {
			private _data = switch (side _x) do {
				case west: {
					switch (_x getVariable ["rank",1]) do {
						case 2: {["\a3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa","Corporal",[0,0,0.7,1]]};
			            case 3: {["\a3\ui_f\data\gui\cfg\Ranks\sergeant_gs.paa","Sergeant",[0,0,0.75,1]]};
			            case 4: {["\a3\ui_f\data\gui\cfg\Ranks\lieutenant_gs.paa","Lieutenant",[0,0,0.8,1]]};
			            case 5: {["\a3\ui_f\data\gui\cfg\Ranks\captain_gs.paa","Captain",[0,0,0.85,1]]};
			            case 6: {["\a3\ui_f\data\gui\cfg\Ranks\major_gs.paa","Major",[0,0,0.9,1]]};
			            case 7: {["\a3\ui_f\data\gui\cfg\Ranks\colonel_gs.paa","Colonel",[0,0,0.95,1]]};
			            case 8: {["\a3\ui_f\data\gui\cfg\Ranks\general_gs.paa","General",[0,0,1,1]]};
			            default {["\a3\ui_f\data\gui\cfg\Ranks\private_gs.paa","Private",[0,0,0.65,1]]};
					};
				};
				case independent: {
					["a3\ui_f\data\map\MapControl\hospital_ca.paa","Medic",[0,1,0,1]];
				};
				default {
					if (!isNil {(group _x) getVariable "gang_name"}) then {
						["",(group _x) getVariable ["gang_name",""],[1,1,1,1]]
					} else {
						["","",[1,1,1,1]]
					};
				};
			};
			_data params [["_picture","",[""]],["_text","",[""]],["_pColour",[0,0,1,1],[[]]]];
			(visiblePositionASL _x) params ["_xPos","_yPos"];

			private _sColour = switch (_x getVariable ["donorlevel",0]) do {
				case 1: {[0.8,0.5,0.2,1]};
				case 2: {[0.8,0.8,0.8,1]};
				case 3: {[1,0.84,0,1]};
				case 4: {[1,1,1,1,]};
				case 5: {[1,1,1,1]};
				default {[1,1,1,1]};
			};

			drawIcon3D [_picture, _pColour, [_xPos,_yPos,((_x modelToWorld (_x selectionPosition "head")) select 2) + .5], 1.5, 1.5, 0, _text, 1, 0.04, "PuristaBold", "center"];
			drawIcon3D ["", _sColour, [_xPos,_yPos,((_x modelToWorld (_x selectionPosition "head")) select 2) + .4], 0, 0, 0, (name _x), 1, 0.04, "PuristaBold", "center"];
		};
	};
} forEach _units;