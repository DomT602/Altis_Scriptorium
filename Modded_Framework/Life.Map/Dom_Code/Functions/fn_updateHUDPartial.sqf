/*
	File: fn_updateHUDPartial.sqf
	Author: Dom
	Description: Updates a specific element of the HUD
*/
params [
	["_type","hunger",[""]],
	["_evhData",[],[[]]]
];

private _HUD = uiNamespace getVariable ["DT_HUD",displayNull];

if (_type isEqualTo "seatbelt") exitWith {
	private _seatbeltPic = "";
	if (!(isNull objectParent player) && {!client_seatbelt}) then {
		_seatbeltPic = "\Dom_UI\HUD\seatbelt1.paa";
	};
	(_HUD displayCtrl 1503) ctrlSetText _seatbeltPic;
};

if (_type isEqualTo "hunger") exitWith {
	private _hunger = player getVariable ["hunger",100];
	private _hungerPic = "";
	if (_hunger != 100) then {
		_hungerPic = format["\Dom_UI\HUD\hunger%1.paa",floor(_hunger / 10)];
	};
	(_HUD displayCtrl 1500) ctrlSetText _hungerPic;
};

if (_type isEqualTo "thirst") exitWith {
	private _thirst = player getVariable ["thirst",100];
	private _thirstPic = "";
	if (_thirst != 100) then {
		_thirstPic = format["\Dom_UI\HUD\thirst%1.paa",floor(_thirst / 10)];
	};
	(_HUD displayCtrl 1501) ctrlSetText _thirstPic;
};

if (_type isEqualTo "blood") exitWith {
	private _blood = player getVariable ["blood",5000];
	private _bloodPic = "";
	if (_blood != 5000) then {
		_bloodPic = format["\Dom_UI\HUD\health%1.paa",floor(_blood / 500)];
	};
	(_HUD displayCtrl 1502) ctrlSetText _bloodPic;
};

if (_type isEqualTo "goPro") exitWith {
	private _goProPic = "";
	if (client_goPro && {"D_GoPro_i" in (magazines player)}) then {
		_goProPic = "\Dom_UI\HUD\camera1.paa";
	};
	(_HUD displayCtrl 1504) ctrlSetText _goProPic;
};

if (_type isEqualTo "reload") exitWith {
	_evhData params ["_unit","","","_newMagazine","_oldMagazine"];
	_newMagazine params ["_magName"];

	if ((_oldMagazine select 1) isEqualTo 0) then {
		private _magCount = {_x isEqualTo _magName} count magazines _unit;
		private _magText = call {
			if (_magCount isEqualTo 0) exitWith {"I'm out of mags."};
			if (_magCount isEqualTo 1) exitWith {"I have 1 magazine left."};
			format["I have %1 magazines left.",_magCount];
		};
		(_HUD displayCtrl 1510) ctrlSetStructuredText parseText _magText;
	};
};

if (_type isEqualTo "weapon") exitWith {
	_evhData params ["_unit","_newWeapon"];

	private _textData = [];
	if (_newWeapon in ["","Binocular","Rangefinder"]) then {
		for "_i" from 0 to 3 do {
			_textData pushBack "";
		};
	} else {
		_textData pushBack (getText (configFile >> "CfgWeapons" >> _newWeapon >> "picture"));
		_textData pushBack (getText (configFile >> "CfgWeapons" >> _newWeapon >> "displayName"));
		private _fireMode = if (isNull objectParent _unit) then {currentWeaponMode _unit} else {""};
		_textData pushBack _fireMode;

		private _ammoCount = _unit ammo _newWeapon;
		private _percentAmmo = if (_ammoCount isEqualTo 0) then {
			0;
		} else {
			(_ammoCount / (getNumber(configFile >> "CfgMagazines" >> (currentMagazine _unit) >> "count"))) * 100;
		};

		private _ammoText = call {
			if (_percentAmmo isEqualTo 0) exitWith {"I'm out of ammo."};
			if (_percentAmmo <= 20) exitWith {"Feels like I'm almost empty."};
			if (_percentAmmo <= 40) exitWith {"Might want to check the ammo count."};
			if (_percentAmmo <= 60) exitWith {"The magazine feels half empty."};
			if (_percentAmmo <= 80) exitWith {"I have enough ammo."};
			if (_percentAmmo < 100) exitWith {"I still have plenty of rounds."};
			"Magazine is full of ammo.";
		};
		_textData pushBack _ammoText;
	};
	_textData params ["_weaponPic","_weaponName","_fireMode","_ammoText"];
	(_HUD displayCtrl 1507) ctrlSetText _weaponPic;
	(_HUD displayCtrl 1508) ctrlSetStructuredText parseText _fireMode;
	(_HUD displayCtrl 1509) ctrlSetStructuredText parseText _weaponName;
	(_HUD displayCtrl 1511) ctrlSetStructuredText parseText _ammoText;
};

if (_type isEqualTo "weaponMode") exitWith {
	_evhData params ["_unit","_newWeaponMode"];

	if (isNull objectParent player) then {
		private _fireMode = currentWeaponMode _unit;
		(_HUD displayCtrl 1508) ctrlSetStructuredText parseText _fireMode;
	};
};

if (_type isEqualTo "fired") exitWith {
	_evhData params ["_unit","_weapon"];

	private _ammoCount = _unit ammo _weapon;
	private _percentAmmo = if (_ammoCount isEqualTo 0) then {
		0;
	} else {
		(_ammoCount / (getNumber(configFile >> "CfgMagazines" >> (currentMagazine player) >> "count"))) * 100;
	};

	private _ammoText = call {
		if (_percentAmmo isEqualTo 0) exitWith {"I'm out of ammo."};
		if (_percentAmmo <= 20) exitWith {"Feels like I'm almost empty."};
		if (_percentAmmo <= 40) exitWith {"Might want to check the ammo count."};
		if (_percentAmmo <= 60) exitWith {"The magazine feels half empty."};
		if (_percentAmmo <= 80) exitWith {"I have enough ammo."};
		if (_percentAmmo < 100) exitWith {"I still have plenty of rounds."};
		"Magazine is full of ammo.";
	};
	(_HUD displayCtrl 1511) ctrlSetStructuredText parseText _ammoText;
};
