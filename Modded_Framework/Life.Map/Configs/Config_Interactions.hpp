class Interactions {
	class cop {
		class unrestrain {
			title = "Unrestrain";
			action = "cursorObject setVariable ['restrained',false,true]; player addItem 'D_Handcuffs_i';";
			check = "cursorObject getVariable ['restrained',false]";
		};

		class checkLicense {
			title = "Check Licenses";
			action = "remoteExecCall ['DT_fnc_checkLicenses',cursorObject]"; //need script
			check = "isPlayer cursorObject";
		};

		class patDown {
			title = "Patdown";
			action = "remoteExecCall ['DT_fnc_patDown',cursorObject]";
			check = "cursorObject getVariable ['restrained',false] || cursorObject getVariable ['tied',false]";
		};

		class stripSearch {
			title = "Strip search";
			action = "remoteExecCall ['DT_fnc_stripSearch',cursorObject]";
			check = "cursorObject getVariable ['restrained',false] || cursorObject getVariable ['tied',false]";
		};

		class escortPlayer {
			title = "Escort Player";
			action = "[cursorObject] call DT_fnc_escort";
			check = "isPlayer cursorObject && isNull client_carrying";
		};

		class stopEscort {
			title = "Stop Escorting";
			action = "call DT_fnc_stopEscort";
			check = "isPlayer client_carrying";
		};

		class ticketPlayer {
			title = "Issue Ticket";
			action = "createDialog 'DT_ticketMenu'"; //need dialog
			check = "isPlayer cursorObject || ((cursorObject isKindOf 'Car') && !isNull (driver cursorObject))";
		};

		class jailPlayer {
			title = "Send to Jail";
			action = "[cursorObject] call DT_fnc_initArrestMenu";
			check = "(cursorObject getVariable ['restrained',false]) && {(player distance (getMarkerPos 'jail')) < 15} && {(cursorObject getVariable ['jail_details',[]]) param [0,0] isEqualTo 0}";
		};

		class editJail {
			title = "Jail Menu";
			action = "[cursorObject] call DT_fnc_initJailMenu";
			check = "((cursorObject getVariable ['jail_details',[]]) param [0,0] isEqualTo 1)";
		};

		class putInCar {
			title = "Put In Car";
			action = "[cursorObject] call DT_fnc_loadPerson";
			check = "isPlayer cursorObject";
		};

		class rankChange {
			title = "Promote/Demote";
			action = "call DT_fnc_initRankChange";
			check = "isPlayer cursorObject && ((cursorObject getVariable ['faction','civ']) isEqualTo 'cop') && (player getVariable ['cop_rank',0] > 4)";
		};

		class intoxCheck {
			title = "Intox Check";
			action = "[cursorObject] spawn DT_fnc_intoxCheck";
			check = "isPlayer cursorObject";
		};

		class impound {
			title = "Impound";
			action = "[cursorObject] call DT_fnc_impoundVehicle";
			check = "isNull objectParent player && ((cursorObject isKindOf 'Car') || (cursorObject isKindOf 'Air') || (cursorObject isKindOf 'Ship'))";
		};

		class seize {
			title = "Seize";
			action = "[cursorObject] call DT_fnc_seizeItems";
			check = "typeOf cursorObject isEqualTo 'GroundWeaponHolder'";
		};
	};

	class medic {
		class rankChange {
			title = "Promote/Demote";
			action = "call DT_fnc_initRankChange";
			check = "isPlayer cursorObject && ((cursorObject getVariable ['faction','civ']) isEqualTo 'medic') && (player getVariable ['medic_rank',0] > 4)";
		};

		class detox {
			title = "Detox";
			action = "[cursorObject] spawn DT_fnc_detox";
			check = "isPlayer cursorObject && (cursorObject getVariable ['intoxication',0] > 0)";
		};

		class loadStretcher {
			title = "Load Stretcher";
			action = "[cursorObject] call DT_fnc_switchStretcher";
			check = "typeOf cursorObject isEqualTo 'Jonzie_Ambulance' && cursorObject animationPhase 'Door_1' > 0.5 && (isNull (cursorObject getVariable ['stretcher',objNull])) && !((nearestObjects [cursorObject,['stretcher'],5]) isEqualTo [])";
		};

		class unloadStretcher {
			title = "Unload Stretcher";
			action = "[cursorObject] call DT_fnc_switchStretcher";
			check = "typeOf cursorObject isEqualTo 'Jonzie_Ambulance' && cursorObject animationPhase 'Door_1' > 0.5 && !(isNull (cursorObject getVariable ['stretcher',objNull]))";
		};
	};

	class civ {
		class impound {
			title = "Impound";
			action = "[cursorObject] call DT_fnc_impoundVehicle";
			check = "(player getVariable ['job',''] isEqualTo 'towtrucker') && isNull objectParent player && ((cursorObject isKindOf 'Car') || (cursorObject isKindOf 'Air') || (cursorObject isKindOf 'Ship'))";
		};

		class repairObject {
			title = "Repair";
			action = "[cursorObject] call DT_fnc_repairTerrainObject";
			check = "(player getVariable ['job',''] isEqualTo 'repairman') && isNull objectParent player && !((nearestTerrainObjects [player,[],4]) isEqualTo [])";
		};

		class untie {
			title = "Untie";
			action = "cursorObject setVariable ['tied',false,true]";
			check = "cursorObject getVariable ['tied',false]";
		};

		class patDown {
			title = "Patdown";
			action = "remoteExecCall ['DT_fnc_patDown',cursorObject]";
			check = "cursorObject getVariable ['tied',false]";
		};

		class stripSearch {
			title = "Strip search";
			action = "remoteExecCall ['DT_fnc_stripSearch',cursorObject]";
			check = "cursorObject getVariable ['tied',false]";
		};

		class putInCar {
			title = "Put In Car";
			action = "[cursorObject] call DT_fnc_loadPerson";
			check = "isPlayer cursorObject && (cursorObject getVariable ['tied',false])";
		};
	};

	class shared {
		class carRepair {
			title = "Repair Menu";
			action = "[cursorObject] call DT_fnc_repairMenu";
			check = "(cursorObject isKindOf 'Car') && (isNull objectParent player) && (player distance cursorObject < 4)";
		};

		class vehicleRepair {
			title = "Repair";
			action = "[cursorObject] call DT_fnc_repairVehicle";
			check = "(cursorObject isKindOf 'Air' || cursorObject isKindOf 'Ship') && (isNull objectParent player) && (player distance cursorObject < 4)";
		};

		class vehiclePush {
			title = "Push";
			action = "[cursorObject] call DT_fnc_pushVehicle";
			check = "(cursorObject isKindOf 'Car' || cursorObject isKindOf 'Ship') && (isNull objectParent player) && (player distance cursorObject < 4)";
		};

		class crafting {
			title = "Crafting Menu";
			action = "call DT_fnc_openCraftMenu";
			check = "isNull objectParent player";
		};

		class phone {
			title = "Phone";
			action = "call DT_fnc_openPhone";
			check = "true";
		};

		class nameMenu {
			title = "Name Menu";
			action = "closeDialog 0; createDialog 'DT_SetPlayerTag'";
			check = "isPlayer cursorObject";
		};

		class seatbelt {
			title = "Seatbelt";
			action = "call DT_fnc_seatbelt";
			check = "!isNull objectParent player";
		};

		class giveKey {
			title = "Give Keys";
			action = "[cursorObject] call DT_fnc_keyMenu";
			check = "isPlayer cursorObject";
		};

		class pickupItem {
			title = "Pickup Item";
			action = "[cursorObject] call DT_fnc_pickupItem";
			check = "typeOf cursorObject in ['log','rock','MW_spikeStrip','RoadCone_L_F','RoadBarrier_F','Land_CncBarrier_F','Land_BarGate_F']";
		};

		class plantSeed {
			title = "Plant Seed";
			action = "call DT_fnc_plantSeed";
			check = "!(active_seed isEqualTo '') && isNull objectParent player && (surfaceType (getPosATL player) in ['dirt','ag_farm'])"; //({if (player distance (getMarkerPos _x) < 30) exitWith {true}} forEach ['Farming_Markers'])
		};

		class harvestPlant {
			title = "Harvest Plant";
			action = "[cursorObject] call DT_fnc_harvestPlant";
			check = "(typeOf cursorObject in ['Wheat_vehicle']) && isNull objectParent player";
		};

		class buyBuilding {
			title = "Buy";
			action = "[cursorObject] spawn DT_fnc_buyBuilding";
			check = "(cursorObject isKindOf 'House_F') && {player distance cursorObject < 7} && {(cursorObject getVariable ['id',-1]) isEqualTo -1}";
		};

		class breakDoor {
			title = "Break Door";
			action = "[cursorObject] call DT_fnc_breakDoor";
			check = "(cursorObject isKindOf 'House_F') && {player distance cursorObject < 5}";
		};

		class pickupFurniture {
			title = "Pickup Furniture";
			action = "[cursorObject] call DT_fnc_pickupFurniture";
			check = "(nearestObject [player,'House'] in client_keys) && typeOf cursorObject in ['wardrobe']";
		};

		class switchLights {
			title = "Lightswitch";
			action = "[(nearestObject [player,'House'])] call DT_fnc_switchLights";
			check = "(cursorObject isKindOf 'House_F') && (nearestObject [player,'House'] in client_keys)";
		};

		class switchLock {
			title = "Lock switch";
			action = "[(nearestObject [player,'House'])] call DT_fnc_switchLockHouse";
			check = "(cursorObject isKindOf 'House_F') && (nearestObject [player,'House'] in client_keys)";
		};

		class placeItem {
			title = "Place";
			action = "call DT_fnc_placeItem";
			check = "typeOf client_carrying in ['MW_spikeStrip','RoadCone_L_F']";
		};

		class huntAnimal {
			title = "Gut";
			action = "[cursorObject] call DT_fnc_harvestAnimal";
			check = "typeOf cursorObject in ['Hen_random_F','Cock_random_F','Rabbit_F','Goat_random_F','Sheep_random_F']";
		};

		class giveMoney {
			title = "Give Money";
			action = "[cursorObject] call DT_fnc_initMoneyMenu";
			check = "isPlayer cursorObject";
		};

		class pickupMoney {
			title = "Pickup Money";
			action = "[cursorObject] call DT_fnc_pickupMoney";
			check = "(typeOf cursorObject isEqualTo 'Land_Money_F') && (cursorObject getVariable ['cash',0] > 0) && (player distance cursorObject < 3)";
		};

		class tie {
			title = "Zip-tie";
			action = "[cursorObject] call DT_fnc_ziptie";
			check = "isPlayer cursorObject && (animationState cursorObject in ['AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon','unconscious'])";
		};

		class unTie {
			title = "Untie";
			action = "cursorObject setVariable ['tied',false,true]; player addItem 'D_Ziptie_i';";
			check = "cursorObject getVariable ['tied',false]";
		};
	};
};
