class DT_SetPlayerTag {
	idd = 59000;
	name = "DT_SetPlayerTag";
	movingEnable = 0;
	class controls {
		class DT_EnterName: Life_RscEdit {
			idc = 1400;
			maxChars=50;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.7,0.7,0.7,0.7};
		};

		class DT_Accept: Life_RscButtonMenu {
			idc = -1;
			text = "Set Name"; //--- ToDo: Localize;
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.7,0.7,0.7,0.7};
			action = "[life_pInact_curTarget] call life_fnc_setName;";
			class Attributes {
				align = "center";
			};
		};
	};
};