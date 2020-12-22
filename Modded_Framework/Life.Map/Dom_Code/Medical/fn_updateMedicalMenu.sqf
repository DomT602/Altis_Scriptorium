/*
	File: fn_updateMedicalMenu.sqf
	Author: Dom
	Description: Called when a new selection is made on the menu
*/
params [
	["_selection","",[""]]
];

private _display = findDisplay 1005;
private _index = ["head","torso","arm_l","arm_r","leg_l","leg_r"] find _selection;
private _text = ["Head","Torso","Left arm","Right arm","Left leg","Right leg"] select _index;
if (_index != -1 && (MB_Interaction_Target getVariable ["bleeding",[0,0,0,0,0,0]] select _index) != 0) then {
	_text = format["%1<br/>Bleeding",_text];
};
(_display displayCtrl 1100) ctrlSetStructuredText parseText _text;

private _startIDC = 1599; //start - 1
for "_i" from _startIDC to (_startIDC + 6) do {
	private _button = _display displayCtrl _i;
	_button ctrlShow false;
};

private _treatments = (missionConfigFile >> "Medical" >> _selection) call BIS_fnc_getCfgSubClasses;
{
	private _check = (missionConfigFile >> "Medical" >> _selection >> _x >> "check") call BIS_fnc_getCfgData;
	if ([_check] call DT_fnc_conditionChecker) then {
		private _action = (missionConfigFile >> "Medical" >> _selection >> _x >> "action") call BIS_fnc_getCfgData;
		private _title = (missionConfigFile >> "Medical" >> _selection >> _x >> "title") call BIS_fnc_getCfgData;
		_startIDC = _startIDC + 1;
		private _button = _display displayCtrl _startIDC;
		_button ctrlSetText _title;
		_button ctrlSetEventHandler ["buttonClick",format["closeDialog 0; %1",_action]];
		_button ctrlShow true;
	};
} forEach _treatments;