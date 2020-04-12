/*
	File: fn_openMedicalMenu.sqf
	Author: Dom
	Description: Opens and prepares the medical menu
*/
params [
	["_unit",objNull,[objNull]]
];

MB_Interaction_Target = _unit;

closeDialog 0;
createDialog "DT_medicalMenu";
private _display = findDisplay 1005;
if (_unit isEqualTo player) then {
	(_display displayCtrl 1101) ctrlSetStructuredText parseText profileName;
} else {
	(_display displayCtrl 1101) ctrlSetStructuredText parseText (['Unknown',_unit] call DT_fnc_findName);
};

private _listbox = _display displayCtrl 1500;
{
	_listbox lbAdd _x;
} forEach (_unit getVariable ["medRecords",[]]);

[
	{
		params ["_arguments","_handle"];
		_arguments params ["_display","_unit","_startIDC"];
		if (player distance _unit > 5 || client_blockActions) exitWith {_display closeDisplay 2; [_handle] call CBA_fnc_removePerFrameHandler};
		(_display displayCtrl 1102) ctrlSetStructuredText parseText format ["Blood: %1ml <br/>Temperature: %2°C",(_unit getVariable ["blood",5000]),(_unit getVariable ["bodyTemp",37])],
		{
			private _red = 1;
			private _green = 1;
			private _blue = 1;
			if (_x > 0) then {
				_green = (0.9 - _x) max 0;
				_blue = _green;
			};
			(_display displayCtrl (_startIDC + _forEachIndex)) ctrlSetTextColor [_red,_green,_blue,1];
		} forEach (MB_Interaction_Target getVariable ["injuries",[]]);
	},
	1,
	[_display,_unit,1201]
] call CBA_fnc_addPerFrameHandler;