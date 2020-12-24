class Interactions {
	class cop {
		class unrestrain {
			title = "Unrestrain";
			action = "MB_Interaction_Target setVariable ['restrained',false,true]; player addItem 'D_Handcuffs_i';";
			check = "MB_Interaction_Target getVariable ['restrained',false]";
		};

		class patDown {
			title = "Patdown";
			action = "remoteExecCall ['DT_fnc_patDown',MB_Interaction_Target]";
			check = "MB_Interaction_Target getVariable ['restrained',false] || MB_Interaction_Target getVariable ['tied',false]";
		};

		class stripSearch {
			title = "Strip search";
			action = "[true] remoteExecCall ['DT_fnc_patDown',MB_Interaction_Target]";
			check = "MB_Interaction_Target getVariable ['restrained',false] || MB_Interaction_Target getVariable ['tied',false]";
		};

		class escortPlayer {
			title = "Escort Player";
			action = "[MB_Interaction_Target] call DT_fnc_escort";
			check = "isPlayer MB_Interaction_Target && isNull client_carrying";
		};

		class stopEscort {
			title = "Stop Escorting";
			action = "call DT_fnc_stopEscort";
			check = "isPlayer client_carrying";
		};

		class ticketPlayer {
			title = "Issue Ticket";
			action = "createDialog 'DT_ticketMenu'";
			check = "isPlayer MB_Interaction_Target && !(MB_Interaction_Target getVariable ['dead',false]) || ((MB_Interaction_Target isKindOf 'Car') && !isNull (driver MB_Interaction_Target))";
		};

		class jailPlayer {
			title = "Send to Jail";
			action = "[MB_Interaction_Target] call DT_fnc_initArrestMenu";
			check = "MB_Interaction_Target getVariable ['restrained',false] && {(player distance (getMarkerPos 'Jail')) < 45} && {!((MB_Interaction_Target getVariable ['jailStats',[]]) param [0,false])}";
		};

		class editJail {
			title = "Jail Menu";
			action = "[MB_Interaction_Target] call DT_fnc_initJailMenu";
			check = "((MB_Interaction_Target getVariable ['jailStats',[]]) param [0,false])";
		};

		class putInCar {
			title = "Put In Car";
			action = "[MB_Interaction_Target] call DT_fnc_loadPerson";
			check = "isPlayer MB_Interaction_Target";
		};

		class pullOut {
			title = "Pull Out";
			action = "[MB_Interaction_Target] call DT_fnc_pullOut";
			check = "(MB_Interaction_Target isKindOf 'Car' || (MB_Interaction_Target isKindOf 'Air') || (MB_Interaction_Target isKindOf 'Ship'))";
		};

		class rankChange {
			title = "Promote/Demote";
			action = "call DT_fnc_initRankChange";
			check = "isPlayer MB_Interaction_Target && ((MB_Interaction_Target getVariable ['faction','civ']) isEqualTo 'cop') && (player getVariable ['copRank',0] > 4)";
		};

		class recruit {
			title = "Recruit";
			action = "['cop',MB_Interaction_Target] spawn DT_fnc_recruitPlayer";
			check = "isPlayer MB_Interaction_Target && ((MB_Interaction_Target getVariable ['faction','civ']) isEqualTo 'civ') && (player getVariable ['copRank',0] > 5) && ((player distance (getMarkerPos 'LakesidePD_Spawn')) < 45)";
		};

		class intoxCheck {
			title = "Intox Check";
			action = "[MB_Interaction_Target] call DT_fnc_intoxCheck";
			check = "isPlayer MB_Interaction_Target && !(MB_Interaction_Target getVariable ['dead',false])";
		};

		class impound {
			title = "Impound";
			action = "[MB_Interaction_Target] call DT_fnc_impoundVehicle";
			check = "isNull objectParent player && (MB_Interaction_Target isKindOf 'Car' || (MB_Interaction_Target isKindOf 'Air') || (MB_Interaction_Target isKindOf 'Ship'))";
		};

		class seize {
			title = "Seize";
			action = "[MB_Interaction_Target] call DT_fnc_seizeItems";
			check = "typeOf MB_Interaction_Target isEqualTo 'GroundWeaponHolder'";
		};

		class houseOwner {
			title = "House info";
			action = "[MB_Interaction_Target] call DT_fnc_houseInfo";
			check = "isClass(missionConfigFile >> 'Buildings' >> 'Houses' >> typeOf MB_Interaction_Target) && player distance MB_Interaction_Target < 8";
		};

		class gatherEvidence {
			title = "Gather Evidence";
			action = "[MB_Interaction_Target] call DT_fnc_gatherEvidence";
			check = "!(MB_Interaction_Target getVariable ['evidence',[]] isEqualTo []) && (player distance MB_Interaction_Target < 4)";
		};

		class fixGate {
			title = "Fix Gate";
			action = "call DT_fnc_fixGate";
			check = "typeOf MB_Interaction_Target isEqualTo 'Land_PrisonGateHole' && {player distance MB_Interaction_Target < 4}";
		};

		class switchRadar {
			title = "Switch radar";
			action = "[vehicle player] call DT_fnc_switchRadar";
			check = "!(isNull objectParent player) && {((typeOf vehicle player) find 'marked') != -1}";
		};

		class resetRadar {
			title = "Reset radar";
			action = "[vehicle player] call DT_fnc_resetRadar";
			check = "!(isNull objectParent player) && {((typeOf vehicle player) find 'marked') != -1 && {vehicle player getVariable ['radar_inUse',objNull] isEqualTo player}}";
		};

		class setNumbers {
			title = "Set number";
			action = "createDialog 'DT_carNumbers'";
			check = "!(isNull objectParent player) && {driver (vehicle player) isEqualTo player && {((typeOf vehicle player) find 'marked') != -1}}";
		};

		class checkID {
			title = "Check ID";
			action = "[MB_Interaction_Target] call DT_fnc_showID";
			check = "isPlayer MB_Interaction_Target && !(MB_Interaction_Target getVariable ['dead',false]) && (player distance MB_Interaction_Target < 4)";
		};
	};

	class medic {
		class rankChange {
			title = "Promote/Demote";
			action = "call DT_fnc_initRankChange";
			check = "isPlayer MB_Interaction_Target && ((MB_Interaction_Target getVariable ['faction','civ']) isEqualTo 'medic') && (player getVariable ['medicRank',0] > 4)";
		};

		class recruit {
			title = "Recruit";
			action = "['medic',MB_Interaction_Target] spawn DT_fnc_recruitPlayer";
			check = "isPlayer MB_Interaction_Target && ((MB_Interaction_Target getVariable ['faction','civ']) isEqualTo 'civ') && (player getVariable ['medicRank',0] > 5) && ((player distance (getMarkerPos 'LakesideEMS_Spawn')) < 45)";
		};

		class loadStretcher {
			title = "Load Stretcher";
			action = "[MB_Interaction_Target] call DT_fnc_switchStretcher";
			check = "typeOf MB_Interaction_Target isEqualTo 'Jonzie_Ambulance' && MB_Interaction_Target animationPhase 'Door_1' > 0.5 && (isNull (MB_Interaction_Target getVariable ['stretcher',objNull])) && !((nearestObjects [MB_Interaction_Target,['stretcher'],5]) isEqualTo [])";
		};

		class unloadStretcher {
			title = "Unload Stretcher";
			action = "[MB_Interaction_Target] call DT_fnc_switchStretcher";
			check = "typeOf MB_Interaction_Target isEqualTo 'Jonzie_Ambulance' && MB_Interaction_Target animationPhase 'Door_1' > 0.5 && !(isNull (MB_Interaction_Target getVariable ['stretcher',objNull]))";
		};

		class pullOut {
			title = "Pull Out";
			action = "[MB_Interaction_Target] call DT_fnc_pullOut";
			check = "(MB_Interaction_Target isKindOf 'Car' || (MB_Interaction_Target isKindOf 'Air') || (MB_Interaction_Target isKindOf 'Ship')) && {count (crew MB_Interaction_Target) > 0}";
		};

		class putInCar {
			title = "Put In Car";
			action = "[MB_Interaction_Target] call DT_fnc_loadPerson";
			check = "isPlayer MB_Interaction_Target && (isNull objectParent MB_Interaction_Target) && player distance MB_Interaction_Target < 4";
		};

		class escortPlayer {
			title = "Escort Player";
			action = "[MB_Interaction_Target] call DT_fnc_escort";
			check = "isPlayer MB_Interaction_Target && (isNull objectParent MB_Interaction_Target) && isNull client_carrying && player distance MB_Interaction_Target < 8";
		};

		class stopEscort {
			title = "Stop Escorting";
			action = "call DT_fnc_stopEscort";
			check = "isPlayer client_carrying";
		};

		class impound {
			title = "Impound";
			action = "[MB_Interaction_Target] call DT_fnc_impoundVehicle";
			check = "isNull objectParent player && (MB_Interaction_Target isKindOf 'Car' || (MB_Interaction_Target isKindOf 'Air') || (MB_Interaction_Target isKindOf 'Ship')) && player distance MB_Interaction_Target < 8 && (count (crew MB_Interaction_Target) isEqualTo 0)";
		};
	};

	class civ {
		class impound {
			title = "Impound";
			action = "[MB_Interaction_Target] call DT_fnc_impoundVehicle";
			check = "(player getVariable ['job',''] isEqualTo 'towtrucker') && (player distance (getMarkerPos 'LakesidePD_Spawn')) < 15 && isNull objectParent player && ((MB_Interaction_Target isKindOf 'Car') || (MB_Interaction_Target isKindOf 'Air') || (MB_Interaction_Target isKindOf 'Ship'))";
		};

		class repairObject {
			title = "Repair";
			action = "[MB_Interaction_Target] call DT_fnc_repairTerrainObject";
			check = "(player getVariable ['job',''] isEqualTo 'repairman') && isNull objectParent player && !((nearestTerrainObjects [player,[],4]) isEqualTo [])";
		};

		class untie {
			title = "Untie";
			action = "MB_Interaction_Target setVariable ['tied',false,true]";
			check = "MB_Interaction_Target getVariable ['tied',false]";
		};

		class patDown {
			title = "Patdown";
			action = "remoteExecCall ['DT_fnc_patDown',MB_Interaction_Target]";
			check = "MB_Interaction_Target getVariable ['tied',false]";
		};

		class stripSearch {
			title = "Strip search";
			action = "[true] remoteExecCall ['DT_fnc_patDown',MB_Interaction_Target]";
			check = "MB_Interaction_Target getVariable ['tied',false]";
		};

		class putInCar {
			title = "Put In Car";
			action = "[MB_Interaction_Target] call DT_fnc_loadPerson";
			check = "isPlayer MB_Interaction_Target && (MB_Interaction_Target getVariable ['tied',false])";
		};

		class jailbreakGate {
			title = "Plant Explosive";
			action = "call DT_fnc_initBombMenu";
			check = "typeOf MB_Interaction_Target isEqualTo 'Land_PrisonGate' && {player distance MB_Interaction_Target < 4}";
		};
		class rankChange {
			title = "Promote/Demote";
			action = "call DT_fnc_initRankChange";
			check = "isPlayer MB_Interaction_Target && ((MB_Interaction_Target getVariable ['faction','civ']) isEqualTo 'civ') && (MB_Interaction_Target getVariable ['dojRank',0] > 0) && (player getVariable ['dojRank',0] > 4)";
		};

		class recruit {
			title = "Recruit";
			action = "['civ',MB_Interaction_Target] spawn DT_fnc_recruitPlayer";
			check = "isPlayer MB_Interaction_Target && ((MB_Interaction_Target getVariable ['faction','civ']) isEqualTo 'civ') && (player getVariable ['dojRank',0] > 3)";
		};
	};

	class shared {
		class banking {
			title = "ATM";
			action = "[false] call DT_fnc_initATM";
			check = "isNull objectParent player && [MB_Interaction_Target,'atm'] call DT_fnc_lookingAt";
		};
		/*class carRepair {
			title = "Repair Menu";
			action = "[MB_Interaction_Target] call DT_fnc_repairMenu";
			check = "(MB_Interaction_Target isKindOf 'Car') && (isNull objectParent player) && (player distance MB_Interaction_Target < 4)";
		};*/

		class vehicleRepair {
			title = "Repair";
			action = "[MB_Interaction_Target] call DT_fnc_repairVehicle";
			check = "(MB_Interaction_Target isKindOf 'Car' || MB_Interaction_Target isKindOf 'Air' || MB_Interaction_Target isKindOf 'Ship') && (isNull objectParent player) && (player distance MB_Interaction_Target < 4)";
		};

		class vehicleModShop {
			title = "Mod vehicle";
			action = "[MB_Interaction_Target] call DT_fnc_initModShop";
			check = "MB_Interaction_Target isKindOf 'Car' && ((MB_Interaction_Target getVariable ['keyHolders',[]] select 0) isEqualTo profileName) && (isNull objectParent player) && (player distance MB_Interaction_Target < 4) && (player distance getMarkerPos 'marker_53') < 7";
		};

		class vehiclePush {
			title = "Push";
			action = "[MB_Interaction_Target] call DT_fnc_pushVehicle";
			check = "(MB_Interaction_Target isKindOf 'Car' || MB_Interaction_Target isKindOf 'Ship') && (isNull objectParent player) && (player distance MB_Interaction_Target < 5)";
		};

		class vehicleFlip {
			title = "Flip";
			action = "[MB_Interaction_Target] call DT_fnc_flipVehicle";
			check = "(MB_Interaction_Target isKindOf 'Car') && (local MB_Interaction_Target) && (isNull objectParent player) && (player distance MB_Interaction_Target < 5) && ((vectorUp MB_Interaction_Target) vectorCos (surfaceNormal getPosATL MB_Interaction_Target) < 0.5)";
		};

		class nameMenu {
			title = "Name Menu";
			action = "createDialog 'DT_nameMenu'";
			check = "isPlayer MB_Interaction_Target";
		};

		class giveKey {
			title = "Give Keys";
			action = "[MB_Interaction_Target] call DT_fnc_keyMenu";
			check = "!(client_keys isEqualTo []) && isPlayer MB_Interaction_Target";
		};

		class pickupItem {
			title = "Pickup";
			action = "[MB_Interaction_Target] call DT_fnc_pickupItem";
			check = "typeOf MB_Interaction_Target in ['log','rock','MW_spikeStrip','RoadCone_L_F','RoadBarrier_F','Land_CncBarrier_F','Land_BarGate_F','Small_Package','Land_Sleeping_bag_blue_folded_F']";
		};

		class plantSeed {
			title = "Plant Seed";
			action = "call DT_fnc_plantSeed";
			check = "!(active_seed isEqualTo '') && isNull objectParent player && (surfaceType (getPosATL player) in ['dirt','#ag_farm'])";
		};

		class harvestPlant {
			title = "Harvest Plant";
			action = "[MB_Interaction_Target] call DT_fnc_harvestPlant";
			check = "(typeOf MB_Interaction_Target in ['Wheat_vehicle','Oleander2','Ficus_Bush_1']) && isNull objectParent player && (player distance MB_Interaction_Target < 3)";
		};

		class buyBuilding {
			title = "Buy";
			action = "[MB_Interaction_Target] spawn DT_fnc_buyBuilding";
			check = "(MB_Interaction_Target isKindOf 'House_F') && {player distance MB_Interaction_Target < 10} && {(MB_Interaction_Target getVariable ['owner','']) isEqualTo ''} && {(MB_Interaction_Target getVariable ['shop_owner','']) isEqualTo ''}";
		};

		class houseMenu {
			title = "House menu";
			action = "[MB_Interaction_Target] call DT_fnc_alarmMenu";
			check = "isClass(missionConfigFile >> 'Buildings' >> 'Houses' >> typeOf MB_Interaction_Target) && (MB_Interaction_Target getVariable ['owner',''] isEqualTo getPlayerUID player) && player distance MB_Interaction_Target < 8";
		};

		class givePermKey {
			title = "Give house key";
			action = "[MB_Interaction_Target,nearestObject [player,'House']] spawn DT_fnc_givePermKey";
			check = "(nearestObject [player,'House'] getVariable ['owner',''] isEqualTo getPlayerUID player) && isPlayer MB_Interaction_Target";
		};

		class breakDoor {
			title = "Break Door";
			action = "[MB_Interaction_Target] call DT_fnc_breakDoor";
			check = "isClass(missionConfigFile >> 'Buildings' >> 'Houses' >> typeOf MB_Interaction_Target) && {player distance MB_Interaction_Target < 8}";
		};

		class pickupFurniture {
			title = "Pickup Furniture";
			action = "[MB_Interaction_Target] call DT_fnc_pickupFurniture";
			check = "(nearestObject [player,'House'] in client_keys) && typeOf MB_Interaction_Target in ['wardrobe']";
		};

		class switchLock {
			title = "Lock switch";
			action = "[MB_Interaction_Target] call DT_fnc_switchLockHouse";
			check = "isClass(missionConfigFile >> 'Buildings' >> 'Houses' >> typeOf MB_Interaction_Target) && (MB_Interaction_Target in client_keys) && player distance MB_Interaction_Target < 8";
		};

		class placeItem {
			title = "Place";
			action = "call DT_fnc_placeItem";
			check = "typeOf client_carrying in ['MW_spikeStrip','RoadCone_L_F']";
		};

		class huntAnimal {
			title = "Gut";
			action = "[MB_Interaction_Target] call DT_fnc_harvestAnimal";
			check = "typeOf MB_Interaction_Target in ['Hen_random_F','Cock_random_F','Rabbit_F','Goat_random_F','Sheep_random_F'] && !alive MB_Interaction_Target";
		};

		class giveMoney {
			title = "Give Money";
			action = "[MB_Interaction_Target] call DT_fnc_initMoneyMenu";
			check = "isPlayer MB_Interaction_Target";
		};

		class pickupMoney {
			title = "Pickup Money";
			action = "[MB_Interaction_Target] call DT_fnc_pickupMoney";
			check = "(typeOf MB_Interaction_Target isEqualTo 'Land_Money_F') && (MB_Interaction_Target getVariable ['cash',0] > 0) && (player distance MB_Interaction_Target < 3)";
		};

		class tie {
			title = "Zip-tie";
			action = "[MB_Interaction_Target] call DT_fnc_ziptie";
			check = "isPlayer MB_Interaction_Target && (animationState MB_Interaction_Target in ['AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon','unconscious'])";
		};

		class unTie {
			title = "Untie";
			action = "MB_Interaction_Target setVariable ['tied',false,true]; player addItem 'D_Ziptie_i';";
			check = "MB_Interaction_Target getVariable ['tied',false]";
		};

		class dropItem {
			title = "Drop Package";
			action = "call DT_fnc_stopEscort";
			check = "(typeOf client_carrying in ['Small_Package'])";
		};

		class startDelivery {
			title = "Start Delivery";
			action = "createDialog 'DT_delivery'";
			check = "(MB_Interaction_Target isKindOf 'C_Man_1_2_F') && !(isPlayer MB_Interaction_Target)";
		};

		class endDelivery {
			title = "Complete Delivery";
			action = "call DT_fnc_endDelivery";
			check = "MB_Interaction_Target isEqualTo ((client_carrying getVariable ['pack_details',[]]) select 0)";
		};

		class fullHeal {
			title = "Heal Me";
			action = "[MB_Interaction_Target] spawn DT_fnc_fullHeal";
			check = "(MB_Interaction_Target isKindOf 'D_Base_Medic') && ((player distance MB_Interaction_Target) < 7.5)";
		};

		class companyInvite {
			title = "Company Invite";
			action = "if ([MB_Interaction_Target] call DT_fnc_checkPlayer) then {[player getVariable ['company',''],player] remoteExec ['DT_fnc_invitedPlayer',MB_Interaction_Target]};";
			check = "isPlayer MB_Interaction_Target && !(MB_Interaction_Target getVariable ['dead',false]) && (player getVariable ['companyRank',0] > 1) && (MB_Interaction_Target getVariable ['company',''] isEqualTo '')";
		};

		class showID {
			title = "Show ID";
			action = "[player] remoteExecCall ['DT_fnc_showID',MB_Interaction_Target]";
			check = "isPlayer MB_Interaction_Target && !(MB_Interaction_Target getVariable ['dead',false]) && (player distance MB_Interaction_Target < 4)";
		};

		class showFakeID {
			title = "Show ID";
			action = "[(profileNamespace getVariable ['DT_fakeID',[]])] remoteExecCall ['DT_fnc_showID',MB_Interaction_Target]";
			check = "!(profileNamespace getVariable ['DT_fakeID',[]] isEqualTo []) && isPlayer MB_Interaction_Target && !(MB_Interaction_Target getVariable ['dead',false]) && (player distance MB_Interaction_Target < 4)";
		};

		class makeFakeID {
			title = "Create Fake ID";
			action = "[MB_Interaction_Target] call DT_fnc_initIDMenu";
			check = "MB_Interaction_Target isEqualTo black_market_dealer && ((player distance MB_Interaction_Target) < 4)";
		};

		class attachTracker {
			title = "Attach tracker";
			action = "[MB_Interaction_Target] call DT_fnc_attachGPS";
			check = "'ItemGPS' in (items player) && (player distance MB_Interaction_Target) < 4 && (isPlayer MB_Interaction_Target || (MB_Interaction_Target isKindOf 'Car' || MB_Interaction_Target isKindOf 'Air' || MB_Interaction_Target isKindOf 'Ship'))";
		};

		class taxiDistance {
			title = "Taxi distance";
			action = "[vehicle player] call DT_fnc_taxiDistance";
			check = "!isNull objectParent player && (player getVariable ['job',''] isEqualTo 'taximan') && (driver (vehicle player) isEqualTo player)";
		};

		class turtlePoach {
			title = "Catch turtle";
			action = "[MB_Interaction_Target] call DT_fnc_catchFish";
			check = "MB_Interaction_Target isKindOf 'Turtle_F' && !alive MB_Interaction_Target && ((player distance MB_Interaction_Target) < 3)";
		};

		class catchFish {
			title = "Catch fish";
			action = "[MB_Interaction_Target] call DT_fnc_catchFish";
			check = "MB_Interaction_Target isKindOf 'Fish_Base_F' && ((player distance MB_Interaction_Target) < 3)";
		};

		class openPlayerShop {
			title = "Open shop";
			action = "[MB_Interaction_Target] call DT_fnc_initPlayerShop";
			check = "isClass(missionConfigFile >> 'Buildings' >> 'Shops' >> typeOf MB_Interaction_Target) && {player distance MB_Interaction_Target < 8} && {(MB_Interaction_Target getVariable ['shop_owner','']) != ''}";
		};

		class managePlayerShop {
			title = "Manage shop";
			action = "['init'] call DT_fnc_manageShop";
			check = "isClass(missionConfigFile >> 'Buildings' >> 'Shops' >> typeOf MB_Interaction_Target) && {player distance MB_Interaction_Target < 8} && {(MB_Interaction_Target getVariable ['shop_owner','']) isEqualTo getPlayerUID player}";
		};
		class switchDuty {
			title = "Switch duty";
			action = "[MB_Interaction_Target getVariable ['dutySwitch','']] call DT_fnc_switchDuty";
			check = "((MB_Interaction_Target getVariable ['dutySwitch','']) != '') && {(player distance MB_Interaction_Target) < 4}";
		};
		class switchDispatch {
			title = "Switch dispatch";
			action = "call DT_fnc_switchDispatch";
			check = "((MB_Interaction_Target getVariable ['dutySwitch','']) != '') && {(player getVariable ['faction','civ']) != 'civ'} && {(player distance MB_Interaction_Target) < 4}";
		};
		class switchJob {
			title = "Switch job";
			action = "[player,MB_Interaction_Target getVariable ['jobSwitch','']] call DT_fnc_switchJob";
			check = "((MB_Interaction_Target getVariable ['jobSwitch','']) != '') && {(player distance MB_Interaction_Target) < 4}";
		};
		class robStore {
			title = "Rob store";
			action = "[MB_Interaction_Target] call DT_fnc_robStore";
			check = "!((MB_Interaction_Target getVariable ['robStore',[]]) isEqualTo []) && {(player distance MB_Interaction_Target) < 4}";
		};
		class storeGarage {
			title = "Store vehicle";
			action = "[MB_Interaction_Target] call DT_fnc_storeVehicle";
			check = "!((MB_Interaction_Target getVariable ['garage',[]]) isEqualTo []) && {(player distance MB_Interaction_Target) < 4} && {((MB_Interaction_Target getVariable ['garage',[]]) param [3,'all']) in ['all',player getVariable ['faction','civ']]}";
		};
		class openGarage {
			title = "Open garage";
			action = "[MB_Interaction_Target getVariable ['garage',[]]] call DT_fnc_initGarage";
			check = "!((MB_Interaction_Target getVariable ['garage',[]]) isEqualTo []) && {(player distance MB_Interaction_Target) < 4} && {((MB_Interaction_Target getVariable ['garage',[]]) param [3,'all']) in ['all',player getVariable ['faction','civ']]}";
		};
		class itemShop {
			title = "Item shop";
			action = "[MB_Interaction_Target] call DT_fnc_initItemShop";
			check = "((MB_Interaction_Target getVariable ['itemShop','']) != '') && {((player distance MB_Interaction_Target) < 4) && {[(getText(missionConfigFile >> 'Shops' >> 'Items' >> (MB_Interaction_Target getVariable ['itemShop','']) >> 'conditions'))] call DT_fnc_conditionChecker}}";
		};
		class clothingShop {
			title = "Clothing shop";
			action = "[MB_Interaction_Target getVariable ['clothingShop','']] call DT_fnc_initClothingShop";
			check = "((MB_Interaction_Target getVariable ['clothingShop','']) != '') && {((player distance MB_Interaction_Target) < 4) && {[(getText(missionConfigFile >> 'Shops' >> 'Clothing' >> (MB_Interaction_Target getVariable ['clothingShop','']) >> 'conditions'))] call DT_fnc_conditionChecker}}";
		};
		class vehicleShop {
			title = "Vehicle shop";
			action = "(MB_Interaction_Target getVariable ['vehShop',[]]) call DT_fnc_initVehicleShop";
			check = "!((MB_Interaction_Target getVariable ['vehShop',[]]) isEqualTo []) && {((player distance MB_Interaction_Target) < 4) && {[(getText(missionConfigFile >> 'Shops' >> 'Vehicle' >> ((MB_Interaction_Target getVariable ['vehShop',[]]) select 0) >> 'conditions'))] call DT_fnc_conditionChecker}}";
		};
		class buyLicense {
			title = "Buy license";
			action = "[MB_Interaction_Target getVariable ['license','']] spawn DT_fnc_buyLicense";
			check = "((MB_Interaction_Target getVariable ['license','']) != '') && {((player distance MB_Interaction_Target) < 4) && {!((MB_Interaction_Target getVariable ['license','']) in client_licenses)}}";
		};
		class transferVehicle {
			title = "Transfer vehicle";
			action = "[getPlayerUID player,MB_Interaction_Target getVariable ['faction','civ']] remoteExecCall ['DB_fnc_fetchAllGarage',2]; ['Fetching vehicles.'] call DT_fnc_notify";
			check = "isPlayer MB_Interaction_Target && !(MB_Interaction_Target getVariable ['dead',false])";
		};
		class questionBlackMarket {
			title = "Ask about Black Market";
			action = "[true,MB_Interaction_Target] call DT_fnc_questionLocation";
			check = "((MB_Interaction_Target getVariable ['itemShop','']) in ['genstore']) && {((player distance MB_Interaction_Target) < 5)}";
		};
		class questionDrugDealer {
			title = "Ask about Drug Dealer";
			action = "[false,MB_Interaction_Target] call DT_fnc_questionLocation";
			check = "((MB_Interaction_Target getVariable ['itemShop','']) in ['genstore']) && {((player distance MB_Interaction_Target) < 5)}";
		};
		class dropMoneyBag {
			title = "Drop Money Bag";
			action = "call DT_fnc_stopEscort";
			check = "(typeOf client_carrying isEqualTo 'Land_Sleeping_bag_blue_folded_F')";
		};
	};
};

