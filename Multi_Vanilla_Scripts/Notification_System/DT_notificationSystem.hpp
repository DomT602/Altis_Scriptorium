class DT_Notifications {
	idd = -1;
	duration = 1e+011;
	onLoad = "uiNamespace setVariable [""DT_Notif_Display"", _this select 0]";
	class controls {
		class Message : life_RscStructuredText {
			idc = 6591;
			x = -0.000156274 * safezoneW + safezoneX;
			y = -0.00199999 * safezoneH + safezoneY;
			w = 0.311406 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0,0,0,0};
			sizeEx = 1.0;
			class Attributes {
				align = "left";
				valign = "middle";
				size = 1;
			};
		};
	};
};