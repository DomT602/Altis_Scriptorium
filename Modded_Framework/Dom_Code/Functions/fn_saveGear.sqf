/*
    File: fn_saveGear.sqf
    Author: Dom
    Description: Saves the gear to a global variable.
*/
private _return = [];
private _uItems = [];
private _uMags  = [];
private _bItems = [];
private _bMags  = [];
private _vItems = [];
private _vMags  = [];
private _pItems = [];
private _hItems = [];
_return pushBack [uniform player,vest player,backpack player,goggles player,headgear player];

if !(uniform player isEqualTo "") then {
    {
        if (_x in (magazines player)) then {
            _uMags pushBack _x
        } else {
            _uItems pushBack _x
        };
    } forEach (uniformItems player);
};

if !(backpack player isEqualTo "") then {
    {
        if (_x in (magazines player)) then {
            _bMags pushBack _x
        } else {
            _bItems pushBack _x
        };
    } forEach (backpackItems player);
};

if !(vest player isEqualTo "") then {
    {
        if (_x in (magazines player)) then {
            _vMags pushBack _x
        } else {
            _vItems pushBack _x
        };
    } forEach (vestItems player);
};
_return pushBack [_uItems,_vItems,_bItems,assignedItems player];
_return pushBack [primaryWeapon player,secondaryWeapon player,handgunWeapon player];

if (count (primaryWeaponMagazine player) > 0) then {
    (primaryWeaponMagazine player) params ["_pMag"];

    if !(_pMag isEqualTo "") then {
        private _uni = player canAddItemToUniform _pMag;
        private _ves = player canAddItemToVest _pMag;
        private _bag = player canAddItemToBackpack _pMag;
        private _handled = false;

        if (_ves) then {
            _vMags pushBack _pMag;
            _handled = true;
        };

        if (_uni && !_handled) then {
            _uMags pushBack _pMag;
            _handled = true;
        };

        if (_bag && !_handled) then {
            _bMags pushBack _pMag;
            _handled = true;
        };
    };
};

if (count (secondaryWeaponMagazine player) > 0) then {
    (primaryWeaponMagazine player) params ["_sMag"];

    if !(_sMag isEqualTo "") then {
        private _uni = player canAddItemToUniform _sMag;
        private _ves = player canAddItemToVest _sMag;
        private _bag = player canAddItemToBackpack _sMag;
        private _handled = false;

        if (_ves) then {
            _vMags pushBack _sMag;
            _handled = true;
        };

        if (_uni && !_handled) then {
            _uMags pushBack _sMag;
            _handled = true;
        };

        if (_bag && !_handled) then {
            _bMags pushBack _sMag;
            _handled = true;
        };
    };
};

if (count (handgunMagazine player) > 0) then {
    (handgunMagazine player) params ["_hMag"];

    if !(_hMag isEqualTo "") then {
        private _uni = player canAddItemToUniform _hMag;
        private _ves = player canAddItemToVest _hMag;
        private _bag = player canAddItemToBackpack _hMag;
        private _handled = false;

        if (_ves) then {
            _vMags pushBack _hMag;
            _handled = true;
        };

        if (_uni && !_handled) then {
            _uMags pushBack _hMag;
            _handled = true;
        };

        if (_bag && !_handled) then {
            _bMags pushBack _hMag;
            _handled = true;
        };
    };
};
_return pushBack [_uMags,_vMags,_bMags];

if (count (primaryWeaponItems player) > 0) then {
    {
        _pItems pushBack _x
    } forEach (primaryWeaponItems player);
};
_return pushBack _pItems;

if (count (handgunItems player) > 0) then {
    {
        _hItems pushBack _x
    } forEach (handGunItems player);
};
_return pushBack _hItems;

client_gear = _return;