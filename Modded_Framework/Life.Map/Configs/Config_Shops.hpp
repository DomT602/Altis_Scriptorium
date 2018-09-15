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
			conditions = "(license_gun isEqualTo 1)";
			items[] = {
				{"RH_g17",6500,3250,""}
			};
			mags[] = {
				{"RH_17Rnd_9x19_g17",125,60,""}
			};
		};

		class genstore {
			name = "General Store";
			conditions = "";
			items[] = {
				{"Chemlight_blue",100,50,""}
			};
			mags[] = {
			};
		};

		class patrol {
			name = "Patrol Supplies";
			conditions = "(player getVariable 'faction' isEqualTo 'cop')";
			items[] = {
				{"Binocular",100,-1,""}
			};
			mags[] = {
			};
		};


		class medic {
			name = "Medical Supplies";
			conditions = "player getVariable 'faction' isEqualTo 'medic'";
			items[] = {
			};
			mags[] = {};
		};
	};
	class Clothing {
		class cop {
			conditions = "player getVariable 'faction' isEqualTo 'cop'";
			uniforms[] = {
				{"D_Police_Cadet",0,"player getVariable ['cop_rank',0] isEqualTo 1"}
			};
			vests[] = {
				{"PoliceVest",0,""}
			};
			backpacks[] = {
				{"AM_PoliceBelt",0,""}
			};
			goggles[] = {
				{"G_Spectacles_Tinted",0,""}
			};
			headgear[] = {
				{"D_PatrolHat",0,"player getVariable 'department' isEqualTo 'High Command'"}
			};
		};
		class medic {
			conditions = "player getVariable 'faction' isEqualTo 'medic'";
			uniforms[] = {
					{"D_FireRescue_Uni_Probie",0,"player getVariable ['medic_rank',0] isEqualTo 1"}
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
			name = "Basic Car's";
			conditions = "";
			vehicles[] = {
				{"B_Quadbike_01_F",1000,""}
			};
		};
		class cop {
			name = "Police Vehicles";
			conditions = "player getVariable 'faction' isEqualTo 'cop'";
			vehicles[] = {
				{"B_Quadbike_01_F",0,""}
			};
		};
		class med {
			name = "Medic Vehicles";
			conditions = "player getVariable 'faction' isEqualTo 'medic'";
			vehicles[] = {
				{"Jonzie_Ambulance",0,""}
			};
		};
	};
};