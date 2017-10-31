Notification system demonstrated here:
https://www.youtube.com/watch?v=eQ--228Otho

Setup:
Download files from github
Put fn_notify.sqf and fn_showNotifs.sqf into dialog/functions (or place of choice)
Add fn_notify and fn_showNotifs to functions.hpp
Put DT_notificationSystem.hpp into dialog
Find a sound for the notification (optional)
In your macro's file (different for different AL versions) add: #define MAX_MESSAGES (number of your choice, default 15)
In CfgRemoteExec add: F(life_fnc_notify,CLIENT)
In description.ext in the class RscTitles add:
	#include "dialog\DT_notificationSystem.hpp"

In configuration.sqf add: 
	DT_notif_array = [];
	DT_notif_count = 0;

In init.sqf after the keyHandler is setup add:
	for "_i" from 0 to (MAX_MESSAGES - 1) do {
		DT_notif_array pushBack ["",-1];
	};

	6590 cutRsc ["DT_Notifications", "PLAIN"];

