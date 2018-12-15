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
	private _uniform = selectRandom ["D_FeelsBadManShorts"];
} else {
	if (_faction isEqualTo "medic") then {
		_uniform = switch (player getVariable ["medic_rank",0]) do {
			case 1: {"PS_EMS_Probie"};
			case 2: {};
			case 3: {};
			case 4: {};
			case 5: {};
			case 6: {};
			case 7: {};
		};
		_backpack = "D_Invisible_Backpack";
	} else {
		_uniform = switch (player getVariable ["cop_rank",0]) do {
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
	[_backpack], //backpack
	"","",[], //items
	["ItemMap","","D_Phone","ItemCompass","ItemWatch",""] //items
];

player setUnitLoadout [_gear,false];