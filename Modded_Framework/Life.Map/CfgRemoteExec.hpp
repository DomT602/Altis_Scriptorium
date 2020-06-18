#define F(NAME,TARGET) class NAME { \
	allowedTargets = TARGET; \
};

#define ANYONE 0
#define CLIENT 1
#define SERVER 2

class CfgRemoteExec {
	class Functions {
		mode = 1;
		jip = 0;

		F(DT_fnc_jailTimeChanged,CLIENT)
		F(DT_fnc_knockedDown,CLIENT)
		F(DT_fnc_ziptied,CLIENT)

		F(DT_fnc_companyCreated,CLIENT)
		F(DT_fnc_companyDeleted,CLIENT)
		F(DT_fnc_invitedPlayer,CLIENT)
		F(DT_fnc_manageCompany,CLIENT)

		F(DT_fnc_createMarker,CLIENT)
		F(DT_fnc_handleMoney,CLIENT)
		F(DT_fnc_notify,CLIENT)
		F(DT_fnc_setLightParams,CLIENT)
		F(DT_fnc_switchDuty,CLIENT)

		F(DT_fnc_recieveMoney,CLIENT)
		F(DT_fnc_recruitResponse,CLIENT)
		F(DT_fnc_showID,CLIENT)

		F(DT_fnc_removeTracker,CLIENT)

		F(DT_fnc_onMorphine,CLIENT)
		F(DT_fnc_onRespirator,CLIENT)
		F(DT_fnc_recieveBlood,CLIENT)
		F(DT_fnc_recieveHeat,CLIENT)
		F(DT_fnc_revived,CLIENT)

		F(DT_fnc_beingCalled,CLIENT)
		F(DT_fnc_phoneStateChanged,CLIENT)
		F(DT_fnc_recieveText,CLIENT)

		F(DT_fnc_beLoaded,CLIENT)
		F(DT_fnc_jailTimer,CLIENT)
		F(DT_fnc_patDown,CLIENT)
		F(DT_fnc_recieveTicket,CLIENT)
		F(DT_fnc_respondTicket,CLIENT)
		F(DT_fnc_restrained,CLIENT)
		F(DT_fnc_switchLegCuff,CLIENT)
		F(DT_fnc_tearGas,CLIENT)
		
		F(DT_fnc_recieveGear,CLIENT)
		F(DT_fnc_recieveStats,CLIENT)

		F(DT_fnc_openGarage,CLIENT)
		F(DT_fnc_openTransferMenu,CLIENT)
		F(DT_fnc_recieveKey,CLIENT)
		F(DT_fnc_spikeVehicle,CLIENT)


		F(server_fnc_bankRobbery,SERVER)
		F(server_fnc_fixGate,SERVER)
		F(server_fnc_jailBreak,SERVER)
		F(server_fnc_logAction,SERVER)
		F(server_fnc_monitorSpikes,SERVER)
		F(server_fnc_raidSomewhere,SERVER)
		F(server_fnc_spawnAnimal,SERVER)
		F(server_fnc_startLightbar,SERVER)
		F(server_fnc_startSirens,SERVER)
		F(server_fnc_updateGovData,SERVER)
		
		F(server_fnc_placeNet,SERVER)
		F(server_fnc_plantSeed,SERVER)
		F(server_fnc_treeHandleDamage,SERVER)

		F(server_fnc_buildingFire,SERVER)
		F(server_fnc_createFire,SERVER)

		
		F(DB_fnc_insertBuilding,SERVER)
		F(DB_fnc_insertFurniture,SERVER)
		F(DB_fnc_keyChange,SERVER)
		F(DB_fnc_removeFurniture,SERVER)
		F(DB_fnc_updateAlarmState,SERVER)
		F(DB_fnc_updateFurniture,SERVER)
		F(DB_fnc_updateShop,SERVER)

		F(DB_fnc_deleteCompany,SERVER)
		F(DB_fnc_fetchCompanyBank,SERVER)
		F(DB_fnc_insertCompany,SERVER)
		F(DB_fnc_updateCompany,SERVER)

		F(DB_fnc_fetchData,SERVER)
		F(DB_fnc_insertArrest,SERVER)
		F(DB_fnc_insertTicket,SERVER)
		F(DB_fnc_insertWarrant,SERVER)
		F(DB_fnc_manageUpdate,SERVER)
		F(DB_fnc_updateWarrant,SERVER)
		
		F(DB_fnc_adjustRank,SERVER)
		F(DB_fnc_initialStats,SERVER)
		F(DB_fnc_recieveFactionGear,SERVER)
		F(DB_fnc_saveStatsFull,SERVER)
		F(DB_fnc_saveStatsPartial,SERVER)

		F(DB_fnc_fetchAllGarage,SERVER)
		F(DB_fnc_fetchGarage,SERVER)
		F(DB_fnc_insertVehicle,SERVER)
		F(DB_fnc_soldVehicle,SERVER)
		F(DB_fnc_spawnVehicle,SERVER)
		F(DB_fnc_storeVehicle,SERVER)
		F(DB_fnc_transferVehicle,SERVER)
		F(DB_fnc_updateVehicle,SERVER)

		F(BIS_fnc_effectKilledAirDestruction,ANYONE)
		F(BIS_fnc_effectKilledSecondaries,ANYONE)
		F(BIS_fnc_earthquake,CLIENT)

		F(TFAR_fnc_missingModMessage,CLIENT)
		
		F(BIS_fnc_debugConsoleExec,ANYONE) //remove later
	};

	class Commands {
		mode = 1;
		jip = 0;

		F(switchMove,CLIENT)
		F(systemChat,CLIENT)
		F(globalChat,CLIENT)
		F(lock,ANYONE)
		F(say3D,CLIENT)
		F(hideObjectGlobal,SERVER)
	};
};