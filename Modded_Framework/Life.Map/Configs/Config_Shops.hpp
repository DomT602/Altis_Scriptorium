/*
Item shop configs work by:
	Name of store
	Conditions to enter store
	Items with format {"classname",buyprice,sellprice,"conditions"}
	If buyprice is -1, its unbuyable, same for selling
	Magazines work the same

Clothing shop configs work by:
	Conditions to enter store
	Clothing with format {"classname",buyprice,"conditions"}
Vehicle shop configs work by:
	Name of store
	Conditions to enter store
	Vehicles with format {"classname",buyprice,"conditions"}
*/
class Shops {
	class Items {
		class gun {
			name = "Logan's Firearms";
			conditions = "('gun' in client_licenses)";
			items[] = {
				{"hgun_Pistol_heavy_01_F",6500,3250,""}
			};
			mags[] = {
				{"11Rnd_45ACP_Mag",125,60,""}
			};
		};

		class genstore {
			name = "General Store";
			conditions = "";
			items[] = {
				{"D_GoPro_i",500,-1,""},
				{"D_Bandage_i",10,-1,""},
				{"D_Battery_i",250,-1,""},
				{"Toolkit",150,-1,""},
				{"Binocular",150,-1,""},
				{"ItemGPS",100,50,""},
				{"ItemMap",50,25,""},
				{"ItemCompass",50, 25,""},
				{"ItemWatch",50,25,""},
				{"D_Wrench_i",50,25,""},
				{"D_iPhone9_i","Phone",10,50,""},
				{"NVGoggles",1000,500,""},
				{"NVGoggles_OPFOR",1000,500,""},
				{"NVGoggles_INDEP",1000,500,""},
				{"Chemlight_red",100,50,""},
				{"Chemlight_yellow",100,50,""},
				{"Chemlight_green",100,50,""},
				{"Chemlight_blue",100,50,""}
			};
			mags[] = {
			};
		};
		
		class foodstore {
			name = "Food Market";
			conditions = "";
			items[] = {
				{"D_WaterBottle_i",50,-1,""},
				{"D_Franta_i",50,-1,""},
				{"D_Redgul_i",75,-1,""},
				{"D_TacticalBacon_i",75,-1,""},
				{"D_Banana_i",30,-1,""},
				{"D_Sandwich_i",30,-1,""},
				{"D_Sausages_i",30,-1,""},
				{"D_Donut_i",30,-1,""},
				{"D_Coffee_i",30,-1,""},
				{"D_Kiwi_i",30,-1,""},
				{"D_Toast_i",30,-1,""},
				{"D_Can_SuperstarEnergy_i",30,-1,""},
				{"D_Can_Pepsi_i",30,-1,""},
				{"D_Can_Monster_i",30,-1,""},
				{"D_Can_DrPepper_i",30,-1,""},
				{"D_Can_7UP_i",30,-1,""},
				{"D_FoodCan_DogFood_i",30,-1,""},
				{"D_FoodCan_DicksSausage_i",30,-1,""}
			};
			mags[] = {
			};
		};

		class cop {
			name = "Police Supplies";
			conditions = "(player getVariable ['faction','civ']) isEqualTo 'cop'";
			items[] = {
				{"D_GoPro_i",0,-1,""},
				{"D_Coffee_i",0,-1,""},
				{"D_Redgul_i",0,-1,""},
				{"D_Bandage_i",0,-1,""},
				{"D_Battery_i",0,-1,""},
				{"D_Handcuffs_i",0,-1,""},
				{"D_Ziptie_i",0,-1,""},
				{"D_Wrench_i",0,-1,""},
				{"Chemlight_red",0,-1,""},
				{"ItemWatch",0,-1,""},
				{"ItemMap",0,-1,""},
				{"ItemCompass",0,-1,""},
				{"ItemGPS",0,-1,""},
				{"D_iPhone9_i","Phone",10,50,""},
				{"D_Earpiece",0,-1,""},
				{"Binocular",0,-1,""},
				{"hgun_Pistol_heavy_01_F",0,-1,""},
				{"SmokeShellYellow",0,-1,"(player getVariable ['department','Patrol']) isEqualTo 'SWAT' && player getVariable ['copRank',0] >= 4"}
			};
			mags[] = {
				{"11Rnd_45ACP_Mag",0,-1,""}
			};
		};

