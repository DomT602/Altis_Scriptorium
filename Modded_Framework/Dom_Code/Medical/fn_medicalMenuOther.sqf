/*
	File: fn_medicalMenuOther.sqf
	Author: Dom
	Description: Opens up the medical menu with data being the targets
*/
params [
	["_unit",objNull,[objNull]]
];
if !([_unit] call DT_fnc_checkPlayer) exitWith {["Invalid target.","red"] call DT_fnc_notify};
MB_Interaction_Target = _unit;
closeDialog 0;
createDialog "MedicalMenu";
disableSerialization;

private _display = findDisplay 1005;
private _headCtrl = _display displayCtrl 9301;
private _torsoCtrl = _display displayCtrl 9302;
private _armsCtrl = _display displayCtrl 9303;
private _legsCtrl = _display displayCtrl 9304;
private _bloodCtrl = _display displayCtrl 16009;
private _bleedingCtrl = _display displayCtrl 16010;

private _Btn1 = _display displayCtrl 16000;
private _Btn2 = _display displayCtrl 16001;
private _Btn3 = _display displayCtrl 16002;
private _Btn4 = _display displayCtrl 16003;
private _Btn5 = _display displayCtrl 16004;
private _Btn6 = _display displayCtrl 16005;
private _Btn7 = _display displayCtrl 16006;
private _Btn8 = _display displayCtrl 16007;
private _Btn9 = _display displayCtrl 16008;

private _head = _unit getVariable ["head",0];
private _torso = _unit getVariable ["torso",0];
private _arms = _unit getVariable ["arms",0];
private _legs = _unit getVariable ["legs",0];	
private _bleeding = str(_unit getVariable ["bleeding",0]); 
private _blood = str(_unit getVariable ["blood",5000]);

private _headColour = call {
	if (_head isEqualTo 0) exitWith {"\Dom_UI\medical\head_white.paa"};
	if (_head <= 0.35) exitWith {"\Dom_UI\medical\head_green.paa"};
	if (_head <= 0.7) exitWith {"\Dom_UI\medical\head_orange.paa"};
	"\Dom_UI\medical\head_red.paa";
};

private _torsoColour = call {
	if (_torso isEqualTo 0) exitWith {"\Dom_UI\medical\body_white.paa"};
	if (_torso <= 0.35) exitWith {"\Dom_UI\medical\body_green.paa"};
	if (_torso <= 0.7) exitWith {"\Dom_UI\medical\body_orange.paa"};
	"\Dom_UI\medical\body_red.paa";
};

private _armsColour = call {
	if (_arms isEqualTo 0) exitWith {"\Dom_UI\medical\arms_white.paa"};
	if (_arms <= 0.35) exitWith {"\Dom_UI\medical\arms_green.paa"};
	if (_arms <= 0.7) exitWith {"\Dom_UI\medical\arms_orange.paa"};
	"\Dom_UI\medical\arms_red.paa";
};

private _legsColour = call {
	if (_legs isEqualTo 0) exitWith {"\Dom_UI\medical\legs_white.paa"};
	if (_legs <= 0.35) exitWith {"\Dom_UI\medical\legs_green.paa"};
	if (_legs <= 0.7) exitWith {"\Dom_UI\medical\legs_orange.paa"};
	"\Dom_UI\medical\legs_red.paa";
};

_headCtrl ctrlSetText _headColour;
_torsoCtrl ctrlSetText _torsoColour;
_armsCtrl ctrlSetText _armsColour;
_legsCtrl ctrlSetText _legsColour;
_bloodCtrl ctrlSetText _blood;
_bleedingCtrl ctrlSetText _bleeding;

/*private _listbox = _display displayCtrl -1;
private _records = _unit getVariable ["medRecords",[]];
{
	_listbox lbAdd format["%1"_x];
} forEach _records;*/

_Btn1 ctrlSetText "Defibrilate";
_Btn1 buttonSetAction "[MB_Interaction_Target] call DT_fnc_defibTarget; closeDialog 0;";

if !(_unit getVariable ["dead",false]) then {
	_Btn1 ctrlEnable false;
};

_Btn2 ctrlSetText "Blood bag";
_Btn2 buttonSetAction "call DT_fnc_bloodbag; closeDialog 0;";

_Btn3 ctrlSetText "Respirator";
_Btn3 buttonSetAction "[MB_Interaction_Target] call DT_fnc_applyRespirator; closeDialog 0;";

if !(player getVariable ["faction","civ"] isEqualTo "medic") then {
	_Btn1 ctrlShow false;
	_Btn2 ctrlShow false;
	_Btn3 ctrlShow false;
	_Btn4 ctrlShow false;
};

_Btn4 ctrlSetText "Head injuries";
private _nearAmbo = nearestObjects[player,["Jonzie_Ambulance"],15];
if !(_nearAmbo isEqualTo []) then {
	_Btn4 buttonSetAction "if (MB_Interaction_Target getVariable ['head',0] > 0.75) then {player playMoveNow 'AinvPknlMstpSlayWnonDnon_medicOther'; MB_Interaction_Target setVariable ['head',0.75,true]} else {['You must take the patient to the hospital for further treatment'] call DT_fnc_notify}; closeDialog 0;";
} else {
	private _hospitals = ["LakesideEMS_Spawn"]; //hospital markers
	{
	    if ((player distance (getMarkerPos _x) < 30)) exitWith {_Btn4 ctrlEnable true};
	} forEach _hospitals;
	_Btn4 buttonSetAction "player playMoveNow 'AinvPknlMstpSlayWnonDnon_medicOther'; MB_Interaction_Target setVariable ['head',0,true]; closeDialog 0;";
};

_Btn5 ctrlSetText "Bandage";
_Btn5 buttonSetAction "call DT_fnc_bandageOther; closeDialog 0;";

_Btn6 ctrlSetText "Cast";
_Btn6 buttonSetAction "['cast'] call DT_fnc_treatOther; closeDialog 0;";

_Btn7 ctrlSetText "Splint";
_Btn7 buttonSetAction "['splint'] call DT_fnc_treatOther; closeDialog 0;";

_Btn8 ctrlSetText "Morphine";
_Btn8 buttonSetAction "call DT_fnc_morphineOther; closeDialog 0;";

_Btn9 ctrlShow false;
