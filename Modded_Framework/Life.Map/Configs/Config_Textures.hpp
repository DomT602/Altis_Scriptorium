/*
Texture with format {"nameoftexture",{"textures","anothertexture"},"conditions"}
If a vehicle has more then 1 hidden selection texture which needs changing, then put multiple textures in 2nd element
*/
class Textures {
	class Vehicle {
		class Default {
			textures[] = {};
		};

		class jonzie_car_base {
			textures[] = {
				{"Yellow",{"#(argb,8,8,3)color(0.6,0.3,0.01,1)"},"",0},
				{"Aqua",{"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"},"",100},
				{"Black",{"#(argb,8,8,3)color(0,0,0,1)"},"",0},
				{"Pink",{"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"},"",0},
				{"Purple",{"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"},"",0},
				{"Green",{"#(argb,8,8,3)color(0,1,0.25098,1)"},"",0},
				{"Light Green",{"#(argb,8,8,3)color(0,0.54902,0.137255,1)"},"",0},
				{"Navy Blue",{"#(argb,8,8,3)color(0,0,1,1)"},"",0}
			};
		};

		class B_Quadbike_01_F : jonzie_car_base {};

		class Jonzie_XB : jonzie_car_base {};
		class Jonzie_Mini_Cooper : jonzie_car_base {};
		class Jonzie_Ceed : jonzie_car_base {};
		class Jonzie_30CSL : jonzie_car_base {};
		class Jonzie_Transit : jonzie_car_base {};
		class Jonzie_Mini_Cooper_r_spec : jonzie_car_base {};
		class Jonzie_Raptor : jonzie_car_base {};
		class Jonzie_Escalade : jonzie_car_base {};
		class Jonzie_Viper : jonzie_car_base {};
		class Jonzie_Corolla : jonzie_car_base {};
		class Jonzie_Datsun_510 : jonzie_car_base {};
		class Jonzie_Datsun_Z432 : jonzie_car_base {};
		class Jonzie_Forklift : jonzie_car_base {};
		class Jonzie_Galant : jonzie_car_base {};
		class Jonzie_Quattroporte : jonzie_car_base {};
		class Jonzie_STI : jonzie_car_base {};
		class Jonzie_Superliner : jonzie_car_base {};
		class Jonzie_Tow_Truck : jonzie_car_base {};
		class Jonzie_VE : jonzie_car_base {};
		class Jonzie_Western : jonzie_car_base {};
		class Jonzie_Curtain : jonzie_car_base {};
		class Jonzie_Curtain_Roadtrain : jonzie_car_base {};
		class Jonzie_Flatbed : jonzie_car_base {};
		class Jonzie_Flatbed_Roadtrain : jonzie_car_base {};
		class Jonzie_Race_Trailer : jonzie_car_base {};

		class ivory_evox_marked {
			textures[] = {
				{"Patrol",{"\ivory_evox\data\evox_police.paa"},""}
			};
		};

		class B_Heli_Light_01_F {
			textures[] = {
				{"Patrol",{"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"},""}
			};
		};
		class C_Boat_Civil_01_police_F {
			textures[] = {};
		};
		class B_SDV_01_F {
			textures[] = {};
		};
	};
};

class Modifications {
	class car {
		rvmats[] = {
			{"Default","texture\path","",100},
			{"Matte","texture\path","",0}
		};
		plates[] = {
			{"Default","texture\path","",100},
			{"Emergency","texture\path","player getVariable ['faction',''] != 'civ'",0}
		};
		tint[] = {
			{"Default",0,"",100},
			{"10%",0.1,"",0}
		};
		wheelColour[] = {
			{"Default","(argb,8,8,3)color(0,0,0,1)","",100},
			{"Yellow","(argb,8,8,3)color(0.6,0.3,0.01,1)","",0},
			{"Special Colour","texture\path","",0}
		};
		proxies[] = {
			{"No spoiler",{},"",100},
			{"Spoiler",{},"player getVariable ['faction',''] != 'civ'",0}
		};
	};
};