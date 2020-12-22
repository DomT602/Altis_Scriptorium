class Misc {
	class CriminalCode {
		felonies[] = {
			{"Murder","60 minutes (+30 minutes per aggravating circumstance)","Directly or indirectly causing the death of a person with intent (not revived by EMS). Aggravating circumstances: (i) The victim was a LEO or a government official."},
			{"Attempted Murder","45 Minutes (+15 minutes per aggravating circumstance)","Directly or indirectly causing the death of a person where the person was able to be revived by EMS. Aggravating circumstances: (i) The victim was a LEO or a government official."}
		};
		misdemeanors[] = {
			{"Aiding & Abetting / Accessory to X charge","20 minutes","Helping or allowing a crime to succeed."},
			{"Class 1 Drug Possession (more than 5)","20 minutes","Possession of  Less than 5 Class 1 drugs (Cannabis / Marijuana)."}
		};
		infractions[] = {
			{"Brandishing a Firearm","$25,000 + Removal of Firearm","Without cause, unholstering a firearm."},
			{"Reckless Driving (25 km/h over)","15000 + Impound","Erratic (out of lane/sidewalk) or excessive speeding (25+ km/h over the posted speed)."}
		};
		definitions[] = {
			{"Class 1 Firearm","Any semi automatic pistol or revolver, .45 caliber and below."},
			{"Class 2 Firearm","Any long rifle or submachine gun (except for a licensed hunting rifle) or anything fully automatic (SA-61, UZI)"}
		};
	};

	class Items {
		D_GoPro_i = "client_goPro = !client_goPro; ['goPro'] call DT_fnc_updateHUDPartial;";
		D_Battery_i = "player setVariable ['phoneBattery',((player getVariable ['phoneBattery',100]) + 50) min 100,[clientOwner,2]]; ['You successfully charged your phone.','green'] call DT_fnc_notify; [{player removeItem 'D_Battery_i'}] call CBA_fnc_execNextFrame";
		D_WaterBottle_i = "['D_WaterBottle_i',100] call DT_fnc_handleDrink; [{player removeItem 'D_WaterBottle_i'}] call CBA_fnc_execNextFrame";
		D_Redgul_i = "['D_Redgul_i',75] call DT_fnc_handleDrink; [{player removeItem 'D_Redgul_i'}] call CBA_fnc_execNextFrame";
		D_Coffee_i = "['D_Coffee_i',75] call DT_fnc_handleDrink; [{player removeItem 'D_Coffee_i'}] call CBA_fnc_execNextFrame";
		D_Franta_i = "['D_Franta_i',75] call DT_fnc_handleDrink; [{player removeItem 'D_Franta_i'}] call CBA_fnc_execNextFrame";
		D_Can_SuperstarEnergy_i = "['D_Can_SuperstarEnergy_i',75] call DT_fnc_handleDrink; [{player removeItem 'D_Can_SuperstarEnergy_i'}] call CBA_fnc_execNextFrame";
		D_Can_Pepsi_i = "['D_Can_Pepsi_i',75] call DT_fnc_handleDrink; [{player removeItem 'D_Can_Pepsi_i'}] call CBA_fnc_execNextFrame";
		D_Can_Monster_i = "['D_Can_Monster_i',75] call DT_fnc_handleDrink; [{player removeItem 'D_Can_Monster_i'}] call CBA_fnc_execNextFrame";
		D_Can_DrPepper_i = "['D_Can_DrPepper_i',75] call DT_fnc_handleDrink; [{player removeItem 'D_Can_DrPepper_i'}] call CBA_fnc_execNextFrame";
		D_Can_7UP_i = "['D_Can_7UP_i',75] call DT_fnc_handleDrink; [{player removeItem 'D_Can_7UP_i'}] call CBA_fnc_execNextFrame";
		D_TacticalBacon_i = "['D_TacticalBacon_i',60] call DT_fnc_handleFood; [{player removeItem 'D_TacticalBacon_i'}] call CBA_fnc_execNextFrame";
		D_Sausages_i = "['D_Sausages_i',60] call DT_fnc_handleFood; [{player removeItem 'D_Sausages_i'}] call CBA_fnc_execNextFrame";
		D_FoodCan_DicksSausage_i = "['D_FoodCan_DicksSausage_i',60] call DT_fnc_handleFood; [{player removeItem 'D_FoodCan_DicksSausage_i'}] call CBA_fnc_execNextFrame";
		D_Sandwich_i = "['D_Sandwich_i',60] call DT_fnc_handleFood; [{player removeItem 'D_Sandwich_i'}] call CBA_fnc_execNextFrame";
		D_Toast_i = "['D_Toast_i',40] call DT_fnc_handleFood; [{player removeItem 'D_Toast_i'}] call CBA_fnc_execNextFrame";
		D_Banana_i = "['D_Banana_i',30] call DT_fnc_handleFood; [{player removeItem 'D_Banana_i'}] call CBA_fnc_execNextFrame";
		D_Kiwi_i = "['D_Kiwi_i',30] call DT_fnc_handleFood; [{player removeItem 'D_Kiwi_i'}] call CBA_fnc_execNextFrame";
		D_FoodCan_DogFood_i = "['D_FoodCan_DogFood_i',25] call DT_fnc_handleFood; closeDialog 0; [{player removeItem 'D_FoodCan_DogFood_i'}] call CBA_fnc_execNextFrame";
		D_Donut_i = "['D_Donut_i',50] call DT_fnc_handleFood; [{player removeItem 'D_Donut_i'}] call CBA_fnc_execNextFrame";
		Spikestrip_Boxed = "['Spikestrip_Boxed'] call DT_fnc_setupItem; [{player removeItem 'Spikestrip_Boxed'}] call CBA_fnc_execNextFrame";
		Roadcone_Boxed = "['Roadcone_Boxed'] call DT_fnc_setupItem; [{player removeItem 'Roadcone_Boxed'}] call CBA_fnc_execNextFrame";
		Wood_Barrier_Boxed = "['Wood_Barrier_Boxed'] call DT_fnc_setupItem; [{player removeItem 'Wood_Barrier_Boxed'}] call CBA_fnc_execNextFrame";
		Concrete_Barrier_Boxed = "['Concrete_Barrier_Boxed'] call DT_fnc_setupItem; [{player removeItem 'Concrete_Barrier_Boxed'}] call CBA_fnc_execNextFrame";
		Wardrobe = "['Wardrobe'] call DT_fnc_placeFurniture; [{player removeItem 'Wardrobe'}] call CBA_fnc_execNextFrame";
		Seed_Types = "active_seed = 'Seed_Types'; [format['You have selected %1 as your active seed.',active_seed]] call DT_fnc_notify";
		MW_tablet = "[false] call DT_fnc_startJailbreak";
		D_PanicButton = "[player] remoteExecCall ['DT_fnc_panic',(['cop'] call DT_fnc_findPlayers)]";
	};

	dealerPositions[] = {
		{{8601.07,6517.07,0.167201},142.646},
		{{1,1,1},100}
	};

	spawnPoints[] = {
		{"Lakeside", "Lakeside_Spawn", ""} //Location name, marker name, conditions
	};
};