		class medic {
			name = "Medical Supplies";
			conditions = "(player getVariable ['faction','civ']) isEqualTo 'medic'";
			items[] = {
				{"D_GoPro_i",0,-1,""},
				{"D_Bandage_i",0,-1,""},
				{"D_BloodBag_i",0,-1,""},
				{"D_Splint_i",0,-1,""},
				{"D_Cast_i",0,-1,""},
				{"D_IcePack_i",0,-1,""},
				{"D_Heatpack_i",0,-1,""},
				{"D_Defibrillator_i",0,-1,""},
				{"D_iPhone9_i","Phone",10,50,""}
			};
			mags[] = {};
		};
	};
	class Clothing {
		class cop {
			conditions = "(player getVariable ['faction','civ']) isEqualTo 'cop'";
			uniforms[] = {
				{"D_Police_Cadet",0,"player getVariable ['copRank',0] isEqualTo 1"},
				{"D_Police_Officer",0,"player getVariable ['copRank',0] isEqualTo 2"},
				{"D_Police_Corporal",0,"player getVariable ['copRank',0] isEqualTo 3"},
				{"D_Police_CorporalFTO",0,"player getVariable ['copRank',0] isEqualTo 3"},
				{"D_Police_Sergeant",0,"player getVariable ['copRank',0] isEqualTo 4"},
				{"D_Police_Lieutenant",0,"player getVariable ['copRank',0] isEqualTo 5"},
				{"D_Police_Captain",0,"player getVariable ['copRank',0] isEqualTo 6"},
				{"D_Police_AsstChief",0,"player getVariable ['copRank',0] isEqualTo 7"},
				{"D_Police_Chief",0,"player getVariable ['copRank',0] isEqualTo 7"},
				{"D_Highway_Cadet",0,"player getVariable ['copRank',0] isEqualTo 1"},
				{"D_Highway_Officer",0,"player getVariable ['copRank',0] isEqualTo 2"},
				{"D_Highway_Corporal",0,"player getVariable ['copRank',0] isEqualTo 3"},
				{"D_Highway_CorporalFTO",0,"player getVariable ['copRank',0] isEqualTo 3"},
				{"D_Highway_Sergeant",0,"player getVariable ['copRank',0] isEqualTo 4"},
				{"D_Highway_Lieutenant",0,"player getVariable ['copRank',0] isEqualTo 5"},
				{"D_Highway_Captain",0,"player getVariable ['copRank',0] isEqualTo 6"},
				{"D_Corrections_Cadet",0,"player getVariable ['copRank',0] isEqualTo 1"},
				{"D_Corrections_Officer",0,"player getVariable ['copRank',0] isEqualTo 2"},
				{"D_Corrections_Corporal",0,"player getVariable ['copRank',0] isEqualTo 3"},
				{"D_Corrections_CorporalFTO",0,"player getVariable ['copRank',0] isEqualTo 3"},
				{"D_Corrections_Sergeant",0,"player getVariable ['copRank',0] isEqualTo 4"},
				{"D_Corrections_Lieutenant",0,"player getVariable ['copRank',0] isEqualTo 5"},
				{"D_Corrections_Captain",0,"player getVariable ['copRank',0] isEqualTo 6"},
				{"D_SWAT_Uni_Tactical",0,"(player getVariable ['department','Patrol']) isEqualTo 'SWAT'"},
				{"D_Police_Uni_Diving",0,"player getVariable ['copRank',0] > 2"}
			};
			vests[] = {
				{"PoliceVest",0,""},
				{"D_Police_Vest_Carrier",0,"(player getVariable ['department','Patrol']) isEqualTo 'Patrol'"},
				{"D_Highway_Vest",0,"(player getVariable ['department','Patrol']) isEqualTo 'Highway Patrol'"},
				{"D_Corrections_Vest",0,"(player getVariable ['department','Patrol']) isEqualTo 'Department of Corrections'"},
				{"D_Base_Vest",0,"(player getVariable ['department','Patrol']) isEqualTo 'SWAT'"},
				{"D_Safety_yellow",0,""}
			};
			backpacks[] = {
				{"AM_PoliceBelt",0,""}
			};
			goggles[] = {
				{"G_Spectacles_Tinted",0,""},
				{"G_Spectacles",0,""},
				{"G_Aviator",0,""},
				{"G_B_Diving",0,""},
				{"D_SWAT_Bala_Stealth",0,"(player getVariable ['department','Patrol']) isEqualTo 'SWAT'"}
			};
			headgear[] = {
				{"D_Hat_Police_Academy",0,""},
				{"D_Hat_Police",0,""},
				{"D_HatBack_Police",0,""},
				{"D_Hat_Highway",0,"(player getVariable ['department','Patrol']) isEqualTo 'Highway Patrol'"},
				{"D_Hat_Corrections",0,"(player getVariable ['department','Patrol']) isEqualTo 'Department of Corrections'"},
				{"D_Hat_DTU",0,"(player getVariable ['department','Patrol']) isEqualTo 'DTU'"},
				{"D_HatBack_DTU",0,"(player getVariable ['department','Patrol']) isEqualTo 'DTU'"},
				{"D_Beret_CID",0,"(player getVariable ['department','Patrol']) in ['DTU','SWAT']"},
				{"D_Hat_SWAT",0,"(player getVariable ['department','Patrol']) isEqualTo 'SWAT'"},
				{"D_HatBack_SWAT",0,"(player getVariable ['department','Patrol']) isEqualTo 'SWAT'"},
				{"D_SWAT_Hat_Heavy",0,"(player getVariable ['department','Patrol']) isEqualTo 'SWAT'"}
			};
		};
		class medic {
			conditions = "(player getVariable ['faction','civ']) isEqualTo 'medic'";
			uniforms[] = {
				{"D_FireRescue_Uni_Probie",0,"player getVariable ['medicRank',0] isEqualTo 1"},
				{"D_FireRescue_Uni_EMT",0,"player getVariable ['medicRank',0] isEqualTo 2"},
				{"D_FireRescue_Uni_EMTYellow",0,"player getVariable ['medicRank',0] isEqualTo 2"},
				{"D_FireRescue_Uni_SeniorEMT",0,"player getVariable ['medicRank',0] > 2"},
				{"D_FireRescue_Uni_SeniorEMTYellow",0,"player getVariable ['medicRank',0] > 2"},
				{"D_FireRescue_Uni_Command",0,"player getVariable ['medicRank',0] > 4"},
				{"D_FireRescue_Uni_Probie",0,"player getVariable ['medicRank',0] > 4"}
			};
			vests[] = {

			};
			backpacks[] = {

			};
			goggles[] = {

			};
			headgear[] = {

			};
		};
		class civ {
			conditions = "";
			uniforms[] = {
				{"U_Competitor",75,""},
				{"U_IG_Guerilla1_1",80,""},
				{"U_C_Journalist",92,""}
			};
			vests[] = {

			};
			backpacks[] = {

			};
			goggles[] = {

			};
			headgear[] = {

			};
		};
	};
	class Vehicle {
		class civ_basic {
			name = "Bob's Cars";
			conditions = "";
			vehicles[] = {
				{"B_Quadbike_01_F",1000,""}
			};
		};
		class cop_car {
			name = "Police Vehicles";
			conditions = "(player getVariable ['faction','civ']) isEqualTo 'cop'";
			vehicles[] = {
				{"ivory_evox_marked",0,""}
			};
		};
		class cop_air {
			name = "Police Aircraft";
			conditions = "(player getVariable ['faction','civ']) isEqualTo 'cop'";
			vehicles[] = {
				{"B_Heli_Light_01_F",0,""}
			};
		};
		class cop_boat {
			name = "Police Ships";
			conditions = "(player getVariable ['faction','civ']) isEqualTo 'cop'";
			vehicles[] = {
				{"C_Boat_Civil_01_police_F",0,""},
				{"B_SDV_01_F",0,""}
			};
		};
		class med_car {
			name = "Medic Vehicles";
			conditions = "(player getVariable ['faction','civ']) isEqualTo 'medic'";
			vehicles[] = {
				{"Jonzie_Ambulance",0,""}
			};
		};
		class med_air {
			name = "Medic Aircraft";
			conditions = "(player getVariable ['faction','civ']) isEqualTo 'medic'";
			vehicles[] = {
				{"B_Heli_Light_01_F",0,""}
			};
		};
	};
};