class Medical {
	class head {
		class bandage {
			title = "Bandage";
			action = "[0] call DT_fnc_bandage";
			check = "(MB_Interaction_Target getVariable ['bleeding',[]] select 0) isEqualTo 1";
		};
		class treat {
			title = "Treat";
			action = "call DT_fnc_treatHead";
			check = "(player getVariable ['faction','civ'] isEqualTo 'medic') && MB_Interaction_Target != player && (MB_Interaction_Target getVariable ['injuries',[]] select 0) != 0";
		};
		class respirator {
			title = "Apply respirator";
			action = "call DT_fnc_applyRespirator";
			check = "(player getVariable ['faction','civ'] isEqualTo 'medic') && MB_Interaction_Target != player && (getOxygenRemaining MB_Interaction_Target) != 1";
		};
	};
	class torso {
		class bandage {
			title = "Bandage";
			action = "[1] call DT_fnc_bandage";
			check = "(MB_Interaction_Target getVariable ['bleeding',[]] select 1) isEqualTo 1";
		};
		class treat {
			title = "Treat";
			action = "[1] call DT_fnc_treatPart";
			check = "(MB_Interaction_Target getVariable ['injuries',[]] select 1) != 0";
		};
		class defibrillate {
			title = "Defibrillate";
			action = "[MB_Interaction_Target] call DT_fnc_defibTarget";
			check = "(player getVariable ['faction','civ'] isEqualTo 'medic') && (MB_Interaction_Target getVariable ['dead',false])";
		};
		class detox {
			title = "Detox";
			action = "[MB_Interaction_Target] call DT_fnc_detox";
			check = "(player getVariable ['faction','civ'] isEqualTo 'medic') && !(MB_Interaction_Target getVariable ['dead',false]) && (MB_Interaction_Target getVariable ['intoxication',0] > 0)";
		};
		class heatpack {
			title = "Heatpack";
			action = "[true] call DT_fnc_applyHeatpack";
			check = "MB_Interaction_Target getVariable ['bodyTemp',37] < 38";
		};
		class icepack {
			title = "Icepack";
			action = "[false] call DT_fnc_applyHeatpack";
			check = "MB_Interaction_Target getVariable ['bodyTemp',37] > 36";
		};
	};
	class arm_l {
		class bandage {
			title = "Bandage";
			action = "[2] call DT_fnc_bandage";
			check = "(MB_Interaction_Target getVariable ['bleeding',[]] select 2) isEqualTo 1";
		};
		class cast {
			title = "Cast";
			action = "[2] call DT_fnc_treatPart";
			check = "(MB_Interaction_Target getVariable ['injuries',[]] select 2) != 0";
		};
		class morphine {
			title = "Morphine";
			action = "call DT_fnc_giveMorphine";
			check = "";
		};
		class bloodbag {
			title = "Bloodbag";
			action = "call DT_fnc_bloodBag";
			check = "(player getVariable ['faction','civ'] isEqualTo 'medic') && MB_Interaction_Target != player && MB_Interaction_Target getVariable ['blood',5000] != 5000";
		};
	};
	class arm_r {
		class bandage {
			title = "Bandage";
			action = "[3] call DT_fnc_bandage";
			check = "(MB_Interaction_Target getVariable ['bleeding',[]] select 3) isEqualTo 1";
		};
		class cast {
			title = "Cast";
			action = "[3] call DT_fnc_treatPart";
			check = "(MB_Interaction_Target getVariable ['injuries',[]] select 3) != 0";
		};
		class morphine {
			title = "Morphine";
			action = "call DT_fnc_giveMorphine";
			check = "";
		};
		class bloodbag {
			title = "Bloodbag";
			action = "call DT_fnc_bloodBag";
			check = "(player getVariable ['faction','civ'] isEqualTo 'medic') && MB_Interaction_Target != player && MB_Interaction_Target getVariable ['blood',5000] != 5000";
		};
	};
	class leg_l {
		class bandage {
			title = "Bandage";
			action = "[4] call DT_fnc_bandage";
			check = "(MB_Interaction_Target getVariable ['bleeding',[]] select 4) isEqualTo 1";
		};
		class splint {
			title = "Splint";
			action = "[4] call DT_fnc_treatPart";
			check = "(MB_Interaction_Target getVariable ['injuries',[]] select 4) != 0";
		};
		class morphine {
			title = "Morphine";
			action = "call DT_fnc_giveMorphine";
			check = "";
		};
		class bloodbag {
			title = "Bloodbag";
			action = "call DT_fnc_bloodBag";
			check = "(player getVariable ['faction','civ'] isEqualTo 'medic') && MB_Interaction_Target != player && MB_Interaction_Target getVariable ['blood',5000] != 5000";
		};
	};
	class leg_r {
		class bandage {
			title = "Bandage";
			action = "[5] call DT_fnc_bandage";
			check = "(MB_Interaction_Target getVariable ['bleeding',[]] select 5) isEqualTo 1";
		};
		class splint {
			title = "Splint";
			action = "[5] call DT_fnc_treatPart";
			check = "(MB_Interaction_Target getVariable ['injuries',[]] select 5) != 0";
		};
		class morphine {
			title = "Morphine";
			action = "call DT_fnc_giveMorphine";
			check = "";
		};
		class bloodbag {
			title = "Bloodbag";
			action = "call DT_fnc_bloodBag";
			check = "(player getVariable ['faction','civ'] isEqualTo 'medic') && MB_Interaction_Target != player && MB_Interaction_Target getVariable ['blood',5000] != 5000";
		};
	};
};