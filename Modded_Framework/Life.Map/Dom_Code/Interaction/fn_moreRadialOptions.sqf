/**
*
*	Author: MrBoolean
*	Website: http://mrboolean.io
*	Name: fn_loadMoreInteractions.sqf
*	Description: Loads more interactions that are pending to be shown...
*
**/

closeDialog 0;
createDialog "MB_Interaction_Menu";

MB_actionList = [];

private _idd = 1001;
{
	_x params ["_text"];
	ctrlSetText[_idd,_text];
	_idd = _idd + 1;

	MB_actionList pushBack _x;
} forEach MB_overflowList;
