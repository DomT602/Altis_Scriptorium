[] spawn { 
	private _servers = ["[PILS01] www.projectinfinity.com #1","[PILS02] www.projectinfinity.com #2","[PILS03] www.projectinfinity.com #3","kfc123"];
	if (isMultiplayer && (serverName IN _servers)) exitWith {};

	waitUntil {alive player};

	sleep 5;

	for "_i" from 0 to 1 step 0 do {
		if ((name player) IN ["Dominic","Dom","Dominic Thomas","Aquarium"]) exitWith {
			hint "[DEV] Allowed Through";
		};
		disableUserInput true;
		["<t color='#ff0000' size = '.8'>STOP<br />You are not authorised to use these assets. For usage contact. www.projectinfinity.com | ALT+F4 = EXIT</t>",-1,-1,10,1,0,789] spawn BIS_fnc_dynamicText;
		diag_log "You're not authorised to use these assets. For usage contact: www.projectinfinity.org | ALT+F4 = EXIT";
		sleep 10;
	};
};