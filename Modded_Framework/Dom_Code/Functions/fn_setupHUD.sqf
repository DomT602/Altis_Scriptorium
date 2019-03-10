/*
	File: fn_setupHUD.sqf
	Author: Dom
	Description: Sets up the HUD via a CBA PFH
*/

[
	{
		private _HUD = uiNamespace getVariable ["DT_HUD",displayNull];
		if (isNull _HUD) exitWith {};

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
			private _magCount = {_x isEqualTo (currentMagazine player)} count magazines player;
			private _ammoCount = (player ammo _curWeapon);
			private _percentAmmo = if (_ammoCount isEqualTo 0) then {
				0;
			} else {
				(_ammoCount / (getNumber(configFile >> "CfgMagazines" >> (currentMagazine player) >> "count"))) * 100;
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
				_seatbeltPic = "\Dom_Client\Textures\HUD\Seatbelt1.paa";
			};
		};

		private _hungerPic = call {
			if (_hunger isEqualTo 100) exitWith {""};
			if (_hunger > 85) exitWith {"\Dom_Client\Textures\HUD\food1.paa"};
			if (_hunger > 70) exitWith {"\Dom_Client\Textures\HUD\food2.paa"};
			if (_hunger > 55) exitWith {"\Dom_Client\Textures\HUD\food3.paa"};
			if (_hunger > 40) exitWith {"\Dom_Client\Textures\HUD\food4.paa"};
			if (_hunger > 25) exitWith {"\Dom_Client\Textures\HUD\food5.paa"};
			"\Dom_Client\Textures\HUD\food6.paa";
		};

		private _thirstPic = call {
			if (_thirst isEqualTo 100) exitWith {""};
			if (_thirst > 85) exitWith {"\Dom_Client\Textures\HUD\drink1.paa"};
			if (_thirst > 70) exitWith {"\Dom_Client\Textures\HUD\drink2.paa"};
			if (_thirst > 55) exitWith {"\Dom_Client\Textures\HUD\drink3.paa"};
			if (_thirst > 40) exitWith {"\Dom_Client\Textures\HUD\drink4.paa"};
			if (_thirst > 25) exitWith {"\Dom_Client\Textures\HUD\drink5.paa"};
			"\Dom_Client\Textures\HUD\drink6.paa";
		};

		private _healthPic = call {
			if (_blood isEqualTo 5000) exitWith {""};
			if (_blood > 4000) exitWith {"\Dom_Client\Textures\HUD\health1.paa"};
			if (_blood > 3000) exitWith {"\Dom_Client\Textures\HUD\health2.paa"};
			if (_blood > 2500) exitWith {"\Dom_Client\Textures\HUD\health3.paa"};
			if (_blood > 2000) exitWith {"\Dom_Client\Textures\HUD\health4.paa"};
			if (_blood > 1000) exitWith {"\Dom_Client\Textures\HUD\health5.paa"};
			"\Dom_Client\Textures\HUD\health6.paa";
		};

		private _goProPic = "";
		if (client_goPro && {"D_GoPro_i" in (magazines player)}) then {
			_goProPic = "\Dom_Client\Textures\HUD\Camera1.paa";
		};

		private _charging = parseText "";
		if (phone_charging) then {
			if (isNull objectParent player) exitWith {
				phone_charging = false;
			};
			_charging = parseText format ["<t color='#5FC900' size='1' align='center'>[%1%]Charging Cellphone...</t>",phone_battery];
		};

		_ammoText = parseText format ["<t size='1' align='right'>%1</t>",_ammoText];
		_magText = parseText format ["<t size='1' align='right'>%1</t>",_magText];
		_fireMode = parseText format ["<t size='1' align='center'>%1</t>",_fireMode];
		_weaponName = parseText format ["<t size='1' align='right'>%1</t>",_weaponName];

		(_HUD displayCtrl 1500) ctrlSetText _hungerPic;
		(_HUD displayCtrl 1501) ctrlSetText _thirstPic;
		(_HUD displayCtrl 1502) ctrlSetText _healthPic;
		(_HUD displayCtrl 1507) ctrlSetText _weaponPic;
		(_HUD displayCtrl 1511) ctrlSetStructuredText _ammoText;
		(_HUD displayCtrl 1508) ctrlSetStructuredText _fireMode;
		(_HUD displayCtrl 1510) ctrlSetStructuredText _magText;
		(_HUD displayCtrl 1509) ctrlSetStructuredText _weaponName;
		(_HUD displayCtrl 1512) ctrlSetStructuredText _charging;
		(_HUD displayCtrl 1504) ctrlSetText _goProPic;
		(_HUD displayCtrl 1503) ctrlSetText _seatbeltPic;
	},
	0
] call CBA_fnc_addPerFrameHandler;