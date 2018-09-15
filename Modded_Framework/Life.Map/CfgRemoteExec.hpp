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

		/* Client functions */
		F(DT_fnc_invitedPlayer,CLIENT)
		F(DT_fnc_flashBanged,CLIENT)
		F(DT_fnc_tearGas,CLIENT)
		F(DT_fnc_onRespirator,CLIENT)
		F(DT_fnc_recieveBlood,CLIENT)
		F(DT_fnc_revived,CLIENT)
		F(DT_fnc_onMorphine,CLIENT)
		F(DT_fnc_dispatchBeingCalled,CLIENT)
		F(DT_fnc_beingCalled,CLIENT)
		F(DT_fnc_jailTimer,CLIENT)
		F(DT_fnc_restrained,CLIENT)
		F(BIS_fnc_earthquake,CLIENT)
		
		/* Server functions */
		F(server_fnc_jailBreak,SERVER)
		F(server_fnc_monitorSpikes,SERVER)
		F(server_fnc_plantSeed,SERVER)
		F(server_fnc_startLightbar,SERVER)
		F(server_fnc_startSirens,SERVER)

		/* DB functions */
		F(DB_fnc_spawnVehicle,SERVER)
		F(DB_fnc_initialStats,SERVER)

		/* Anyone functions */
		F(BIS_fnc_effectKilledAirDestruction,ANYONE)
		F(BIS_fnc_effectKilledSecondaries,ANYONE)
		
		F(BIS_fnc_debugConsoleExec,ANYONE) //remove later
	};

	class Commands {
		mode = 1;
		jip = 0;

		F(switchMove,CLIENT)
	};
};