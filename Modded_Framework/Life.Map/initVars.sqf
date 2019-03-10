client_keys = [];
client_seatbelt = false;
client_holster = "";
client_goPro = false;
client_intoxicated = false;
client_carrying = objNull;
client_clicks = 0;
client_mouseButtons = [[],[]];
client_cameraSettings = [5,0,0,[0,0,0.85]];
client_blockActions = false;
client_surrendered = false;

phone_inbox = [];
phone_charging = false;
phone_appOpen = -1;
phone_callingPlayer = false;
phone_beingCalled = false;
phone_callOwner = objNull;
phone_inCall = false;
phone_acceptedCall = false;
phone_hungupCall = false;
phone_denyedCall = false;

DT_notifArray = [];
DT_notifCount = 0;

furniture_vehicle = objNull;
furniture_xPos = 0;
furniture_yPos = 1;

active_seed = "";

old_speed = 0;

player setVariable ["dead",false,true];
player setVariable ["bleeding",[0,0,0,0,0,0],true];
player setVariable ["morphine",false,false];
player setVariable ["medRecords",[],true];
player setVariable ["callTotal",0,true];
player setVariable ["faction","civ",true];
player setVariable ["restrained",false,true];
player setVariable ["tied",false,true];