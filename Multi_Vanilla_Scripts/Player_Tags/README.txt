This folder contains the scripts needed for the full player tags system. This allows you to put meet and name new players, set their names to remember them. It also displays their UID for purposes of rule breaks etc.
This can be changed to use database ID instead of player UID, however I will only do this if people are interested, as it requires a bit more work in various other files.

Setup:
Download files from github
Put DT_nameMenu into the dialog folder, and add it to the masterhandler.h(pp)
Put remaining SQF files into desired folder (default: dialog/function) and add each file to functions.h(pp)
Add a button or a way to bring up the name menu e.g:
_Btn1 ctrlSetText "Name Menu";
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_nameMenu;";