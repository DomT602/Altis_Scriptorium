client_keys = [];
client_seatbelt = false;
client_holster = "";
client_goPro = false;
client_intoxicated = false;
client_carrying = objNull;
client_mouseButtons = [[],[]];
client_cameraSettings = [5,0,0,[0,0,0.85]];
client_blockActions = false;
client_surrendered = false;
client_trackers = [];
client_tempTime = 0;
client_cameras = [];
client_earPlugs = false;
client_clickQueue = [];
client_clickHandler = -1;

phone_inbox = [];
phone_charging = false;
phone_appOpen = -1;
phone_callOwner = objNull;
phone_beingCalled = false;
phone_incNumber = "";
phone_targetNumber = "";
phone_inCall = false;
phone_handler = -1;
phone_callingPlayer = false;

DT_notifArray = [];
DT_notifCount = 0;

furniture_vehicle = objNull;
furniture_xPos = 0;
furniture_yPos = 1;

active_seed = "";

old_speed = -1;

player setVariable ["dead",false,true];
player setVariable ["bleeding",[0,0,0,0,0,0],true];
player setVariable ["morphine",false,false];
player setVariable ["medRecords",[],true];
player setVariable ["callTotal",0,true];
player setVariable ["faction","civ",true];
player setVariable ["restrained",false,true];
player setVariable ["tied",false,true];