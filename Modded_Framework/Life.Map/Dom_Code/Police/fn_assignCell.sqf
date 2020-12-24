/*
	File: fn_assignCell.sqf
	Author: Dom
	Description: Assigns the player a cell
*/

private _allCells = getArray(missionConfigFile >> "Misc" >> "jail_cells");
private _freeCellIndex = _allCells findIf {!(_x select 0 in jail_cellsUsed)};
private _cellInfo = _allCells select _freeCellIndex;
_cellInfo params ["_cellRef"];
jail_cellsUsed pushBack _cellRef;
publicVariable jail_cellsUsed;

_cellInfo;