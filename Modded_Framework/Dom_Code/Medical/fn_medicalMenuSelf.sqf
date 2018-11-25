/*
	File: fn_medicalMenuSelf.sqf
	Author: Dom
	Description: Opens up the medical menu with data being the players
*/
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

private _head = player getVariable ["head",0];
private _torso = player getVariable ["torso",0];
private _arms = player getVariable ["arms",0];
private _legs = player getVariable ["legs",0];	
private _bleeding = str(player getVariable ["bleeding",0]); 
private _blood = str(player getVariable ["blood",5000]);

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
private _records = player getVariable ["medRecords",[]];
{
	_listbox lbAdd _x;
} forEach _records;*/

_Btn1 ctrlSetText "Bandage";
_Btn1 buttonSetAction "closeDialog 0; call DT_fnc_bandageSelf;";

_Btn2 ctrlSetText "Cast";
_Btn2 buttonSetAction "closeDialog 0; ['cast'] call DT_fnc_treatSelf;";

_Btn3 ctrlSetText "Splint";
_Btn3 buttonSetAction "closeDialog 0; ['splint'] call DT_fnc_treatSelf;";

_Btn4 ctrlSetText "Morphine";
_Btn4 buttonSetAction "closeDialog 0; call DT_fnc_morphineSelf;";

_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;
_Btn8 ctrlShow false;
_Btn9 ctrlShow false;