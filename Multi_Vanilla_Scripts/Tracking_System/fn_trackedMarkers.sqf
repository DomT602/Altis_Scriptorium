/*
	File: fn_trackedMarkers.sqf
	Author: DomT602 (domt602@gmail.com)
	Description: Displays anything the player has placed a tracker on, called via missionEventHandler "map"
*/

private _markers = [];

{
	if (_x getVariable ["tracked",false]) then {	
		private _marker = createMarkerLocal [format["%1_pMarker",_x],visiblePositionASL _x];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["GPS Tracker - %1",name _x];
		_markers pushBack [_marker,_x];
	};
	true
} count playableUnits;

{  
	if (_x getVariable ["tracked",false]) then {	 
		private _marker = createMarkerLocal [format["%1_vMarker",(random(9999))],visiblePositionASL _x];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["GPS Tracker - %1",(typeOf _x)];
		_markers pushBack [_marker,_x];	
	};
	true
} count (allMissionObjects "Car" + allMissionObjects "Air" + allMissionObjects "Ship");

while {visibleMap} do {
    {
        _x params [
            ["_mark","",[""]],
            ["_trackedObj",objNull,[objNull]]
        ];
        if (!isNil "_trackedObj" && {!isNull _trackedObj}) then {
            _mark setMarkerPosLocal (visiblePosition _trackedObj)
        };
        true
    } count _markers;
    uiSleep 0.02
};

{
    _x params [
        ["_marker","",[""]]
    ];
    deleteMarkerLocal _marker;
    true
} count _markers;
