/*
	File: fn_beingCalled.sqf
	Author: Dom
	Description: Recieves a call from a player
*/
params [
	["_number","",[""]],
	["_caller",objNull,[objNull]]
];
if (_number isEqualTo "" || {isNull _caller}) exitWith {};

if (phone_beingCalled) exitWith {["callFailed"] remoteExecCall ["DT_fnc_phoneStateChanged",_caller]};
phone_callOwner = _caller;
phone_beingCalled = true;

private _name = "";
{
	_x params [
		["_cName","",[""]],
		["_cNumber","",[""]]
	];
	
	if (_cNumber isEqualTo _number) exitWith {
		_name = _cName
	};
} forEach phone_contacts;

private _text = format["You are being called by %1.",_number];
if !(_name isEqualTo "") then {
	_text = format["You are being called by %1 (%2).",_name,_number];
};

[_number,_text] spawn {
	params [
		["_number","",[""]],
		["_text","",[""]]
	];
	for "_i" from 0 to 5 do {
  		if (phone_acceptedCall) exitWith {
    		["callAccepted"] remoteExecCall ["DT_fnc_phoneStateChanged",phone_callOwner]; //if you press accept (green button on phone) then lets change to caller's frequency and send message to caller
    		phone_inCall = true;
    		[_number] call DT_fnc_setFrequency;
  		};

      	if (phone_hungupCall) exitWith {
        	["Call finished.","blue"] call DT_fnc_notify;
        	phone_beingCalled = false;
        	phone_acceptedCall = false;
        	phone_hungupCall = false;
      	};

      	if (phone_inCall) exitWith {
      		[format["You missed a call from %1.",_number],"orange"] call DT_fnc_notify;
			phone_beingCalled = false;
        	phone_acceptedCall = false;
        	phone_hungupCall = false;
      	};

      	if (phone_denyedCall) exitWith {["Call denied.","blue"] call DT_fnc_notify;};      
      	[_text,"blue"] call DT_fnc_notify;
      	player say3D [phone_settings select 2,75,1];
      	sleep 4;
	};
	phone_beingCalled = false;
	phone_acceptedCall = false;
	phone_hungupCall = false;
};

if !(isNull sound_preview) then { deletevehicle sound_preview };
sound_preview = createVehicle ["Logic",getPosASL player,[],0,"CAN_COLLIDE"];
sound_preview attachTo [player];
sound_preview say3D [((_ringtonelist select _selected) select 1),5,1]; 

Lega_fnc_fadeDisplay = {
    params [
        ["_displayIdent", "", ["", 0]],
        ["_fadeTime", 0.5, [0]]
    ];

    private _display = displayNull;
    if (_displayIdent isEqualType "") then {
        waitUntil {!(isNull uiNamespace getVariable [_displayIdent, displayNull])};
        _display = uiNamespace getVariable [_displayIdent, displayNull]
    } else {
        waitUntil {!(isNull (findDisplay _displayIdent))};
        _display = findDisplay _displayIdent;
    };

    private _allControls = allControls _display;
    {
        _x setVariable ["originalposition", (ctrlPosition _x)];
        _x ctrlSetPosition [safezoneX + (safeZoneW / 2),safeZoneY + (safeZoneH / 2),0,0];
        _x ctrlCommit 0;
        _x ctrlSetFade 1; 
        _x ctrlCommit 0;
        _x ctrlSetFade 0;
        _x ctrlSetPosition (_x getVariable ["originalposition", []]);
        _x ctrlCommit _fadeTime;
    } forEach _allControls;
};

player addEventHandler ["InventoryOpened", {
    [602,0.5] spawn Lega_fnc_fadeDisplay;
}];
https://gyazo.com/3e750c59992a8b6fc8e77f337b5db034
https://gyazo.com/22ad3bac702a8d45b0ef81da47dcdacb