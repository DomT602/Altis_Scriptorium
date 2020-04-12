/*
	File: fn_defaultLoadout.sqf
	Author: Dom
	Description: Loads default gear for selected faction.
*/

private _faction = player getVariable ["faction","civ"];
private _uniform = "";
private _vest = "";
private _backpack = "";

if (_faction isEqualTo "civ") then {
	_uniform = selectRandom ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1"];
} else {
	if (_faction isEqualTo "medic") then {
		_uniform = switch (player getVariable ["medicRank",0]) do {
			case 1: {"D_EMS_Probie"};
			case 2: {};
			case 3: {};
			case 4: {};
			case 5: {};
			case 6: {};
			case 7: {};
		};
		_backpack = "D_Invisible_Backpack";
	} else {
		_uniform = switch (player getVariable ["copRank",0]) do {
			case 1: {"D_Police_Cadet"};
			case 2: {"D_Police_Officer"};
			case 3: {"D_Police_Corporal"};
			case 4: {"D_Police_Sergeant"};
			case 5: {"D_Police_Lieutenant"};
			case 6: {"D_Police_Captain"};
			case 7: {"D_Police_AsstChief"};
		};
		_vest = "PoliceVest";
		_backpack = "AM_PoliceBelt";
	};
};

private _gear = [
	[],[],[], //weapons
	[_uniform,[]], //uniform
	[_vest,[]], //vest
	[_backpack,[]], //backpack
	"","",[], //items
	["ItemMap","","D_Phone","ItemCompass","ItemWatch",""] //items
];

player setUnitLoadout [_gear,false];