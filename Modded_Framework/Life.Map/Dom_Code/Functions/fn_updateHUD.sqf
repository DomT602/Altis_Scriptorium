/*
	File: fn_updateHUD.sqf
	Author: Dom
	Description: Displays all per frame HUD elements (currently only player tags)
*/

private _HUD = uiNamespace getVariable ["DT_HUD",displayNull];
if (isNull _HUD) exitWith {};

private _masks = ["G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile"];
{
	if (!(_x getVariable ["dead",false]) && {!(lineIntersects[eyePos player,eyePos _x,player,_x])}) then {
		private _pos = visiblePosition _x;
		_pos set [2,(_x modelToWorld [0,0,0] select 2) + 2];

		private _DBid = _x getVariable ["DBid",-1];
		private _text = ["",_x] call DT_fnc_findName;

		_text = if ((headgear _x) in _masks || {(goggles _x) in _masks || {_text isEqualTo ""}}) then {
			format["%1",_DBid];
		} else {
			format["%1 - %2",_DBid,_text];
		};

		private _icon = "";
		if !(_x getVariable ["TFAR",true]) then {_icon = "\Dom_UI\misc\connection.paa"};
		drawIcon3D [_icon, [0,0,0,1], _pos, 1.5, 1.5, 0, _text, 1, 0.04, "PuristaBold", "center"];
	};
} forEach ((nearestObjects [visiblePosition player,["D_Base_Civ_2"],6]) - [player]);