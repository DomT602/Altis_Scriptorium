/*
	File: fn_updateHUD.sqf
	Author: Dom
	Description: Displays all HUD elements
*/

private _HUD = uiNamespace getVariable ["DT_HUD",displayNull];
if (isNull _HUD) exitWith {};

private _masks = []; //this needs to be defined/filled in below
{
	if (!(_x getVariable ["dead",false]) && {!(lineIntersects[eyePos player,eyePos _x,player,_x])}) then {
		private _pos = visiblePosition _x;
		_pos set [2,(_x modelToWorld [0,0,0] select 2) + 2];

		private _DBid = _x getVariable ["DBid",-1];
		private _text = ["",_x] call DT_fnc_findName;

		_text = if ((headgear _x) in _masks || {(goggles _x) in _masks} || {_text isEqualTo ""}) then {
			format["%1",_DBid];
		} else {
			format["%1 - %2",_DBid,_text];
		};

		private _icon = "";
		if !(player getVariable ["TFAR",true]) then {_icon = "\Dom_UI\misc\connection.paa"};
		drawIcon3D [_icon, [0,0,0,1], _pos, 1.5, 1.5, 0, _text, 1, 0.04, "PuristaBold", "center"];
	};
} forEach ((nearestObjects[visiblePosition player,["D_Base_Civ_2"],6]) - [player]);

private _hunger = player getVariable ["hunger",100];
private _thirst = player getVariable ["thirst",100];
private _blood = player getVariable ["blood",5000];
private _curWeapon = currentWeapon player;
private _weaponName = "";
private _weaponPic = "";
private _ammoText = "";
private _magText = "";

if !(_curWeapon isEqualTo "") then {
	_weaponPic = getText (configFile >> "CfgWeapons" >> _curWeapon >> "picture");
	_weaponName = getText (configFile >> "CfgWeapons" >> _curWeapon >> "displayName");
	private _curMag = currentMagazine player;
	private _magCount = {_x isEqualTo _curMag} count magazines player;
	private _ammoCount = player ammo _curWeapon;
	private _percentAmmo = if (_ammoCount isEqualTo 0) then {
		0;
	} else {
		(_ammoCount / (getNumber(configFile >> "CfgMagazines" >> _curMag >> "count"))) * 100;
	};

	_ammoText = call {
		if (_percentAmmo isEqualTo 0) exitWith {"I'm out of ammo."};
		if (_percentAmmo <= 20) exitWith {"Feels like I'm almost empty."};
		if (_percentAmmo <= 40) exitWith {"Might want to check the ammo count."};
		if (_percentAmmo <= 60) exitWith {"The magazine feels half empty."};
		if (_percentAmmo <= 80) exitWith {"I have enough ammo."};
		if (_percentAmmo < 100) exitWith {"I still have plenty of rounds."};
		"Magazine is full of ammo.";
	};

	_magText = call {
		if (_magCount isEqualTo 0) exitWith {"I'm out of mags."};
		if (_magCount isEqualTo 1) exitWith {"I have 1 magazine left."};
		format["I have %1 magazines left.",_magCount];
	};
};

private _fireMode = "";
private _seatbeltPic = "";
if (isNull objectParent player) then {
	_fireMode = currentWeaponMode player;
} else {
	if !(client_seatbelt) then {
		_seatbeltPic = "\Dom_UI\HUD\seatbelt1.paa";
	};
};

if (_hunger isEqualTo 100) then {
	_hunger = "";
} else {
	_hunger = format["\Dom_UI\HUD\hunger%1.paa",floor(_hunger / 10)];
};

if (_thirst isEqualTo 100) then {
	_thirst = "";
} else {
	_thirst = format["\Dom_UI\HUD\thirst%1.paa",floor(_thirst / 10)];
};

if (_blood isEqualTo 5000) then {
	_blood = "";
} else {
	_blood = format["\Dom_UI\HUD\health%1.paa",floor(_blood / 500)];
};

private _goProPic = "";
if (client_goPro) then {
	if ("D_GoPro_i" in (magazines player)) then {
		_goProPic = "\Dom_UI\HUD\camera1.paa";
	} else {
		client_goPro = false;
	};
};

private _charging = "";
if (phone_charging) then {
	if (isNull objectParent player) exitWith {
		phone_charging = false;
	};
	_charging = format["[%1%2] Charging phone",(player getVariable ["phoneBattery",100]),"%"];
};

(_HUD displayCtrl 1500) ctrlSetText _hunger;
(_HUD displayCtrl 1501) ctrlSetText _thirst;
(_HUD displayCtrl 1502) ctrlSetText _blood;
(_HUD displayCtrl 1503) ctrlSetText _seatbeltPic;
(_HUD displayCtrl 1504) ctrlSetText _goProPic;
(_HUD displayCtrl 1507) ctrlSetText _weaponPic;
(_HUD displayCtrl 1508) ctrlSetStructuredText parseText _fireMode;
(_HUD displayCtrl 1509) ctrlSetStructuredText parseText _weaponName;
(_HUD displayCtrl 1510) ctrlSetStructuredText parseText _magText;
(_HUD displayCtrl 1511) ctrlSetStructuredText parseText _ammoText;
(_HUD displayCtrl 1512) ctrlSetStructuredText parseText _charging;