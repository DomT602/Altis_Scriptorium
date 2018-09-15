
client_cash = 0;
client_bank = 0;
client_paycheck = 0;
client_gear = [];
client_survivalStage = 0;
client_position = [];
client_keys = [];
client_seatbelt = false;
client_holster = "";
client_goPro = false;
client_intoxicated = false;
client_carrying = objNull;
client_clicking = false;
client_clicks = 0;
client_purchase = [["",-1],["",-1],["",-1],["",-1],["",-1]];
client_mouseButtons = [[],[]];
client_cameraSettings = [5,0,0,[0,0,0.85]];
client_blockActions = false;
client_surrendered = false;

phone_inbox = [];
phone_battery = 100;
phone_charging = false;
phone_appOpen = -1;
phone_apps = [];
phone_contacts = [];
phone_callingPlayer = false;
phone_beingCalled = false;
phone_callOwner = objNull;
phone_inCall = false;
phone_acceptedCall = false;
phone_hungupCall = false;
phone_denyedCall = false;
phone_callAttempts = 0;
player setVariable ["callTotal",0,true];

DT_notif_array = [];
DT_notif_count = 0;

jail_changedTime = false;

furniture_vehicle = objNull;
furniture_item_class = "";
furniture_xPos = 0;
furniture_yPos = 1;

active_seed = "";

exp_woodcutting = 0;
exp_mining = 0;
exp_farming = 0;
exp_fishing = 0;
exp_hunting = 0;

old_speed = 0;

player setVariable ["dead",false,true];
player setVariable ["pain",0,false];
player setVariable ["bleeding",0,true];
player setVariable ["morphine",false,true];
player setVariable ["medRecords",[],true];

player setVariable ["faction","civ",true];
player setVariable ["job","",true];
player setVariable ["restrained",false,true];
player setVariable ["tied",false,true];
player setVariable ["jail_details",[0,"",0,""],true];