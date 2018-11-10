/*
	File: fn_initATM.sqf
	Author: Dom
	Description: Initiliases ATM
*/

if !(dialog) then {
	createDialog "DT_atm";
};

private _display = findDisplay -1;
private _cash = _display displayCtrl -1;
private _bank = _display displayCtrl -1;
private _units = _display displayCtrl -1;
lbClear _units;

{
	_units lbAdd format["%1",name _x];
	_units lbSetData [(lbSize _units) - 1,str(_x)];
} forEach (playableUnits - [player]);
lbSetCurSel [-1,0];

