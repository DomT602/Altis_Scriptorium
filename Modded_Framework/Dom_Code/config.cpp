class CfgPatches {
	class Dom_Code {
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		version = "1.0";
		requiredVersion = 1.0;
		requiredaddons[] = {"Dom_Server"};
	};
};

class CfgFunctions {
	class Systems {
		tag = "DT";
		#include "\Dom_Code\Vehicles\config.cpp"
		#include "\Dom_Code\Sync\config.cpp"
		#include "\Dom_Code\Police\config.cpp"
		#include "\Dom_Code\Phone\config.cpp"
		#include "\Dom_Code\Shops\config.cpp"
		#include "\Dom_Code\Medical\config.cpp"
		#include "\Dom_Code\Markers\config.cpp"
		#include "\Dom_Code\Interaction\config.cpp"
		#include "\Dom_Code\Functions\config.cpp"
		#include "\Dom_Code\Crafting\config.cpp"
		#include "\Dom_Code\Companies\config.cpp"
		#include "\Dom_Code\Civilian\config.cpp"
		#include "\Dom_Code\Buildings\config.cpp"
	};
};