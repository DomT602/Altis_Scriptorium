/*
Item shop configs work by:
	Price of house
	Max number of furniture items
	Type: 0 = house, 1 = garage
	Offset to spawn vehicles (only if type is 1)
	Directional offset to spawn vehicles (only if type is 1)
	Lighting position
*/

class Buildings {
	class Houses {
		class Land_i_House_Big_02_V1_F {
			price = 155000;
			maxFurniture = 100;
			type = 0;
		};

		class Land_i_House_Big_02_V2_F : Land_i_House_Big_02_V1_F{};
		class Land_i_House_Big_02_V3_F : Land_i_House_Big_02_V1_F{};

		class Land_i_House_Big_01_V1_F {
			price = 220000;
			maxFurniture = 100;
			type = 0;
		};

		class Land_i_House_Big_01_V2_F : Land_i_House_Big_01_V1_F{};
		class Land_i_House_Big_01_V3_F : Land_i_House_Big_01_V1_F{};

		class Land_i_House_Small_01_V1_F {
			price = 105000;
			maxFurniture = 100;
			type = 0;
		};

		class Land_i_House_Small_01_V2_F : Land_i_House_Small_01_V1_F{};
		class Land_i_House_Small_01_V3_F : Land_i_House_Small_01_V1_F{};

		class Land_i_House_Small_02_V1_F {
			price = 100050;
			maxFurniture = 100;
			type = 0;
		};

		class Land_i_House_Small_02_V2_F : Land_i_House_Small_02_V1_F{};
		class Land_i_House_Small_02_V3_F : Land_i_House_Small_02_V1_F{};

		class Land_i_House_Small_03_V1_F {
			price = 125000;
			maxFurniture = 100;
			type = 0;
		};

		class Land_i_House_Small_03_V3_F : Land_i_House_Small_03_V1_F{};

		class Land_i_Stone_HouseSmall_V1_F {
			price = 75000;
			maxFurniture = 100;
			type = 0;
		};

		class Land_i_Stone_HouseSmall_V2_F : Land_i_Stone_HouseSmall_V1_F{};
		class Land_i_Stone_HouseSmall_V3_F : Land_i_Stone_HouseSmall_V1_F{};

		class Land_GarageShelter_01_F {
			price = 8000;
			maxFurniture = 0;
			type = 1;
			garageSpawnPos[] = {0.241684,-5.72266,-1.46744};
			garageSpawnDir = 90;
		};

		class Land_HouseDoubleAL : Land_i_House_Big_01_V1_F {};
		class Land_HouseC_R : Land_i_House_Big_01_V1_F {};
		class Land_HouseB1 : Land_i_House_Big_01_V1_F {};
		class Land_HouseDoubleAL2 : Land_i_House_Big_01_V1_F {};
		class Land_HouseA1 : Land_i_House_Big_01_V1_F {};
	};

	class Shops {
		class Land_Shop_F {
			price = 1;
			maxItems = 30;
		};
	};
};
