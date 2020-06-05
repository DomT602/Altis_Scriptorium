class CfgPatches {
	class Dom_Server {
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {};
		author = "Dom";
	};
};

class CfgFunctions {
	class MySQL {
		tag = "MySQL";
		class SQL {
			file = "\Dom_Server\Functions\MySQL";
			class DBasync {};
			class DBinit {};
		};
	};

	class DB {
		tag = "DB";
		class Buildings {
			file = "\Dom_Server\Functions\Buildings";
			class fetchBuildings {};
			class initBuildings {};
			class insertBuilding {};
			class insertFurniture {};
			class keyChange {};
			class removeFurniture {};
			class updateAlarmState {};
			class updateFurniture {};
			class updateShop {};
		};
		class Companies {
			file = "\Dom_Server\Functions\Companies";
			class deleteCompany {};
			class fetchCompany {};
			class insertCompany {};
			class populateCompanies {};
			class updateCompany {};
		};
		class PD_Database {
			file = "\Dom_Server\Functions\PD_Database";
			class fetchData {};
			class insertArrest {};
			class insertTicket {};
			class insertWarrant {};
			class manageUpdate {};
			class updateWarrant {};
		};
		class Players {
			file = "\Dom_Server\Functions\Players";
			class adjustRank {};
			class initialStats {};
			class insertPlayer {};
			class recieveFactionGear {};
			class saveStatsPartial {};
		};
		class Vehicles {
			file = "\Dom_Server\Functions\Vehicles";
			class fetchAllGarage {};
			class fetchGarage {};
			class insertVehicle {};
			class soldVehicle {};
			class spawnVehicle {};
			class storeVehicle {};
			class transferVehicle {};
			class updateVehicle {};
		};
	};

	class Server_Systems {
		tag = "server";
		class Eventhandlers {
			file = "\Dom_Server\Functions\Eventhandlers";
			class animalKilled {};
			class entityKilled {};
			class fixGate {};
			class handleKeys {};
			class jailbreak {};
			class logAction {};
			class monitorServer {};
			class monitorSpikes {};
			class moveDealer {};
			class onClientDisconnect {};
			class spawnAnimal {};
			class startLightbar {};
			class startSirens {};
			class updateGovData {};
			class updateTemperature {};
		};
		class Gathering {
			file = "\Dom_Server\Functions\Gathering";
			class placeNet {};
			class plantSeed {};
			class respawnRock {};
			class rockHandleDamage {};
			class treeHandleDamage {};
		};
		class Fires {
			file = "\Dom_Server\Functions\Fires";
			class buildingFire {};
			class createFire {};
			class spreadFire {};
		};
	};
};
