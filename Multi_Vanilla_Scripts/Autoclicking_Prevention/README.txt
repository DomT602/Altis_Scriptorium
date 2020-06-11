This folder contains the scripts needed for the autoclicker prevention script.
This script will only allow one button press per 0.1 seconds default (can be changed in fn_clickerQueue).

Setup:
Download files from github
Put SQF files into desired folder (default: core/functions) and add each file to functions.h(pp)
Next; all dialogs need to have the following line added:
onLoad="[_this select 0] call life_fnc_setupDialog;";

For example:
class Life_atm_management {
    idd = 2700;
    name= "life_atm_menu";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad="[_this select 0] call life_fnc_setupDialog;";
    class controls {
    //blah
    };
};