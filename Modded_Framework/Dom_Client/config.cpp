

class BIS_AddonInfo
{
	author="Dom";
	timepacked="1497633736";
};
class CfgPatches
{
	class Dom_Client
	{
		version=0.1;
		units[]={};
		weapons[]=
		{
			"D_Phone"
		};
		requiredAddons[]=
		{
			"A3_Data_F",
			"A3_Soft_F",
			"A3_Soft_F_Offroad_01",
			"A3_Characters_F"
		};
	};
};

class CfgFunctions {
	class client {
		tag  = "client";
		class Functions {
			file = "\Dom_Client\Code";
			class buyLicense {};
			class initClothingShop {};
			class initGarage {};
			class initItemShop {};
			class initVehicleShop {};
			class robStore {};
			class storeVehicle {};
			class switchDispatch {};
			class switchDuty {};
			class switchJob {};
		};
	};
};

class cfgVehicles
{
	class Civilian_F;
	class C_man_1: Civilian_F
	{
		extCameraPosition[]={0.15000001,0,-2};
	};
};
class cfgWeapons
{
	class ItemRadio;
	class D_Phone: ItemRadio
	{
		displayName="Phone";
		descriptionShort="Phone";
		scope=2;
		scopeCurator=2;
		model="\mm_objects\iPhone5.p3d";
		picture="\mm_objects\images\iphone.paa";
		tf_prototype=1;
		tf_range=52000;
		tf_dialog="";
		tf_encryptionCode="tf_west_radio_code";
		tf_subtype="phone";
		tf_parent="D_Phone";
		tf_additional_channel=0;
		tf_dialogUpdate="call TFAR_fnc_updateSWDialogToChannel;";
	};
	class D_Phone_1: D_Phone
	{
		displayName="Phone 1";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_2: D_Phone
	{
		displayName="Phone 2";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_3: D_Phone
	{
		displayName="Phone 3";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_4: D_Phone
	{
		displayName="Phone 4";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_5: D_Phone
	{
		displayName="Phone 5";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_6: D_Phone
	{
		displayName="Phone 6";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_7: D_Phone
	{
		displayName="Phone 7";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_8: D_Phone
	{
		displayName="Phone 8";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_9: D_Phone
	{
		displayName="Phone 9";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_10: D_Phone
	{
		displayName="Phone 10";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_11: D_Phone
	{
		displayName="Phone 11";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_12: D_Phone
	{
		displayName="Phone 12";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_13: D_Phone
	{
		displayName="Phone 13";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_14: D_Phone
	{
		displayName="Phone 14";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_15: D_Phone
	{
		displayName="Phone 15";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_16: D_Phone
	{
		displayName="Phone 16";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_17: D_Phone
	{
		displayName="Phone 17";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_18: D_Phone
	{
		displayName="Phone 18";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_19: D_Phone
	{
		displayName="Phone 19";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_20: D_Phone
	{
		displayName="Phone 20";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_21: D_Phone
	{
		displayName="Phone 21";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_22: D_Phone
	{
		displayName="Phone 22";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_23: D_Phone
	{
		displayName="Phone 23";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_24: D_Phone
	{
		displayName="Phone 24";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_25: D_Phone
	{
		displayName="Phone 25";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_26: D_Phone
	{
		displayName="Phone 26";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_27: D_Phone
	{
		displayName="Phone 27";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_28: D_Phone
	{
		displayName="Phone 28";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_29: D_Phone
	{
		displayName="Phone 29";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_30: D_Phone
	{
		displayName="Phone 30";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_31: D_Phone
	{
		displayName="Phone 31";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_32: D_Phone
	{
		displayName="Phone 32";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_33: D_Phone
	{
		displayName="Phone 33";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_34: D_Phone
	{
		displayName="Phone 34";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_35: D_Phone
	{
		displayName="Phone 35";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_36: D_Phone
	{
		displayName="Phone 36";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_37: D_Phone
	{
		displayName="Phone 37";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_38: D_Phone
	{
		displayName="Phone 38";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_39: D_Phone
	{
		displayName="Phone 39";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_40: D_Phone
	{
		displayName="Phone 40";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_41: D_Phone
	{
		displayName="Phone 41";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_42: D_Phone
	{
		displayName="Phone 42";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_43: D_Phone
	{
		displayName="Phone 43";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_44: D_Phone
	{
		displayName="Phone 44";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_45: D_Phone
	{
		displayName="Phone 45";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_46: D_Phone
	{
		displayName="Phone 46";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_47: D_Phone
	{
		displayName="Phone 47";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_48: D_Phone
	{
		displayName="Phone 48";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_49: D_Phone
	{
		displayName="Phone 49";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_50: D_Phone
	{
		displayName="Phone 50";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_51: D_Phone
	{
		displayName="Phone 51";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_52: D_Phone
	{
		displayName="Phone 52";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_53: D_Phone
	{
		displayName="Phone 53";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_54: D_Phone
	{
		displayName="Phone 54";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_55: D_Phone
	{
		displayName="Phone 55";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_56: D_Phone
	{
		displayName="Phone 56";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_57: D_Phone
	{
		displayName="Phone 57";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_58: D_Phone
	{
		displayName="Phone 58";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_59: D_Phone
	{
		displayName="Phone 59";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_60: D_Phone
	{
		displayName="Phone 60";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_61: D_Phone
	{
		displayName="Phone 61";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_62: D_Phone
	{
		displayName="Phone 62";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_63: D_Phone
	{
		displayName="Phone 63";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_64: D_Phone
	{
		displayName="Phone 64";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_65: D_Phone
	{
		displayName="Phone 65";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_66: D_Phone
	{
		displayName="Phone 66";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_67: D_Phone
	{
		displayName="Phone 67";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_68: D_Phone
	{
		displayName="Phone 68";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_69: D_Phone
	{
		displayName="Phone 69";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_70: D_Phone
	{
		displayName="Phone 70";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_71: D_Phone
	{
		displayName="Phone 71";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_72: D_Phone
	{
		displayName="Phone 72";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_73: D_Phone
	{
		displayName="Phone 73";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_74: D_Phone
	{
		displayName="Phone 74";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_75: D_Phone
	{
		displayName="Phone 75";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_76: D_Phone
	{
		displayName="Phone 76";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_77: D_Phone
	{
		displayName="Phone 77";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_78: D_Phone
	{
		displayName="Phone 78";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_79: D_Phone
	{
		displayName="Phone 79";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_80: D_Phone
	{
		displayName="Phone 80";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_81: D_Phone
	{
		displayName="Phone 81";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_82: D_Phone
	{
		displayName="Phone 82";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_83: D_Phone
	{
		displayName="Phone 83";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_84: D_Phone
	{
		displayName="Phone 84";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_85: D_Phone
	{
		displayName="Phone 85";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_86: D_Phone
	{
		displayName="Phone 86";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_87: D_Phone
	{
		displayName="Phone 87";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_88: D_Phone
	{
		displayName="Phone 88";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_89: D_Phone
	{
		displayName="Phone 89";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_90: D_Phone
	{
		displayName="Phone 90";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_91: D_Phone
	{
		displayName="Phone 91";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_92: D_Phone
	{
		displayName="Phone 92";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_93: D_Phone
	{
		displayName="Phone 93";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_94: D_Phone
	{
		displayName="Phone 94";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_95: D_Phone
	{
		displayName="Phone 95";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_96: D_Phone
	{
		displayName="Phone 96";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_97: D_Phone
	{
		displayName="Phone 97";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_98: D_Phone
	{
		displayName="Phone 98";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_99: D_Phone
	{
		displayName="Phone 99";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_100: D_Phone
	{
		displayName="Phone 100";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_101: D_Phone
	{
		displayName="Phone 101";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_102: D_Phone
	{
		displayName="Phone 102";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_103: D_Phone
	{
		displayName="Phone 103";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_104: D_Phone
	{
		displayName="Phone 104";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_105: D_Phone
	{
		displayName="Phone 105";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_106: D_Phone
	{
		displayName="Phone 106";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_107: D_Phone
	{
		displayName="Phone 107";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_108: D_Phone
	{
		displayName="Phone 108";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_109: D_Phone
	{
		displayName="Phone 109";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_110: D_Phone
	{
		displayName="Phone 110";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_111: D_Phone
	{
		displayName="Phone 111";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_112: D_Phone
	{
		displayName="Phone 112";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_113: D_Phone
	{
		displayName="Phone 113";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_114: D_Phone
	{
		displayName="Phone 114";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_115: D_Phone
	{
		displayName="Phone 115";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_116: D_Phone
	{
		displayName="Phone 116";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_117: D_Phone
	{
		displayName="Phone 117";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_118: D_Phone
	{
		displayName="Phone 118";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_119: D_Phone
	{
		displayName="Phone 119";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_120: D_Phone
	{
		displayName="Phone 120";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_121: D_Phone
	{
		displayName="Phone 121";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_122: D_Phone
	{
		displayName="Phone 122";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_123: D_Phone
	{
		displayName="Phone 123";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_124: D_Phone
	{
		displayName="Phone 124";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_125: D_Phone
	{
		displayName="Phone 125";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_126: D_Phone
	{
		displayName="Phone 126";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_127: D_Phone
	{
		displayName="Phone 127";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_128: D_Phone
	{
		displayName="Phone 128";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_129: D_Phone
	{
		displayName="Phone 129";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_130: D_Phone
	{
		displayName="Phone 130";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_131: D_Phone
	{
		displayName="Phone 131";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_132: D_Phone
	{
		displayName="Phone 132";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_133: D_Phone
	{
		displayName="Phone 133";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_134: D_Phone
	{
		displayName="Phone 134";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_135: D_Phone
	{
		displayName="Phone 135";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_136: D_Phone
	{
		displayName="Phone 136";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_137: D_Phone
	{
		displayName="Phone 137";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_138: D_Phone
	{
		displayName="Phone 138";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_139: D_Phone
	{
		displayName="Phone 139";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_140: D_Phone
	{
		displayName="Phone 140";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_141: D_Phone
	{
		displayName="Phone 141";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_142: D_Phone
	{
		displayName="Phone 142";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_143: D_Phone
	{
		displayName="Phone 143";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_144: D_Phone
	{
		displayName="Phone 144";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_145: D_Phone
	{
		displayName="Phone 145";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_146: D_Phone
	{
		displayName="Phone 146";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_147: D_Phone
	{
		displayName="Phone 147";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_148: D_Phone
	{
		displayName="Phone 148";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_149: D_Phone
	{
		displayName="Phone 149";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_150: D_Phone
	{
		displayName="Phone 150";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_151: D_Phone
	{
		displayName="Phone 151";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_152: D_Phone
	{
		displayName="Phone 152";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_153: D_Phone
	{
		displayName="Phone 153";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_154: D_Phone
	{
		displayName="Phone 154";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_155: D_Phone
	{
		displayName="Phone 155";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_156: D_Phone
	{
		displayName="Phone 156";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_157: D_Phone
	{
		displayName="Phone 157";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_158: D_Phone
	{
		displayName="Phone 158";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_159: D_Phone
	{
		displayName="Phone 159";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_160: D_Phone
	{
		displayName="Phone 160";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_161: D_Phone
	{
		displayName="Phone 161";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_162: D_Phone
	{
		displayName="Phone 162";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_163: D_Phone
	{
		displayName="Phone 163";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_164: D_Phone
	{
		displayName="Phone 164";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_165: D_Phone
	{
		displayName="Phone 165";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_166: D_Phone
	{
		displayName="Phone 166";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_167: D_Phone
	{
		displayName="Phone 167";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_168: D_Phone
	{
		displayName="Phone 168";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_169: D_Phone
	{
		displayName="Phone 169";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_170: D_Phone
	{
		displayName="Phone 170";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_171: D_Phone
	{
		displayName="Phone 171";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_172: D_Phone
	{
		displayName="Phone 172";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_173: D_Phone
	{
		displayName="Phone 173";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_174: D_Phone
	{
		displayName="Phone 174";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_175: D_Phone
	{
		displayName="Phone 175";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_176: D_Phone
	{
		displayName="Phone 176";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_177: D_Phone
	{
		displayName="Phone 177";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_178: D_Phone
	{
		displayName="Phone 178";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_179: D_Phone
	{
		displayName="Phone 179";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_180: D_Phone
	{
		displayName="Phone 180";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_181: D_Phone
	{
		displayName="Phone 181";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_182: D_Phone
	{
		displayName="Phone 182";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_183: D_Phone
	{
		displayName="Phone 183";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_184: D_Phone
	{
		displayName="Phone 184";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_185: D_Phone
	{
		displayName="Phone 185";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_186: D_Phone
	{
		displayName="Phone 186";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_187: D_Phone
	{
		displayName="Phone 187";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_188: D_Phone
	{
		displayName="Phone 188";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_189: D_Phone
	{
		displayName="Phone 189";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_190: D_Phone
	{
		displayName="Phone 190";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_191: D_Phone
	{
		displayName="Phone 191";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_192: D_Phone
	{
		displayName="Phone 192";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_193: D_Phone
	{
		displayName="Phone 193";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_194: D_Phone
	{
		displayName="Phone 194";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_195: D_Phone
	{
		displayName="Phone 195";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_196: D_Phone
	{
		displayName="Phone 196";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_197: D_Phone
	{
		displayName="Phone 197";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_198: D_Phone
	{
		displayName="Phone 198";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_199: D_Phone
	{
		displayName="Phone 199";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_200: D_Phone
	{
		displayName="Phone 200";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_201: D_Phone
	{
		displayName="Phone 201";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_202: D_Phone
	{
		displayName="Phone 202";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_203: D_Phone
	{
		displayName="Phone 203";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_204: D_Phone
	{
		displayName="Phone 204";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_205: D_Phone
	{
		displayName="Phone 205";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_206: D_Phone
	{
		displayName="Phone 206";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_207: D_Phone
	{
		displayName="Phone 207";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_208: D_Phone
	{
		displayName="Phone 208";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_209: D_Phone
	{
		displayName="Phone 209";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_210: D_Phone
	{
		displayName="Phone 210";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_211: D_Phone
	{
		displayName="Phone 211";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_212: D_Phone
	{
		displayName="Phone 212";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_213: D_Phone
	{
		displayName="Phone 213";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_214: D_Phone
	{
		displayName="Phone 214";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_215: D_Phone
	{
		displayName="Phone 215";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_216: D_Phone
	{
		displayName="Phone 216";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_217: D_Phone
	{
		displayName="Phone 217";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_218: D_Phone
	{
		displayName="Phone 218";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_219: D_Phone
	{
		displayName="Phone 219";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_220: D_Phone
	{
		displayName="Phone 220";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_221: D_Phone
	{
		displayName="Phone 221";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_222: D_Phone
	{
		displayName="Phone 222";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_223: D_Phone
	{
		displayName="Phone 223";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_224: D_Phone
	{
		displayName="Phone 224";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_225: D_Phone
	{
		displayName="Phone 225";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_226: D_Phone
	{
		displayName="Phone 226";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_227: D_Phone
	{
		displayName="Phone 227";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_228: D_Phone
	{
		displayName="Phone 228";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_229: D_Phone
	{
		displayName="Phone 229";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_230: D_Phone
	{
		displayName="Phone 230";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_231: D_Phone
	{
		displayName="Phone 231";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_232: D_Phone
	{
		displayName="Phone 232";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_233: D_Phone
	{
		displayName="Phone 233";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_234: D_Phone
	{
		displayName="Phone 234";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_235: D_Phone
	{
		displayName="Phone 235";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_236: D_Phone
	{
		displayName="Phone 236";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_237: D_Phone
	{
		displayName="Phone 237";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_238: D_Phone
	{
		displayName="Phone 238";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_239: D_Phone
	{
		displayName="Phone 239";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_240: D_Phone
	{
		displayName="Phone 240";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_241: D_Phone
	{
		displayName="Phone 241";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_242: D_Phone
	{
		displayName="Phone 242";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_243: D_Phone
	{
		displayName="Phone 243";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_244: D_Phone
	{
		displayName="Phone 244";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_245: D_Phone
	{
		displayName="Phone 245";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_246: D_Phone
	{
		displayName="Phone 246";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_247: D_Phone
	{
		displayName="Phone 247";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_248: D_Phone
	{
		displayName="Phone 248";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_249: D_Phone
	{
		displayName="Phone 249";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_250: D_Phone
	{
		displayName="Phone 250";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_251: D_Phone
	{
		displayName="Phone 251";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_252: D_Phone
	{
		displayName="Phone 252";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_253: D_Phone
	{
		displayName="Phone 253";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_254: D_Phone
	{
		displayName="Phone 254";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_255: D_Phone
	{
		displayName="Phone 255";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_256: D_Phone
	{
		displayName="Phone 256";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_257: D_Phone
	{
		displayName="Phone 257";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_258: D_Phone
	{
		displayName="Phone 258";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_259: D_Phone
	{
		displayName="Phone 259";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_260: D_Phone
	{
		displayName="Phone 260";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_261: D_Phone
	{
		displayName="Phone 261";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_262: D_Phone
	{
		displayName="Phone 262";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_263: D_Phone
	{
		displayName="Phone 263";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_264: D_Phone
	{
		displayName="Phone 264";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_265: D_Phone
	{
		displayName="Phone 265";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_266: D_Phone
	{
		displayName="Phone 266";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_267: D_Phone
	{
		displayName="Phone 267";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_268: D_Phone
	{
		displayName="Phone 268";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_269: D_Phone
	{
		displayName="Phone 269";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_270: D_Phone
	{
		displayName="Phone 270";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_271: D_Phone
	{
		displayName="Phone 271";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_272: D_Phone
	{
		displayName="Phone 272";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_273: D_Phone
	{
		displayName="Phone 273";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_274: D_Phone
	{
		displayName="Phone 274";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_275: D_Phone
	{
		displayName="Phone 275";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_276: D_Phone
	{
		displayName="Phone 276";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_277: D_Phone
	{
		displayName="Phone 277";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_278: D_Phone
	{
		displayName="Phone 278";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_279: D_Phone
	{
		displayName="Phone 279";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_280: D_Phone
	{
		displayName="Phone 280";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_281: D_Phone
	{
		displayName="Phone 281";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_282: D_Phone
	{
		displayName="Phone 282";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_283: D_Phone
	{
		displayName="Phone 283";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_284: D_Phone
	{
		displayName="Phone 284";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_285: D_Phone
	{
		displayName="Phone 285";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_286: D_Phone
	{
		displayName="Phone 286";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_287: D_Phone
	{
		displayName="Phone 287";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_288: D_Phone
	{
		displayName="Phone 288";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_289: D_Phone
	{
		displayName="Phone 289";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_290: D_Phone
	{
		displayName="Phone 290";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_291: D_Phone
	{
		displayName="Phone 291";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_292: D_Phone
	{
		displayName="Phone 292";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_293: D_Phone
	{
		displayName="Phone 293";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_294: D_Phone
	{
		displayName="Phone 294";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_295: D_Phone
	{
		displayName="Phone 295";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_296: D_Phone
	{
		displayName="Phone 296";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_297: D_Phone
	{
		displayName="Phone 297";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_298: D_Phone
	{
		displayName="Phone 298";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_299: D_Phone
	{
		displayName="Phone 299";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_300: D_Phone
	{
		displayName="Phone 300";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_301: D_Phone
	{
		displayName="Phone 301";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_302: D_Phone
	{
		displayName="Phone 302";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_303: D_Phone
	{
		displayName="Phone 303";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_304: D_Phone
	{
		displayName="Phone 304";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_305: D_Phone
	{
		displayName="Phone 305";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_306: D_Phone
	{
		displayName="Phone 306";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_307: D_Phone
	{
		displayName="Phone 307";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_308: D_Phone
	{
		displayName="Phone 308";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_309: D_Phone
	{
		displayName="Phone 309";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_310: D_Phone
	{
		displayName="Phone 310";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_311: D_Phone
	{
		displayName="Phone 311";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_312: D_Phone
	{
		displayName="Phone 312";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_313: D_Phone
	{
		displayName="Phone 313";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_314: D_Phone
	{
		displayName="Phone 314";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_315: D_Phone
	{
		displayName="Phone 315";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_316: D_Phone
	{
		displayName="Phone 316";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_317: D_Phone
	{
		displayName="Phone 317";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_318: D_Phone
	{
		displayName="Phone 318";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_319: D_Phone
	{
		displayName="Phone 319";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_320: D_Phone
	{
		displayName="Phone 320";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_321: D_Phone
	{
		displayName="Phone 321";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_322: D_Phone
	{
		displayName="Phone 322";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_323: D_Phone
	{
		displayName="Phone 323";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_324: D_Phone
	{
		displayName="Phone 324";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_325: D_Phone
	{
		displayName="Phone 325";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_326: D_Phone
	{
		displayName="Phone 326";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_327: D_Phone
	{
		displayName="Phone 327";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_328: D_Phone
	{
		displayName="Phone 328";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_329: D_Phone
	{
		displayName="Phone 329";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_330: D_Phone
	{
		displayName="Phone 330";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_331: D_Phone
	{
		displayName="Phone 331";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_332: D_Phone
	{
		displayName="Phone 332";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_333: D_Phone
	{
		displayName="Phone 333";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_334: D_Phone
	{
		displayName="Phone 334";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_335: D_Phone
	{
		displayName="Phone 335";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_336: D_Phone
	{
		displayName="Phone 336";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_337: D_Phone
	{
		displayName="Phone 337";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_338: D_Phone
	{
		displayName="Phone 338";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_339: D_Phone
	{
		displayName="Phone 339";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_340: D_Phone
	{
		displayName="Phone 340";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_341: D_Phone
	{
		displayName="Phone 341";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_342: D_Phone
	{
		displayName="Phone 342";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_343: D_Phone
	{
		displayName="Phone 343";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_344: D_Phone
	{
		displayName="Phone 344";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_345: D_Phone
	{
		displayName="Phone 345";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_346: D_Phone
	{
		displayName="Phone 346";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_347: D_Phone
	{
		displayName="Phone 347";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_348: D_Phone
	{
		displayName="Phone 348";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_349: D_Phone
	{
		displayName="Phone 349";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_350: D_Phone
	{
		displayName="Phone 350";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_351: D_Phone
	{
		displayName="Phone 351";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_352: D_Phone
	{
		displayName="Phone 352";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_353: D_Phone
	{
		displayName="Phone 353";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_354: D_Phone
	{
		displayName="Phone 354";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_355: D_Phone
	{
		displayName="Phone 355";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_356: D_Phone
	{
		displayName="Phone 356";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_357: D_Phone
	{
		displayName="Phone 357";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_358: D_Phone
	{
		displayName="Phone 358";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_359: D_Phone
	{
		displayName="Phone 359";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_360: D_Phone
	{
		displayName="Phone 360";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_361: D_Phone
	{
		displayName="Phone 361";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_362: D_Phone
	{
		displayName="Phone 362";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_363: D_Phone
	{
		displayName="Phone 363";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_364: D_Phone
	{
		displayName="Phone 364";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_365: D_Phone
	{
		displayName="Phone 365";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_366: D_Phone
	{
		displayName="Phone 366";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_367: D_Phone
	{
		displayName="Phone 367";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_368: D_Phone
	{
		displayName="Phone 368";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_369: D_Phone
	{
		displayName="Phone 369";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_370: D_Phone
	{
		displayName="Phone 370";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_371: D_Phone
	{
		displayName="Phone 371";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_372: D_Phone
	{
		displayName="Phone 372";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_373: D_Phone
	{
		displayName="Phone 373";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_374: D_Phone
	{
		displayName="Phone 374";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_375: D_Phone
	{
		displayName="Phone 375";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_376: D_Phone
	{
		displayName="Phone 376";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_377: D_Phone
	{
		displayName="Phone 377";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_378: D_Phone
	{
		displayName="Phone 378";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_379: D_Phone
	{
		displayName="Phone 379";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_380: D_Phone
	{
		displayName="Phone 380";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_381: D_Phone
	{
		displayName="Phone 381";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_382: D_Phone
	{
		displayName="Phone 382";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_383: D_Phone
	{
		displayName="Phone 383";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_384: D_Phone
	{
		displayName="Phone 384";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_385: D_Phone
	{
		displayName="Phone 385";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_386: D_Phone
	{
		displayName="Phone 386";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_387: D_Phone
	{
		displayName="Phone 387";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_388: D_Phone
	{
		displayName="Phone 388";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_389: D_Phone
	{
		displayName="Phone 389";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_390: D_Phone
	{
		displayName="Phone 390";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_391: D_Phone
	{
		displayName="Phone 391";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_392: D_Phone
	{
		displayName="Phone 392";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_393: D_Phone
	{
		displayName="Phone 393";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_394: D_Phone
	{
		displayName="Phone 394";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_395: D_Phone
	{
		displayName="Phone 395";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_396: D_Phone
	{
		displayName="Phone 396";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_397: D_Phone
	{
		displayName="Phone 397";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_398: D_Phone
	{
		displayName="Phone 398";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_399: D_Phone
	{
		displayName="Phone 399";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_400: D_Phone
	{
		displayName="Phone 400";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_401: D_Phone
	{
		displayName="Phone 401";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_402: D_Phone
	{
		displayName="Phone 402";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_403: D_Phone
	{
		displayName="Phone 403";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_404: D_Phone
	{
		displayName="Phone 404";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_405: D_Phone
	{
		displayName="Phone 405";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_406: D_Phone
	{
		displayName="Phone 406";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_407: D_Phone
	{
		displayName="Phone 407";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_408: D_Phone
	{
		displayName="Phone 408";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_409: D_Phone
	{
		displayName="Phone 409";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_410: D_Phone
	{
		displayName="Phone 410";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_411: D_Phone
	{
		displayName="Phone 411";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_412: D_Phone
	{
		displayName="Phone 412";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_413: D_Phone
	{
		displayName="Phone 413";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_414: D_Phone
	{
		displayName="Phone 414";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_415: D_Phone
	{
		displayName="Phone 415";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_416: D_Phone
	{
		displayName="Phone 416";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_417: D_Phone
	{
		displayName="Phone 417";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_418: D_Phone
	{
		displayName="Phone 418";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_419: D_Phone
	{
		displayName="Phone 419";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_420: D_Phone
	{
		displayName="Phone 420";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_421: D_Phone
	{
		displayName="Phone 421";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_422: D_Phone
	{
		displayName="Phone 422";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_423: D_Phone
	{
		displayName="Phone 423";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_424: D_Phone
	{
		displayName="Phone 424";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_425: D_Phone
	{
		displayName="Phone 425";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_426: D_Phone
	{
		displayName="Phone 426";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_427: D_Phone
	{
		displayName="Phone 427";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_428: D_Phone
	{
		displayName="Phone 428";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_429: D_Phone
	{
		displayName="Phone 429";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_430: D_Phone
	{
		displayName="Phone 430";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_431: D_Phone
	{
		displayName="Phone 431";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_432: D_Phone
	{
		displayName="Phone 432";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_433: D_Phone
	{
		displayName="Phone 433";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_434: D_Phone
	{
		displayName="Phone 434";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_435: D_Phone
	{
		displayName="Phone 435";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_436: D_Phone
	{
		displayName="Phone 436";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_437: D_Phone
	{
		displayName="Phone 437";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_438: D_Phone
	{
		displayName="Phone 438";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_439: D_Phone
	{
		displayName="Phone 439";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_440: D_Phone
	{
		displayName="Phone 440";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_441: D_Phone
	{
		displayName="Phone 441";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_442: D_Phone
	{
		displayName="Phone 442";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_443: D_Phone
	{
		displayName="Phone 443";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_444: D_Phone
	{
		displayName="Phone 444";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_445: D_Phone
	{
		displayName="Phone 445";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_446: D_Phone
	{
		displayName="Phone 446";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_447: D_Phone
	{
		displayName="Phone 447";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_448: D_Phone
	{
		displayName="Phone 448";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_449: D_Phone
	{
		displayName="Phone 449";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_450: D_Phone
	{
		displayName="Phone 450";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_451: D_Phone
	{
		displayName="Phone 451";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_452: D_Phone
	{
		displayName="Phone 452";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_453: D_Phone
	{
		displayName="Phone 453";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_454: D_Phone
	{
		displayName="Phone 454";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_455: D_Phone
	{
		displayName="Phone 455";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_456: D_Phone
	{
		displayName="Phone 456";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_457: D_Phone
	{
		displayName="Phone 457";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_458: D_Phone
	{
		displayName="Phone 458";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_459: D_Phone
	{
		displayName="Phone 459";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_460: D_Phone
	{
		displayName="Phone 460";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_461: D_Phone
	{
		displayName="Phone 461";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_462: D_Phone
	{
		displayName="Phone 462";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_463: D_Phone
	{
		displayName="Phone 463";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_464: D_Phone
	{
		displayName="Phone 464";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_465: D_Phone
	{
		displayName="Phone 465";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_466: D_Phone
	{
		displayName="Phone 466";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_467: D_Phone
	{
		displayName="Phone 467";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_468: D_Phone
	{
		displayName="Phone 468";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_469: D_Phone
	{
		displayName="Phone 469";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_470: D_Phone
	{
		displayName="Phone 470";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_471: D_Phone
	{
		displayName="Phone 471";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_472: D_Phone
	{
		displayName="Phone 472";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_473: D_Phone
	{
		displayName="Phone 473";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_474: D_Phone
	{
		displayName="Phone 474";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_475: D_Phone
	{
		displayName="Phone 475";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_476: D_Phone
	{
		displayName="Phone 476";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_477: D_Phone
	{
		displayName="Phone 477";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_478: D_Phone
	{
		displayName="Phone 478";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_479: D_Phone
	{
		displayName="Phone 479";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_480: D_Phone
	{
		displayName="Phone 480";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_481: D_Phone
	{
		displayName="Phone 481";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_482: D_Phone
	{
		displayName="Phone 482";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_483: D_Phone
	{
		displayName="Phone 483";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_484: D_Phone
	{
		displayName="Phone 484";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_485: D_Phone
	{
		displayName="Phone 485";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_486: D_Phone
	{
		displayName="Phone 486";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_487: D_Phone
	{
		displayName="Phone 487";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_488: D_Phone
	{
		displayName="Phone 488";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_489: D_Phone
	{
		displayName="Phone 489";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_490: D_Phone
	{
		displayName="Phone 490";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_491: D_Phone
	{
		displayName="Phone 491";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_492: D_Phone
	{
		displayName="Phone 492";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_493: D_Phone
	{
		displayName="Phone 493";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_494: D_Phone
	{
		displayName="Phone 494";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_495: D_Phone
	{
		displayName="Phone 495";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_496: D_Phone
	{
		displayName="Phone 496";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_497: D_Phone
	{
		displayName="Phone 497";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_498: D_Phone
	{
		displayName="Phone 498";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_499: D_Phone
	{
		displayName="Phone 499";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_500: D_Phone
	{
		displayName="Phone 500";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_501: D_Phone
	{
		displayName="Phone 501";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_502: D_Phone
	{
		displayName="Phone 502";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_503: D_Phone
	{
		displayName="Phone 503";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_504: D_Phone
	{
		displayName="Phone 504";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_505: D_Phone
	{
		displayName="Phone 505";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_506: D_Phone
	{
		displayName="Phone 506";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_507: D_Phone
	{
		displayName="Phone 507";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_508: D_Phone
	{
		displayName="Phone 508";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_509: D_Phone
	{
		displayName="Phone 509";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_510: D_Phone
	{
		displayName="Phone 510";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_511: D_Phone
	{
		displayName="Phone 511";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_512: D_Phone
	{
		displayName="Phone 512";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_513: D_Phone
	{
		displayName="Phone 513";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_514: D_Phone
	{
		displayName="Phone 514";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_515: D_Phone
	{
		displayName="Phone 515";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_516: D_Phone
	{
		displayName="Phone 516";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_517: D_Phone
	{
		displayName="Phone 517";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_518: D_Phone
	{
		displayName="Phone 518";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_519: D_Phone
	{
		displayName="Phone 519";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_520: D_Phone
	{
		displayName="Phone 520";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_521: D_Phone
	{
		displayName="Phone 521";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_522: D_Phone
	{
		displayName="Phone 522";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_523: D_Phone
	{
		displayName="Phone 523";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_524: D_Phone
	{
		displayName="Phone 524";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_525: D_Phone
	{
		displayName="Phone 525";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_526: D_Phone
	{
		displayName="Phone 526";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_527: D_Phone
	{
		displayName="Phone 527";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_528: D_Phone
	{
		displayName="Phone 528";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_529: D_Phone
	{
		displayName="Phone 529";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_530: D_Phone
	{
		displayName="Phone 530";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_531: D_Phone
	{
		displayName="Phone 531";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_532: D_Phone
	{
		displayName="Phone 532";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_533: D_Phone
	{
		displayName="Phone 533";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_534: D_Phone
	{
		displayName="Phone 534";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_535: D_Phone
	{
		displayName="Phone 535";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_536: D_Phone
	{
		displayName="Phone 536";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_537: D_Phone
	{
		displayName="Phone 537";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_538: D_Phone
	{
		displayName="Phone 538";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_539: D_Phone
	{
		displayName="Phone 539";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_540: D_Phone
	{
		displayName="Phone 540";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_541: D_Phone
	{
		displayName="Phone 541";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_542: D_Phone
	{
		displayName="Phone 542";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_543: D_Phone
	{
		displayName="Phone 543";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_544: D_Phone
	{
		displayName="Phone 544";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_545: D_Phone
	{
		displayName="Phone 545";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_546: D_Phone
	{
		displayName="Phone 546";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_547: D_Phone
	{
		displayName="Phone 547";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_548: D_Phone
	{
		displayName="Phone 548";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_549: D_Phone
	{
		displayName="Phone 549";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_550: D_Phone
	{
		displayName="Phone 550";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_551: D_Phone
	{
		displayName="Phone 551";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_552: D_Phone
	{
		displayName="Phone 552";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_553: D_Phone
	{
		displayName="Phone 553";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_554: D_Phone
	{
		displayName="Phone 554";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_555: D_Phone
	{
		displayName="Phone 555";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_556: D_Phone
	{
		displayName="Phone 556";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_557: D_Phone
	{
		displayName="Phone 557";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_558: D_Phone
	{
		displayName="Phone 558";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_559: D_Phone
	{
		displayName="Phone 559";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_560: D_Phone
	{
		displayName="Phone 560";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_561: D_Phone
	{
		displayName="Phone 561";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_562: D_Phone
	{
		displayName="Phone 562";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_563: D_Phone
	{
		displayName="Phone 563";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_564: D_Phone
	{
		displayName="Phone 564";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_565: D_Phone
	{
		displayName="Phone 565";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_566: D_Phone
	{
		displayName="Phone 566";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_567: D_Phone
	{
		displayName="Phone 567";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_568: D_Phone
	{
		displayName="Phone 568";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_569: D_Phone
	{
		displayName="Phone 569";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_570: D_Phone
	{
		displayName="Phone 570";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_571: D_Phone
	{
		displayName="Phone 571";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_572: D_Phone
	{
		displayName="Phone 572";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_573: D_Phone
	{
		displayName="Phone 573";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_574: D_Phone
	{
		displayName="Phone 574";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_575: D_Phone
	{
		displayName="Phone 575";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_576: D_Phone
	{
		displayName="Phone 576";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_577: D_Phone
	{
		displayName="Phone 577";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_578: D_Phone
	{
		displayName="Phone 578";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_579: D_Phone
	{
		displayName="Phone 579";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_580: D_Phone
	{
		displayName="Phone 580";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_581: D_Phone
	{
		displayName="Phone 581";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_582: D_Phone
	{
		displayName="Phone 582";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_583: D_Phone
	{
		displayName="Phone 583";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_584: D_Phone
	{
		displayName="Phone 584";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_585: D_Phone
	{
		displayName="Phone 585";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_586: D_Phone
	{
		displayName="Phone 586";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_587: D_Phone
	{
		displayName="Phone 587";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_588: D_Phone
	{
		displayName="Phone 588";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_589: D_Phone
	{
		displayName="Phone 589";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_590: D_Phone
	{
		displayName="Phone 590";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_591: D_Phone
	{
		displayName="Phone 591";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_592: D_Phone
	{
		displayName="Phone 592";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_593: D_Phone
	{
		displayName="Phone 593";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_594: D_Phone
	{
		displayName="Phone 594";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_595: D_Phone
	{
		displayName="Phone 595";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_596: D_Phone
	{
		displayName="Phone 596";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_597: D_Phone
	{
		displayName="Phone 597";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_598: D_Phone
	{
		displayName="Phone 598";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_599: D_Phone
	{
		displayName="Phone 599";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_600: D_Phone
	{
		displayName="Phone 600";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_601: D_Phone
	{
		displayName="Phone 601";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_602: D_Phone
	{
		displayName="Phone 602";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_603: D_Phone
	{
		displayName="Phone 603";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_604: D_Phone
	{
		displayName="Phone 604";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_605: D_Phone
	{
		displayName="Phone 605";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_606: D_Phone
	{
		displayName="Phone 606";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_607: D_Phone
	{
		displayName="Phone 607";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_608: D_Phone
	{
		displayName="Phone 608";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_609: D_Phone
	{
		displayName="Phone 609";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_610: D_Phone
	{
		displayName="Phone 610";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_611: D_Phone
	{
		displayName="Phone 611";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_612: D_Phone
	{
		displayName="Phone 612";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_613: D_Phone
	{
		displayName="Phone 613";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_614: D_Phone
	{
		displayName="Phone 614";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_615: D_Phone
	{
		displayName="Phone 615";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_616: D_Phone
	{
		displayName="Phone 616";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_617: D_Phone
	{
		displayName="Phone 617";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_618: D_Phone
	{
		displayName="Phone 618";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_619: D_Phone
	{
		displayName="Phone 619";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_620: D_Phone
	{
		displayName="Phone 620";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_621: D_Phone
	{
		displayName="Phone 621";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_622: D_Phone
	{
		displayName="Phone 622";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_623: D_Phone
	{
		displayName="Phone 623";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_624: D_Phone
	{
		displayName="Phone 624";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_625: D_Phone
	{
		displayName="Phone 625";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_626: D_Phone
	{
		displayName="Phone 626";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_627: D_Phone
	{
		displayName="Phone 627";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_628: D_Phone
	{
		displayName="Phone 628";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_629: D_Phone
	{
		displayName="Phone 629";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_630: D_Phone
	{
		displayName="Phone 630";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_631: D_Phone
	{
		displayName="Phone 631";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_632: D_Phone
	{
		displayName="Phone 632";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_633: D_Phone
	{
		displayName="Phone 633";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_634: D_Phone
	{
		displayName="Phone 634";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_635: D_Phone
	{
		displayName="Phone 635";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_636: D_Phone
	{
		displayName="Phone 636";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_637: D_Phone
	{
		displayName="Phone 637";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_638: D_Phone
	{
		displayName="Phone 638";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_639: D_Phone
	{
		displayName="Phone 639";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_640: D_Phone
	{
		displayName="Phone 640";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_641: D_Phone
	{
		displayName="Phone 641";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_642: D_Phone
	{
		displayName="Phone 642";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_643: D_Phone
	{
		displayName="Phone 643";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_644: D_Phone
	{
		displayName="Phone 644";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_645: D_Phone
	{
		displayName="Phone 645";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_646: D_Phone
	{
		displayName="Phone 646";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_647: D_Phone
	{
		displayName="Phone 647";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_648: D_Phone
	{
		displayName="Phone 648";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_649: D_Phone
	{
		displayName="Phone 649";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_650: D_Phone
	{
		displayName="Phone 650";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_651: D_Phone
	{
		displayName="Phone 651";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_652: D_Phone
	{
		displayName="Phone 652";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_653: D_Phone
	{
		displayName="Phone 653";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_654: D_Phone
	{
		displayName="Phone 654";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_655: D_Phone
	{
		displayName="Phone 655";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_656: D_Phone
	{
		displayName="Phone 656";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_657: D_Phone
	{
		displayName="Phone 657";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_658: D_Phone
	{
		displayName="Phone 658";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_659: D_Phone
	{
		displayName="Phone 659";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_660: D_Phone
	{
		displayName="Phone 660";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_661: D_Phone
	{
		displayName="Phone 661";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_662: D_Phone
	{
		displayName="Phone 662";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_663: D_Phone
	{
		displayName="Phone 663";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_664: D_Phone
	{
		displayName="Phone 664";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_665: D_Phone
	{
		displayName="Phone 665";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_666: D_Phone
	{
		displayName="Phone 666";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_667: D_Phone
	{
		displayName="Phone 667";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_668: D_Phone
	{
		displayName="Phone 668";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_669: D_Phone
	{
		displayName="Phone 669";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_670: D_Phone
	{
		displayName="Phone 670";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_671: D_Phone
	{
		displayName="Phone 671";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_672: D_Phone
	{
		displayName="Phone 672";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_673: D_Phone
	{
		displayName="Phone 673";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_674: D_Phone
	{
		displayName="Phone 674";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_675: D_Phone
	{
		displayName="Phone 675";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_676: D_Phone
	{
		displayName="Phone 676";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_677: D_Phone
	{
		displayName="Phone 677";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_678: D_Phone
	{
		displayName="Phone 678";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_679: D_Phone
	{
		displayName="Phone 679";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_680: D_Phone
	{
		displayName="Phone 680";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_681: D_Phone
	{
		displayName="Phone 681";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_682: D_Phone
	{
		displayName="Phone 682";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_683: D_Phone
	{
		displayName="Phone 683";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_684: D_Phone
	{
		displayName="Phone 684";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_685: D_Phone
	{
		displayName="Phone 685";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_686: D_Phone
	{
		displayName="Phone 686";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_687: D_Phone
	{
		displayName="Phone 687";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_688: D_Phone
	{
		displayName="Phone 688";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_689: D_Phone
	{
		displayName="Phone 689";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_690: D_Phone
	{
		displayName="Phone 690";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_691: D_Phone
	{
		displayName="Phone 691";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_692: D_Phone
	{
		displayName="Phone 692";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_693: D_Phone
	{
		displayName="Phone 693";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_694: D_Phone
	{
		displayName="Phone 694";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_695: D_Phone
	{
		displayName="Phone 695";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_696: D_Phone
	{
		displayName="Phone 696";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_697: D_Phone
	{
		displayName="Phone 697";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_698: D_Phone
	{
		displayName="Phone 698";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_699: D_Phone
	{
		displayName="Phone 699";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_700: D_Phone
	{
		displayName="Phone 700";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_701: D_Phone
	{
		displayName="Phone 701";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_702: D_Phone
	{
		displayName="Phone 702";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_703: D_Phone
	{
		displayName="Phone 703";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_704: D_Phone
	{
		displayName="Phone 704";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_705: D_Phone
	{
		displayName="Phone 705";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_706: D_Phone
	{
		displayName="Phone 706";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_707: D_Phone
	{
		displayName="Phone 707";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_708: D_Phone
	{
		displayName="Phone 708";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_709: D_Phone
	{
		displayName="Phone 709";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_710: D_Phone
	{
		displayName="Phone 710";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_711: D_Phone
	{
		displayName="Phone 711";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_712: D_Phone
	{
		displayName="Phone 712";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_713: D_Phone
	{
		displayName="Phone 713";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_714: D_Phone
	{
		displayName="Phone 714";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_715: D_Phone
	{
		displayName="Phone 715";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_716: D_Phone
	{
		displayName="Phone 716";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_717: D_Phone
	{
		displayName="Phone 717";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_718: D_Phone
	{
		displayName="Phone 718";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_719: D_Phone
	{
		displayName="Phone 719";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_720: D_Phone
	{
		displayName="Phone 720";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_721: D_Phone
	{
		displayName="Phone 721";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_722: D_Phone
	{
		displayName="Phone 722";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_723: D_Phone
	{
		displayName="Phone 723";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_724: D_Phone
	{
		displayName="Phone 724";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_725: D_Phone
	{
		displayName="Phone 725";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_726: D_Phone
	{
		displayName="Phone 726";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_727: D_Phone
	{
		displayName="Phone 727";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_728: D_Phone
	{
		displayName="Phone 728";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_729: D_Phone
	{
		displayName="Phone 729";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_730: D_Phone
	{
		displayName="Phone 730";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_731: D_Phone
	{
		displayName="Phone 731";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_732: D_Phone
	{
		displayName="Phone 732";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_733: D_Phone
	{
		displayName="Phone 733";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_734: D_Phone
	{
		displayName="Phone 734";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_735: D_Phone
	{
		displayName="Phone 735";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_736: D_Phone
	{
		displayName="Phone 736";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_737: D_Phone
	{
		displayName="Phone 737";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_738: D_Phone
	{
		displayName="Phone 738";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_739: D_Phone
	{
		displayName="Phone 739";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_740: D_Phone
	{
		displayName="Phone 740";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_741: D_Phone
	{
		displayName="Phone 741";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_742: D_Phone
	{
		displayName="Phone 742";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_743: D_Phone
	{
		displayName="Phone 743";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_744: D_Phone
	{
		displayName="Phone 744";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_745: D_Phone
	{
		displayName="Phone 745";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_746: D_Phone
	{
		displayName="Phone 746";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_747: D_Phone
	{
		displayName="Phone 747";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_748: D_Phone
	{
		displayName="Phone 748";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_749: D_Phone
	{
		displayName="Phone 749";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_750: D_Phone
	{
		displayName="Phone 750";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_751: D_Phone
	{
		displayName="Phone 751";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_752: D_Phone
	{
		displayName="Phone 752";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_753: D_Phone
	{
		displayName="Phone 753";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_754: D_Phone
	{
		displayName="Phone 754";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_755: D_Phone
	{
		displayName="Phone 755";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_756: D_Phone
	{
		displayName="Phone 756";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_757: D_Phone
	{
		displayName="Phone 757";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_758: D_Phone
	{
		displayName="Phone 758";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_759: D_Phone
	{
		displayName="Phone 759";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_760: D_Phone
	{
		displayName="Phone 760";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_761: D_Phone
	{
		displayName="Phone 761";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_762: D_Phone
	{
		displayName="Phone 762";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_763: D_Phone
	{
		displayName="Phone 763";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_764: D_Phone
	{
		displayName="Phone 764";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_765: D_Phone
	{
		displayName="Phone 765";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_766: D_Phone
	{
		displayName="Phone 766";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_767: D_Phone
	{
		displayName="Phone 767";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_768: D_Phone
	{
		displayName="Phone 768";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_769: D_Phone
	{
		displayName="Phone 769";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_770: D_Phone
	{
		displayName="Phone 770";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_771: D_Phone
	{
		displayName="Phone 771";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_772: D_Phone
	{
		displayName="Phone 772";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_773: D_Phone
	{
		displayName="Phone 773";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_774: D_Phone
	{
		displayName="Phone 774";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_775: D_Phone
	{
		displayName="Phone 775";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_776: D_Phone
	{
		displayName="Phone 776";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_777: D_Phone
	{
		displayName="Phone 777";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_778: D_Phone
	{
		displayName="Phone 778";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_779: D_Phone
	{
		displayName="Phone 779";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_780: D_Phone
	{
		displayName="Phone 780";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_781: D_Phone
	{
		displayName="Phone 781";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_782: D_Phone
	{
		displayName="Phone 782";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_783: D_Phone
	{
		displayName="Phone 783";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_784: D_Phone
	{
		displayName="Phone 784";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_785: D_Phone
	{
		displayName="Phone 785";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_786: D_Phone
	{
		displayName="Phone 786";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_787: D_Phone
	{
		displayName="Phone 787";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_788: D_Phone
	{
		displayName="Phone 788";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_789: D_Phone
	{
		displayName="Phone 789";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_790: D_Phone
	{
		displayName="Phone 790";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_791: D_Phone
	{
		displayName="Phone 791";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_792: D_Phone
	{
		displayName="Phone 792";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_793: D_Phone
	{
		displayName="Phone 793";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_794: D_Phone
	{
		displayName="Phone 794";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_795: D_Phone
	{
		displayName="Phone 795";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_796: D_Phone
	{
		displayName="Phone 796";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_797: D_Phone
	{
		displayName="Phone 797";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_798: D_Phone
	{
		displayName="Phone 798";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_799: D_Phone
	{
		displayName="Phone 799";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_800: D_Phone
	{
		displayName="Phone 800";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_801: D_Phone
	{
		displayName="Phone 801";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_802: D_Phone
	{
		displayName="Phone 802";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_803: D_Phone
	{
		displayName="Phone 803";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_804: D_Phone
	{
		displayName="Phone 804";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_805: D_Phone
	{
		displayName="Phone 805";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_806: D_Phone
	{
		displayName="Phone 806";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_807: D_Phone
	{
		displayName="Phone 807";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_808: D_Phone
	{
		displayName="Phone 808";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_809: D_Phone
	{
		displayName="Phone 809";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_810: D_Phone
	{
		displayName="Phone 810";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_811: D_Phone
	{
		displayName="Phone 811";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_812: D_Phone
	{
		displayName="Phone 812";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_813: D_Phone
	{
		displayName="Phone 813";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_814: D_Phone
	{
		displayName="Phone 814";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_815: D_Phone
	{
		displayName="Phone 815";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_816: D_Phone
	{
		displayName="Phone 816";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_817: D_Phone
	{
		displayName="Phone 817";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_818: D_Phone
	{
		displayName="Phone 818";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_819: D_Phone
	{
		displayName="Phone 819";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_820: D_Phone
	{
		displayName="Phone 820";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_821: D_Phone
	{
		displayName="Phone 821";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_822: D_Phone
	{
		displayName="Phone 822";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_823: D_Phone
	{
		displayName="Phone 823";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_824: D_Phone
	{
		displayName="Phone 824";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_825: D_Phone
	{
		displayName="Phone 825";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_826: D_Phone
	{
		displayName="Phone 826";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_827: D_Phone
	{
		displayName="Phone 827";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_828: D_Phone
	{
		displayName="Phone 828";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_829: D_Phone
	{
		displayName="Phone 829";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_830: D_Phone
	{
		displayName="Phone 830";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_831: D_Phone
	{
		displayName="Phone 831";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_832: D_Phone
	{
		displayName="Phone 832";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_833: D_Phone
	{
		displayName="Phone 833";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_834: D_Phone
	{
		displayName="Phone 834";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_835: D_Phone
	{
		displayName="Phone 835";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_836: D_Phone
	{
		displayName="Phone 836";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_837: D_Phone
	{
		displayName="Phone 837";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_838: D_Phone
	{
		displayName="Phone 838";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_839: D_Phone
	{
		displayName="Phone 839";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_840: D_Phone
	{
		displayName="Phone 840";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_841: D_Phone
	{
		displayName="Phone 841";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_842: D_Phone
	{
		displayName="Phone 842";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_843: D_Phone
	{
		displayName="Phone 843";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_844: D_Phone
	{
		displayName="Phone 844";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_845: D_Phone
	{
		displayName="Phone 845";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_846: D_Phone
	{
		displayName="Phone 846";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_847: D_Phone
	{
		displayName="Phone 847";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_848: D_Phone
	{
		displayName="Phone 848";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_849: D_Phone
	{
		displayName="Phone 849";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_850: D_Phone
	{
		displayName="Phone 850";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_851: D_Phone
	{
		displayName="Phone 851";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_852: D_Phone
	{
		displayName="Phone 852";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_853: D_Phone
	{
		displayName="Phone 853";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_854: D_Phone
	{
		displayName="Phone 854";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_855: D_Phone
	{
		displayName="Phone 855";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_856: D_Phone
	{
		displayName="Phone 856";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_857: D_Phone
	{
		displayName="Phone 857";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_858: D_Phone
	{
		displayName="Phone 858";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_859: D_Phone
	{
		displayName="Phone 859";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_860: D_Phone
	{
		displayName="Phone 860";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_861: D_Phone
	{
		displayName="Phone 861";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_862: D_Phone
	{
		displayName="Phone 862";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_863: D_Phone
	{
		displayName="Phone 863";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_864: D_Phone
	{
		displayName="Phone 864";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_865: D_Phone
	{
		displayName="Phone 865";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_866: D_Phone
	{
		displayName="Phone 866";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_867: D_Phone
	{
		displayName="Phone 867";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_868: D_Phone
	{
		displayName="Phone 868";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_869: D_Phone
	{
		displayName="Phone 869";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_870: D_Phone
	{
		displayName="Phone 870";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_871: D_Phone
	{
		displayName="Phone 871";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_872: D_Phone
	{
		displayName="Phone 872";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_873: D_Phone
	{
		displayName="Phone 873";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_874: D_Phone
	{
		displayName="Phone 874";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_875: D_Phone
	{
		displayName="Phone 875";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_876: D_Phone
	{
		displayName="Phone 876";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_877: D_Phone
	{
		displayName="Phone 877";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_878: D_Phone
	{
		displayName="Phone 878";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_879: D_Phone
	{
		displayName="Phone 879";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_880: D_Phone
	{
		displayName="Phone 880";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_881: D_Phone
	{
		displayName="Phone 881";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_882: D_Phone
	{
		displayName="Phone 882";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_883: D_Phone
	{
		displayName="Phone 883";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_884: D_Phone
	{
		displayName="Phone 884";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_885: D_Phone
	{
		displayName="Phone 885";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_886: D_Phone
	{
		displayName="Phone 886";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_887: D_Phone
	{
		displayName="Phone 887";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_888: D_Phone
	{
		displayName="Phone 888";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_889: D_Phone
	{
		displayName="Phone 889";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_890: D_Phone
	{
		displayName="Phone 890";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_891: D_Phone
	{
		displayName="Phone 891";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_892: D_Phone
	{
		displayName="Phone 892";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_893: D_Phone
	{
		displayName="Phone 893";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_894: D_Phone
	{
		displayName="Phone 894";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_895: D_Phone
	{
		displayName="Phone 895";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_896: D_Phone
	{
		displayName="Phone 896";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_897: D_Phone
	{
		displayName="Phone 897";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_898: D_Phone
	{
		displayName="Phone 898";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_899: D_Phone
	{
		displayName="Phone 899";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_900: D_Phone
	{
		displayName="Phone 900";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_901: D_Phone
	{
		displayName="Phone 901";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_902: D_Phone
	{
		displayName="Phone 902";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_903: D_Phone
	{
		displayName="Phone 903";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_904: D_Phone
	{
		displayName="Phone 904";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_905: D_Phone
	{
		displayName="Phone 905";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_906: D_Phone
	{
		displayName="Phone 906";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_907: D_Phone
	{
		displayName="Phone 907";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_908: D_Phone
	{
		displayName="Phone 908";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_909: D_Phone
	{
		displayName="Phone 909";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_910: D_Phone
	{
		displayName="Phone 910";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_911: D_Phone
	{
		displayName="Phone 911";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_912: D_Phone
	{
		displayName="Phone 912";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_913: D_Phone
	{
		displayName="Phone 913";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_914: D_Phone
	{
		displayName="Phone 914";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_915: D_Phone
	{
		displayName="Phone 915";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_916: D_Phone
	{
		displayName="Phone 916";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_917: D_Phone
	{
		displayName="Phone 917";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_918: D_Phone
	{
		displayName="Phone 918";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_919: D_Phone
	{
		displayName="Phone 919";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_920: D_Phone
	{
		displayName="Phone 920";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_921: D_Phone
	{
		displayName="Phone 921";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_922: D_Phone
	{
		displayName="Phone 922";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_923: D_Phone
	{
		displayName="Phone 923";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_924: D_Phone
	{
		displayName="Phone 924";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_925: D_Phone
	{
		displayName="Phone 925";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_926: D_Phone
	{
		displayName="Phone 926";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_927: D_Phone
	{
		displayName="Phone 927";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_928: D_Phone
	{
		displayName="Phone 928";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_929: D_Phone
	{
		displayName="Phone 929";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_930: D_Phone
	{
		displayName="Phone 930";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_931: D_Phone
	{
		displayName="Phone 931";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_932: D_Phone
	{
		displayName="Phone 932";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_933: D_Phone
	{
		displayName="Phone 933";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_934: D_Phone
	{
		displayName="Phone 934";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_935: D_Phone
	{
		displayName="Phone 935";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_936: D_Phone
	{
		displayName="Phone 936";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_937: D_Phone
	{
		displayName="Phone 937";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_938: D_Phone
	{
		displayName="Phone 938";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_939: D_Phone
	{
		displayName="Phone 939";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_940: D_Phone
	{
		displayName="Phone 940";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_941: D_Phone
	{
		displayName="Phone 941";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_942: D_Phone
	{
		displayName="Phone 942";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_943: D_Phone
	{
		displayName="Phone 943";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_944: D_Phone
	{
		displayName="Phone 944";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_945: D_Phone
	{
		displayName="Phone 945";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_946: D_Phone
	{
		displayName="Phone 946";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_947: D_Phone
	{
		displayName="Phone 947";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_948: D_Phone
	{
		displayName="Phone 948";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_949: D_Phone
	{
		displayName="Phone 949";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_950: D_Phone
	{
		displayName="Phone 950";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_951: D_Phone
	{
		displayName="Phone 951";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_952: D_Phone
	{
		displayName="Phone 952";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_953: D_Phone
	{
		displayName="Phone 953";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_954: D_Phone
	{
		displayName="Phone 954";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_955: D_Phone
	{
		displayName="Phone 955";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_956: D_Phone
	{
		displayName="Phone 956";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_957: D_Phone
	{
		displayName="Phone 957";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_958: D_Phone
	{
		displayName="Phone 958";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_959: D_Phone
	{
		displayName="Phone 959";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_960: D_Phone
	{
		displayName="Phone 960";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_961: D_Phone
	{
		displayName="Phone 961";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_962: D_Phone
	{
		displayName="Phone 962";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_963: D_Phone
	{
		displayName="Phone 963";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_964: D_Phone
	{
		displayName="Phone 964";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_965: D_Phone
	{
		displayName="Phone 965";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_966: D_Phone
	{
		displayName="Phone 966";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_967: D_Phone
	{
		displayName="Phone 967";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_968: D_Phone
	{
		displayName="Phone 968";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_969: D_Phone
	{
		displayName="Phone 969";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_970: D_Phone
	{
		displayName="Phone 970";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_971: D_Phone
	{
		displayName="Phone 971";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_972: D_Phone
	{
		displayName="Phone 972";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_973: D_Phone
	{
		displayName="Phone 973";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_974: D_Phone
	{
		displayName="Phone 974";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_975: D_Phone
	{
		displayName="Phone 975";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_976: D_Phone
	{
		displayName="Phone 976";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_977: D_Phone
	{
		displayName="Phone 977";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_978: D_Phone
	{
		displayName="Phone 978";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_979: D_Phone
	{
		displayName="Phone 979";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_980: D_Phone
	{
		displayName="Phone 980";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_981: D_Phone
	{
		displayName="Phone 981";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_982: D_Phone
	{
		displayName="Phone 982";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_983: D_Phone
	{
		displayName="Phone 983";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_984: D_Phone
	{
		displayName="Phone 984";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_985: D_Phone
	{
		displayName="Phone 985";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_986: D_Phone
	{
		displayName="Phone 986";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_987: D_Phone
	{
		displayName="Phone 987";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_988: D_Phone
	{
		displayName="Phone 988";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_989: D_Phone
	{
		displayName="Phone 989";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_990: D_Phone
	{
		displayName="Phone 990";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_991: D_Phone
	{
		displayName="Phone 991";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_992: D_Phone
	{
		displayName="Phone 992";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_993: D_Phone
	{
		displayName="Phone 993";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_994: D_Phone
	{
		displayName="Phone 994";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_995: D_Phone
	{
		displayName="Phone 995";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_996: D_Phone
	{
		displayName="Phone 996";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_997: D_Phone
	{
		displayName="Phone 997";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_998: D_Phone
	{
		displayName="Phone 998";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_999: D_Phone
	{
		displayName="Phone 999";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
	class D_Phone_1000: D_Phone
	{
		displayName="Phone 1000";
		scope=1;
		scopeCurator=1;
		tf_prototype=0;
		tf_radio=1;
	};
};