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
            class strip {};
        };
    };

    class DB {
        tag = "DB";
        class Buildings {
            file = "\Dom_Server\Functions\Buildings";
            class fetchBuildings {};
            class initHousing {};
            class initShops {};
            class insertBuilding {};
            class insertFurniture {};
            class removeFurniture {};
            class updateAlarmState {};
            class updateFurnitureInventory {};
            class updateShop {};
        };
        class Companies {
            file = "\Dom_Server\Functions\Companies";
            class deleteCompany {};
            class fetchCompany {};
            class fetchCompanyBank {};
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
        };
        class Players {
            file = "\Dom_Server\Functions\Players";
            class adjustRank {};
            class initialStats {};
            class insertPlayer {};
            class recieveFactionGear {};
            class saveStatsFull {};
            class saveStatsPartial {};
        };
        class Vehicles {
            file = "\Dom_Server\Functions\Vehicles";
            class fetchGarage {};
            class insertVehicle {};
            class soldVehicle {};
            class spawnVehicle {};
            class storeVehicle {};
        };
    };

    class Server_Systems {
        tag = "server";
        class Eventhandlers {
            file = "\Dom_Server\Functions\Eventhandlers";
            class animalHandleDamage {};
            class handleKeys {};
            class jailbreak {};
            class logAction {};
            class monitorServer {};
            class monitorSpikes {};
            class moveBlackMarketDealer {};
            class moveDrugDealer {};
            class onClientDisconnect {};
            class spawnAnimal {};
            class startLightbar {};
            class startSirens {};
        };
        class Gathering {
            file = "\Dom_Server\Functions\Gathering";
            class plantSeed {};
            class respawnRock {};
            class rockHandleDamage {};
            class treeHandleDamage {};
        };
        class Fires {
            file = "\Dom_Server\Functions\Fires";
            class buildingFire {};
            class createFire {};
            class extinguishFire {};
            class spreadFire {};
        };
    };
};
