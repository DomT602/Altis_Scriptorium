This folder contains the scripts needed for seatbelts, the seatbelts can be put on either via a keybind or the scroll wheel, then when you hop out a CAR you will have your gun
holstered for a time, longer if you have a seatbelt on. In the event of a car crash, the damage will also be halved.

Setup:
Download files from github
Put fn_onGetOutMan.sqf and fn_seatbelt.sqf into the desired folder (default core/functions)
Add fn_onGetOutMan.sqf and fn_seatbelt.sqf onto functions.hpp
In fn_setupEVH.sqf add: player addEventHandler ["GetOutMan",{_this spawn life_fnc_onGetOutMan}];
In configuration.sqf add life_seatbelt = false;
Find a sound for the seatbelt (optional)
Decide whether you want seatbelts to be a keybind, or a scroll wheel action:
Scroll wheel example (add an action into fn_setupActions.sqf):
life_actions pushBack (player addAction["Remove Seatbelt",life_fnc_seatbelt,"",5,false,false,"",'life_seatbelt && !(isNull objectParent player)']);
life_actions pushBack (player addAction["Put on Seatbelt",life_fnc_seatbelt,"",5,false,false,"",'!life_seatbelt && !(isNull objectParent player)']);

Keybind example (add a case into fn_keyHandler.sqf): 
case 54: {
	if !(isNull objectParent player) then {
		call life_fnc_seatbelt;
		_handled = true;
	};
	_handled;
};

Refer here for what number represents what key: https://community.bistudio.com/wiki/DIK_KeyCodes

Add this to fn_handleDamage.sqf:
if (vehicle _unit isKindOf "Car" && (isNull _source || _source isEqualTo _unit)) then {
	if (life_seatbelt) then {
		_damage = _damage / 2;
	};
};