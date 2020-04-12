/**
*
*	Author: MrBoolean
*	Website: http://mrboolean.io
*	Name: fn_interactionButtonPressed.sqf
*	Description: Handles the press of an interaction button
*
**/

params[["_value",0,[0]]];

if(_value > ((count MB_actionList)-1)) exitWith {};

closeDialog 0;

private _action = MB_actionList select _value select 1;
call compile _action;
