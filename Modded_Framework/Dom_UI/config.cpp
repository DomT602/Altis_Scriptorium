class CfgPatches
{
	class Dom_UI
	{
		units[]={};
		weapons[]={"D_Phone"};
		requiredVersion=1.92;
		requiredaddons[]=
		{
			"D_C"
		};
	};
};
class Attributes;
class RscStandardDisplay;
class RscProgress;
class RscStructuredText;
class RscPicture;
class RscButton;
class RscShortcutButton;
class RscButtonMenu;
class RscButtonMenuOK;
class RscButtonMenuCancel;
class RscText;
class RscVignette;
class RscDisplayGetReady;
class RscActiveText;
class RscListBox;
class RscListNBox;
class RscCombo;
class RscXListBox;
class RscHTML;
class RscPictureKeepAspect;
class RscActivePicture;
class RscMapControl;
class RscControlsGroupNoScrollbars;
class RscControlsGroupNoHScrollbars;
class RscFrame;
class RscTitle;
class CA_Title;
class RscDebugConsole;
class RscTrafficLight;
class RscFeedback;
class RscMessageBox;
class RscControlsGroup;
class RscTextCheckbox;
class RscDisplayInventory_DLCTemplate;
class RscEdit;
class RscCheckBox;
class RscIGProgress;
class RscHitZones;
class RscIGUIText;
class RscIGUIValue;
class RscOpticsValue;
class RscOpticsText;
class Scrollbar;
class RscIGUIShortcutButton;
class RscActivePictureKeepAspect;
class RscTree;
class RscXSliderH;
class RscObject;
class ctrlMenu;
class ctrlStaticPicture;
class RscButtonMenuSteam;
class RscButtonTextOnly;
class RscSlider;
class GroundContainer;
class UniformContainer;
class GroupSingleplayer;
class RscButtonMenuMain;
class DefaultFont
{
	font="PuristaLight";
};
class DT_RscStructuredText
{
	type=13;
	style=0;
	x=0;
	y=0;
	h=0.035;
	w=0.1;
	text="";
	size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[]={0,0,0,1};
	shadow=1;
	sizeEx=0.029999999;
	class Attributes
	{
		font="PuristaLight";
		color="#ffffff";
		align="center";
		shadow=1;
	};
};
class RscPhoneText: DT_RscStructuredText
{
	h=0.039999999;
	w=0.40000001;
	class Attributes
	{
		font="PuristaLight";
		color="#000000";
		align="left";
		shadow=1;
	};
};
class RscButtonGeneral: RscShortcutButton
{
	idc=-1;
	type=16;
	style="0x02 + 0xC0";
	default=0;
	shadow=0;
	x=0;
	y=0;
	w=0.095588997;
	h=0.039216001;
	animTextureNormal="#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled="#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver="#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused="#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed="#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault="#(argb,8,8,3)color(1,1,1,1)";
	colorBackground[]={0.52899998,0,0,1};
	colorBackgroundFocused[]={1,1,1,1};
	colorBackground2[]={0.75,0.75,0.75,1};
	color[]={1,1,1,1};
	colorFocused[]={0,0,0,1};
	color2[]={0,0,0,1};
	colorText[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.25};
	period=1.2;
	periodFocus=1.2;
	periodOver=1.2;
	size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	tooltipColorText[]={1,1,1,1};
	tooltipColorBox[]={1,1,1,1};
	tooltipColorShade[]={0,0,0,0.64999998};
	class TextPos
	{
		left="0.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
		top="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right=0.0049999999;
		bottom=0;
	};
	class Attributes
	{
		font="PuristaLight";
		color="#E5E5E5";
		align="center";
		shadow="false";
	};
	class ShortcutPos
	{
		left="(6.25 * (((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
		top=0.0049999999;
		w=0.022500001;
		h=0.029999999;
	};
	soundEnter[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",
		0.090000004,
		1
	};
	soundPush[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundPush",
		0.090000004,
		1
	};
	soundClick[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundClick",
		0.090000004,
		1
	};
	soundEscape[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",
		0.090000004,
		1
	};
	textureNoShortcut="";
};
class DT_RscProgress
{
	type=8;
	style=0;
	x=0.34400001;
	y=0.61900002;
	w=0.31372601;
	h=0.0261438;
	texture="";
	shadow=2;
	colorFrame[]={0,0,0,0.75};
	colorBackground[]={0,0,0,0.75};
	colorBar[]={0.52899998,0,0,1};
};
class DT_RscListBox
{
	style=16;
	idc=-1;
	type=5;
	w=0.27500001;
	h=0.039999999;
	font="PuristaLight";
	colorSelect[]={1,1,1,1};
	colorText[]={1,1,1,1};
	colorBackground[]={0.52899998,0,0,1};
	colorSelect2[]={1,1,1,1};
	colorSelectBackground[]={0.94999999,0.94999999,0.94999999,0.5};
	colorSelectBackground2[]={1,1,1,0.5};
	colorScrollbar[]={0.2,0.2,0.2,1};
	colorPicture[]={1,1,1,1};
	colorPictureSelected[]={1,1,1,1};
	colorPictureDisabled[]={1,1,1,1};
	arrowFull="\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	arrowEmpty="\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	wholeHeight=0.44999999;
	rowHeight=0.039999999;
	color[]={0.69999999,0.69999999,0.69999999,1};
	colorActive[]={0,0,0,1};
	colorDisabled[]={0,0,0,0.30000001};
	sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	soundSelect[]=
	{
		"",
		0.1,
		1
	};
	soundExpand[]=
	{
		"",
		0.1,
		1
	};
	soundCollapse[]=
	{
		"",
		0.1,
		1
	};
	maxHistoryDelay=1;
	autoScrollSpeed=-1;
	autoScrollDelay=5;
	autoScrollRewind=0;
	tooltipColorText[]={1,1,1,1};
	tooltipColorBox[]={1,1,1,1};
	tooltipColorShade[]={0,0,0,0.64999998};
	class ListScrollBar: Scrollbar
	{
		color[]={1,1,1,1};
		autoScrollEnabled=1;
	};
};
class RscListboxInvisible: DT_RscListBox
{
	colorBackground[]={0,0,0,0};
};
class DT_RscTree
{
	idc=-1;
	type=12;
	style=0;
	blinkingPeriod=0;
	w=0.27500001;
	h=0.039999999;
	colorBackground[]={0,0,0,0.2};
	sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	picture="";
	colorPicture[]={1,1,1,1};
	colorPictureSelected[]={1,1,1,1};
	colorPictureDisabled[]={1,1,1,1};
	colorPictureRight[]={1,1,1,1};
	colorPictureRightSelected[]={1,1,1,1};
	colorPictureRightDisabled[]={1,1,1,1};
	colorPictureLeft[]={1,1,1,1};
	colorPictureLeftSelected[]={1,1,1,1};
	colorPictureLeftDisabled[]={1,1,1,1};
	font="PuristaLight";
	rowHeight=0.039999999;
	color[]={1,1,1,1};
	colorSelect[]={0.69999999,0.69999999,0.69999999,1};
	colorSelectBackground[]={0,0,0,0.5};
	colorBorder[]={0,0,0,0};
	borderSize=0;
	colorMarked[]={1,0.5,0,0.5};
	colorMarkedSelected[]={1,0.5,0,1};
	colorText[]={1,1,1,1};
	colorSelectText[]={1,1,1,1};
	colorMarkedText[]={1,1,1,1};
	colorSearch[]={0.13,0.54000002,0.20999999,0.80000001};
	tooltip="";
	tooltipColorShade[]={0,0,0,1};
	tooltipColorText[]={1,1,1,1};
	tooltipColorBox[]={1,1,1,1};
	multiselectEnabled=1;
	expandOnDoubleclick=1;
	hiddenTexture="\A3\ui_f\data\gui\rsccommon\rsctree\hiddenTexture_ca.paa";
	expandedTexture="\A3\ui_f\data\gui\rsccommon\rsctree\expandedTexture_ca.paa";
	maxHistoryDelay=1;
	colorDisabled[]={0,0,0,0};
	colorArrow[]={0,0,0,0};
	class ScrollBar: Scrollbar
	{
	};
};
class RscTreeInvisible: DT_RscTree
{
	colorBackground[]={0,0,0,0};
};
class RscTreeInvisibleSearch: RscTreeInvisible
{
	idcSearch=645;
};
class DT_RscEdit
{
	type=2;
	style="0x00 + 0x40";
	font="PuristaLight";
	shadow=2;
	sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorBackground[]={0.52899998,0,0,1};
	soundSelect[]=
	{
		"",
		0.1,
		1
	};
	soundExpand[]=
	{
		"",
		0.1,
		1
	};
	colorText[]={0.94999999,0.94999999,0.94999999,1};
	colorDisabled[]={1,1,1,0.25};
	autocomplete="false";
	colorSelection[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",
		1
	};
	canModify=1;
};
class RscEditInvisible: DT_RscEdit
{
	text="";
	style="0x00 + 0x0200 + 0x10";
	colorBackground[]={0,0,0,0};
	colorDisabled[]={0,0,0,0};
	colorText[]={0.118,0.55299997,0.96899998,1};
	lineSpacing=1;
};
class DT_ctrlDefault
{
	idc=-1;
	style=0;
	default=0;
	show=1;
	fade=0;
	blinkingPeriod=0;
	deletable=0;
	x=0;
	y=0;
	w=0;
	h=0;
	tooltip="";
	tooltipMaxWidth=0.5;
	tooltipColorShade[]={0,0,0,1};
	tooltipColorText[]={1,1,1,1};
	tooltipColorBox[]={0,0,0,0};
	class ScrollBar
	{
		width=0;
		height=0;
		scrollSpeed=0.059999999;
		arrowEmpty="\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa";
		arrowFull="\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa";
		border="\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa";
		thumb="\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa";
		color[]={1,1,1,1};
	};
};
class DT_ctrlDefaultText: DT_ctrlDefault
{
	sizeEx="4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	font="PuristaLight";
	shadow=1;
};
class DT_ctrlStatic: DT_ctrlDefaultText
{
	type=0;
	colorBackground[]={0,0,0,0};
	text="";
	lineSpacing=1;
	fixedWidth=0;
	colorText[]={1,1,1,1};
	colorShadow[]={0,0,0,1};
	moving=0;
	autoplay=0;
	loops=0;
	tileW=1;
	tileH=1;
	onCanDestroy="";
	onDestroy="";
	onMouseEnter="";
	onMouseExit="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onVideoStopped="";
};
class RscInGameUI
{
	class RscUnitInfo
	{
		class WeaponInfoControlsGroupLeft: RscControlsGroup
		{
			show=0;
		};
		class WeaponInfoControlsGroupRight: RscControlsGroup
		{
			show=0;
		};
		class CA_Zeroing: RscText
		{
			show=0;
		};
	};
	class RscStanceInfo
	{
		show=0;
		class StanceIndicatorBackground: RscPicture
		{
			show=0;
		};
		class StanceIndicator: RscPictureKeepAspect
		{
			show=0;
		};
	};
	class RscWeaponZeroing: RscUnitInfo
	{
		class CA_Zeroing: RscText
		{
			show=0;
		};
	};
	class RscWeaponRangeZeroing: RscUnitInfo
	{
		class CA_DistanceText: RscOpticsText
		{
			show=0;
		};
		class CA_Distance: RscOpticsValue
		{
			show=0;
		};
	};
	class RscStaminaBar: RscUnitInfo
	{
		show=0;
		class StaminaBar: RscPicture
		{
			show=0;
		};
	};
};
class RscDisplayInventory
{
	class controls
	{
		class BackpackContainer: UniformContainer
		{
			onLBDblClick="_this call DT_fnc_handleItem";
		};
		class VestContainer: UniformContainer
		{
			onLBDblClick="_this call DT_fnc_handleItem";
		};
		class UniformContainer: GroundContainer
		{
			onLBDblClick="_this call DT_fnc_handleItem";
		};
	};
};
class RscDisplayMain
{
	class controls
	{
		class GroupMultiplayer: GroupSingleplayer
		{
			idc=1002;
			x="0.5 - (	5 + 2 * 	10) * 	(pixelW * pixelGrid * 2)";
			h="(5 * 	1.5) * 	(pixelH * pixelGrid * 2)";
			class Controls
			{
				class QuickPlay: RscButtonMenuMain
				{
					show=0;
				};
				class ServerBrowser: RscButtonMenuMain
				{
					idc=105;
					text="$STR_A3_RscDisplayMain_GroupMultiplayer_ServerBrowser_text";
					tooltip="";
					y="(0 * 	1.5) * 	(pixelH * pixelGrid * 2) + 	(pixelH)";
					w="10 * 	(pixelW * pixelGrid * 2)";
					onbuttonclick="";
				};
				class ApexProtocol: ServerBrowser
				{
					idc=206;
					text="Play DomRP";
					tooltip="";
					y="(1 * 	1.5) * 	(pixelH * pixelGrid * 2) + 	(pixelH)";
					onbuttonclick="['91.121.153.95','2702'] call compile preProcessFileLineNumbers '\Dom_UI\missions\fn_redirectClientToServer.sqf'";
				};
			};
		};
		class Spotlight1
		{
			show=0;
		};
		class Spotlight2
		{
			show=0;
		};
		class Spotlight3
		{
			show=0;
		};
		class BackgroundSpotlightRight
		{
			show=0;
		};
		class BackgroundSpotlightLeft
		{
			show=0;
		};
		class BackgroundSpotlight
		{
			show=0;
		};
		class SpotlightPrev
		{
			show=0;
		};
		class SpotlightNext
		{
			show=0;
		};
	};
};
class RscButtonInvisible: RscButton
{
	idc=-1;
	text="";
	colorBackground[]={0,0,0,0};
	colorBackgroundActive[]={0,0,0,0};
	colorBackgroundDisabled[]={0,0,0,0};
	colorBorder[]={0,0,0,0};
	colorFocused[]={0,0,0,0};
};
class RscInteractionText: RscText
{
	font="PuristaLight";
	colorBackground[]={0,0,0,0};
	SizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75)";
	Style=2;
	Shadow=0;
};
class MB_Interaction_Menu
{
	idd=1000;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	movingenable=0;
	class controlsBackground
	{
		class RscPicture_1205: RscPicture
		{
			idc=1205;
			text="\Dom_UI\radial\Bottom.paa";
			x="0.386562 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.216563 * safezoneW";
			h="0.374 * safezoneH";
			colorBackground[]={0,0,0,1};
		};
		class RscPicture_1206: RscPicture
		{
			idc=1206;
			text="\Dom_UI\radial\BottomLeft.paa";
			x="0.386562 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.216563 * safezoneW";
			h="0.374 * safezoneH";
		};
		class RscPicture_1208: RscPicture
		{
			idc=1208;
			text="\Dom_UI\radial\CenterLeft.paa";
			x="0.386562 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.216563 * safezoneW";
			h="0.374 * safezoneH";
		};
		class RscPicture_1207: RscPicture
		{
			idc=1207;
			text="\Dom_UI\radial\TopLeft.paa";
			x="0.386562 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.216563 * safezoneW";
			h="0.374 * safezoneH";
		};
		class RscPicture_1200: RscPicture
		{
			idc=1200;
			text="\Dom_UI\radial\Top.paa";
			x="0.386562 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.216563 * safezoneW";
			h="0.374 * safezoneH";
		};
		class RscPicture_1201: RscPicture
		{
			idc=1201;
			text="\Dom_UI\radial\TopRight.paa";
			x="0.386562 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.216563 * safezoneW";
			h="0.374 * safezoneH";
		};
		class RscPicture_1203: RscPicture
		{
			idc=1203;
			text="\Dom_UI\radial\CenterRight.paa";
			x="0.386562 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.216563 * safezoneW";
			h="0.374 * safezoneH";
		};
		class RscPicture_1204: RscPicture
		{
			idc=1204;
			text="\Dom_UI\radial\BottomRight.paa";
			x="0.386562 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.216563 * safezoneW";
			h="0.374 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=1202;
			text="\Dom_UI\radial\Middle.paa";
			x="0.386562 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.216563 * safezoneW";
			h="0.374 * safezoneH";
			colorBackground[]={0,0,0,0.75};
		};
	};
	class controls
	{
		class RscInteractionText_1003: RscInteractionText
		{
			idc=1001;
			text="";
			x="0.386562 * safezoneW + safezoneX";
			y="0.478 * safezoneH + safezoneY";
			w="0.0567187 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscCenterLeft: RscButtonInvisible
		{
			action="[0] call DT_fnc_radialButtonPushed;";
			onMouseEnter="ctrlSetText[1208, ""\Dom_UI\radial\CenterLeftActive.paa""];";
			onMouseExit="ctrlSetText[1208, ""\Dom_UI\radial\CenterLeft.paa""];";
		};
		class RscButtonInvisible_1613: RscCenterLeft
		{
			idc=1613;
			x="0.386562 * safezoneW + safezoneX";
			y="0.467 * safezoneH + safezoneY";
			w="0.0567187 * safezoneW";
			h="0.066 * safezoneH";
		};
		class RscButtonInvisible_1614: RscCenterLeft
		{
			idc=1614;
			x="0.389271 * safezoneW + safezoneX";
			y="0.533 * safezoneH + safezoneY";
			w="0.0436979 * safezoneW";
			h="0.0132223 * safezoneH";
		};
		class RscButtonInvisible_1615: RscCenterLeft
		{
			idc=1615;
			x="0.387135 * safezoneW + safezoneX";
			y="0.544 * safezoneH + safezoneY";
			w="0.027552 * safezoneW";
			h="0.0141484 * safezoneH";
		};
		class RscButtonInvisible_1616: RscCenterLeft
		{
			idc=1616;
			x="0.385938 * safezoneW + safezoneX";
			y="0.45463 * safezoneH + safezoneY";
			w="0.0436979 * safezoneW";
			h="0.0132223 * safezoneH";
		};
		class RscButtonInvisible_1617: RscCenterLeft
		{
			idc=1617;
			x="0.386979 * safezoneW + safezoneX";
			y="0.441667 * safezoneH + safezoneY";
			w="0.027552 * safezoneW";
			h="0.0141484 * safezoneH";
		};
		class RscInteractionText_1000: RscInteractionText
		{
			idc=1002;
			text="";
			x="0.402547 * safezoneW + safezoneX";
			y="0.39286 * safezoneH + safezoneY";
			w="0.0670312 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscTopLeft: RscButtonInvisible
		{
			action="[1] call DT_fnc_radialButtonPushed;";
			onMouseEnter="ctrlSetText[1207, ""\Dom_UI\radial\TopLeftActive.paa""];";
			onMouseExit="ctrlSetText[1207, ""\Dom_UI\radial\TopLeft.paa""];";
		};
		class RscButtonInvisible_1609: RscTopLeft
		{
			idc=1609;
			x="0.402031 * safezoneW + safezoneX";
			y="0.379 * safezoneH + safezoneY";
			w="0.0670312 * safezoneW";
			h="0.055 * safezoneH";
		};
		class RscButtonInvisible_1610: RscTopLeft
		{
			idc=1610;
			x="0.4175 * safezoneW + safezoneX";
			y="0.357 * safezoneH + safezoneY";
			w="0.04125 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscButtonInvisible_1611: RscTopLeft
		{
			idc=1611;
			x="0.432136 * safezoneW + safezoneX";
			y="0.336852 * safezoneH + safezoneY";
			w="0.0225 * safezoneW";
			h="0.0210741 * safezoneH";
		};
		class RscButtonInvisible_1612: RscTopLeft
		{
			idc=1612;
			x="0.424323 * safezoneW + safezoneX";
			y="0.42763 * safezoneH + safezoneY";
			w="0.0282292 * safezoneW";
			h="0.0257037 * safezoneH";
		};
		class RscInteractionText_1001: RscInteractionText
		{
			idc=1003;
			text="";
			x="0.463906 * safezoneW + safezoneX";
			y="0.335 * safezoneH + safezoneY";
			w="0.061875 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscTop: RscButtonInvisible
		{
			action="[2] call DT_fnc_radialButtonPushed;";
			onMouseEnter="ctrlSetText[1200, ""\Dom_UI\radial\TopActive.paa""];";
			onMouseExit="ctrlSetText[1200, ""\Dom_UI\radial\Top.paa""];";
		};
		class RscButtonInvisible_1600: RscTop
		{
			idc=1600;
			x="0.474219 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.04125 * safezoneW";
			h="0.099 * safezoneH";
		};
		class RscButtonInvisible_1601: RscTop
		{
			idc=1601;
			x="0.464947 * safezoneW + safezoneX";
			y="0.312889 * safezoneH + safezoneY";
			w="0.0103125 * safezoneW";
			h="0.066 * safezoneH";
		};
		class RscButtonInvisible_1602: RscTop
		{
			idc=1602;
			x="0.458854 * safezoneW + safezoneX";
			y="0.325925 * safezoneH + safezoneY";
			w="0.00770836 * safezoneW";
			h="0.0317408 * safezoneH";
		};
		class RscButtonInvisible_1603: RscTop
		{
			idc=1603;
			x="0.514584 * safezoneW + safezoneX";
			y="0.314814 * safezoneH + safezoneY";
			w="0.0103125 * safezoneW";
			h="0.066 * safezoneH";
		};
		class RscButtonInvisible_1604: RscTop
		{
			idc=1604;
			x="0.523437 * safezoneW + safezoneX";
			y="0.318518 * safezoneH + safezoneY";
			w="0.00770836 * safezoneW";
			h="0.0317408 * safezoneH";
		};
		class RscInteractionText_1002: RscInteractionText
		{
			idc=1004;
			text="";
			x="0.520109 * safezoneW + safezoneX";
			y="0.39286 * safezoneH + safezoneY";
			w="0.0670312 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscTopRight: RscButtonInvisible
		{
			action="[3] call DT_fnc_radialButtonPushed;";
			onMouseEnter="ctrlSetText[1201, ""\Dom_UI\radial\TopRightActive.paa""];";
			onMouseExit="ctrlSetText[1201, ""\Dom_UI\radial\TopRight.paa""];";
		};
		class RscButtonInvisible_1605: RscTopRight
		{
			idc=1605;
			x="0.520625 * safezoneW + safezoneX";
			y="0.379 * safezoneH + safezoneY";
			w="0.0670312 * safezoneW";
			h="0.055 * safezoneH";
		};
		class RscButtonInvisible_1606: RscTopRight
		{
			idc=1606;
			x="0.530937 * safezoneW + safezoneX";
			y="0.357 * safezoneH + safezoneY";
			w="0.04125 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscButtonInvisible_1607: RscTopRight
		{
			idc=1607;
			x="0.536094 * safezoneW + safezoneX";
			y="0.335 * safezoneH + safezoneY";
			w="0.0257812 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscButtonInvisible_1608: RscTopRight
		{
			idc=1608;
			x="0.536145 * safezoneW + safezoneX";
			y="0.432148 * safezoneH + safezoneY";
			w="0.0257812 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscInteractionText_1005: RscInteractionText
		{
			idc=1005;
			text="";
			x="0.546406 * safezoneW + safezoneX";
			y="0.478 * safezoneH + safezoneY";
			w="0.0567187 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscCenterRight: RscButtonInvisible
		{
			action="[4] call DT_fnc_radialButtonPushed;";
			onMouseEnter="ctrlSetText[1203, ""\Dom_UI\radial\CenterRightActive.paa""];";
			onMouseExit="ctrlSetText[1203, ""\Dom_UI\radial\CenterRight.paa""];";
		};
		class RscButtonInvisible_1618: RscCenterRight
		{
			idc=1618;
			x="0.546406 * safezoneW + safezoneX";
			y="0.467 * safezoneH + safezoneY";
			w="0.0567187 * safezoneW";
			h="0.066 * safezoneH";
		};
		class RscButtonInvisible_1619: RscCenterRight
		{
			idc=1619;
			x="0.556719 * safezoneW + safezoneX";
			y="0.533 * safezoneH + safezoneY";
			w="0.0442187 * safezoneW";
			h="0.0150741 * safezoneH";
		};
		class RscButtonInvisible_1620: RscCenterRight
		{
			idc=1620;
			x="0.576562 * safezoneW + safezoneX";
			y="0.54537 * safezoneH + safezoneY";
			w="0.0228646 * safezoneW";
			h="0.0150741 * safezoneH";
		};
		class RscButtonInvisible_1621: RscCenterRight
		{
			idc=1621;
			x="0.557292 * safezoneW + safezoneX";
			y="0.453704 * safezoneH + safezoneY";
			w="0.0442187 * safezoneW";
			h="0.0150741 * safezoneH";
		};
		class RscButtonInvisible_1622: RscCenterRight
		{
			idc=1622;
			x="0.573959 * safezoneW + safezoneX";
			y="0.439815 * safezoneH + safezoneY";
			w="0.0228646 * safezoneW";
			h="0.0150741 * safezoneH";
		};
		class RscInteractionText_1007: RscInteractionText
		{
			idc=1006;
			text="";
			x="0.520625 * safezoneW + safezoneX";
			y="0.566 * safezoneH + safezoneY";
			w="0.061875 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscBottomRight: RscButtonInvisible
		{
			action="[5] call DT_fnc_radialButtonPushed;";
			onMouseEnter="ctrlSetText[1204, ""\Dom_UI\radial\BottomRightActive.paa""];";
			onMouseExit="ctrlSetText[1204, ""\Dom_UI\radial\BottomRight.paa""];";
		};
		class RscButtonInvisible_1633: RscBottomRight
		{
			idc=1633;
			x="0.532291 * safezoneW + safezoneX";
			y="0.618519 * safezoneH + safezoneY";
			w="0.0409895 * safezoneW";
			h="0.0244444 * safezoneH";
		};
		class RscButtonInvisible_1634: RscBottomRight
		{
			idc=1634;
			x="0.536094 * safezoneW + safezoneX";
			y="0.637444 * safezoneH + safezoneY";
			w="0.023802 * safezoneW";
			h="0.03 * safezoneH";
		};
		class RscButtonInvisible_1635: RscBottomRight
		{
			idc=1635;
			x="0.532292 * safezoneW + safezoneX";
			y="0.547223 * safezoneH + safezoneY";
			w="0.0352604 * safezoneW";
			h="0.0281481 * safezoneH";
		};
		class RscButtonInvisible_1632: RscBottomRight
		{
			idc=1632;
			x="0.52448 * safezoneW + safezoneX";
			y="0.567593 * safezoneH + safezoneY";
			w="0.0639062 * safezoneW";
			h="0.0512963 * safezoneH";
		};
		class RscInteractionText_1006: RscInteractionText
		{
			idc=1007;
			text="";
			x="0.463906 * safezoneW + safezoneX";
			y="0.621 * safezoneH + safezoneY";
			w="0.061875 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscBottom: RscButtonInvisible
		{
			action="[6] call DT_fnc_radialButtonPushed;";
			onMouseEnter="ctrlSetText[1205, ""\Dom_UI\radial\BottomActive.paa""];";
			onMouseExit="ctrlSetText[1205, ""\Dom_UI\radial\Bottom.paa""];";
		};
		class RscButtonInvisible_1623: RscBottom
		{
			idc=1623;
			x="0.479792 * safezoneW + safezoneX";
			y="0.588296 * safezoneH + safezoneY";
			w="0.0309375 * safezoneW";
			h="0.099 * safezoneH";
		};
		class RscButtonInvisible_1624: RscBottom
		{
			idc=1624;
			x="0.469062 * safezoneW + safezoneX";
			y="0.599 * safezoneH + safezoneY";
			w="0.0124479 * safezoneW";
			h="0.0871852 * safezoneH";
		};
		class RscButtonInvisible_1625: RscBottom
		{
			idc=1625;
			x="0.510312 * safezoneW + safezoneX";
			y="0.599 * safezoneH + safezoneY";
			w="0.0095312 * safezoneW";
			h="0.0828147 * safezoneH";
		};
		class RscButtonInvisible_1626: RscBottom
		{
			idc=1626;
			x="0.518542 * safezoneW + safezoneX";
			y="0.634778 * safezoneH + safezoneY";
			w="0.0116145 * safezoneW";
			h="0.0467036 * safezoneH";
		};
		class RscButtonInvisible_1627: RscBottom
		{
			idc=1627;
			x="0.459896 * safezoneW + safezoneX";
			y="0.639815 * safezoneH + safezoneY";
			w="0.0116145 * safezoneW";
			h="0.0467036 * safezoneH";
		};
		class RscInteractionText_1004: RscInteractionText
		{
			idc=1008;
			text="";
			x="0.402031 * safezoneW + safezoneX";
			y="0.566 * safezoneH + safezoneY";
			w="0.061875 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscBottomLeft: RscButtonInvisible
		{
			action="[7] call DT_fnc_radialButtonPushed;";
			onMouseEnter="ctrlSetText[1206, ""\Dom_UI\radial\BottomLeftActive.paa""];";
			onMouseExit="ctrlSetText[1206, ""\Dom_UI\radial\BottomLeft.paa""];";
		};
		class RscButtonInvisible_1628: RscBottomLeft
		{
			idc=1628;
			x="0.396875 * safezoneW + safezoneX";
			y="0.566 * safezoneH + safezoneY";
			w="0.0670312 * safezoneW";
			h="0.055 * safezoneH";
		};
		class RscButtonInvisible_1629: RscBottomLeft
		{
			idc=1629;
			x="0.41151 * safezoneW + safezoneX";
			y="0.621 * safezoneH + safezoneY";
			w="0.0472395 * safezoneW";
			h="0.0151852 * safezoneH";
		};
		class RscButtonInvisible_1630: RscBottomLeft
		{
			idc=1630;
			x="0.426041 * safezoneW + safezoneX";
			y="0.636111 * safezoneH + safezoneY";
			w="0.0305728 * safezoneW";
			h="0.017963 * safezoneH";
		};
		class RscButtonInvisible_1631: RscBottomLeft
		{
			idc=1631;
			x="0.420312 * safezoneW + safezoneX";
			y="0.548148 * safezoneH + safezoneY";
			w="0.0336979 * safezoneW";
			h="0.0188889 * safezoneH";
		};
		class MiddleButton: RscButtonInvisible
		{
			action="closeDialog 0;";
		};
		class RscButtonInvisible_1636: MiddleButton
		{
			idc=1636;
			x="0.45875 * safezoneW + safezoneX";
			y="0.445 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.11 * safezoneH";
		};
		class RscButtonInvisible_1637: MiddleButton
		{
			idc=1637;
			x="0.461302 * safezoneW + safezoneX";
			y="0.42763 * safezoneH + safezoneY";
			w="0.0634375 * safezoneW";
			h="0.0173704 * safezoneH";
		};
		class RscButtonInvisible_1638: MiddleButton
		{
			idc=1638;
			x="0.467552 * safezoneW + safezoneX";
			y="0.555926 * safezoneH + safezoneY";
			w="0.0535416 * safezoneW";
			h="0.0182963 * safezoneH";
		};
		class RscButtonInvisible_1639: MiddleButton
		{
			idc=1639;
			x="0.448438 * safezoneW + safezoneX";
			y="0.467926 * safezoneH + safezoneY";
			w="0.0108333 * safezoneW";
			h="0.0655185 * safezoneH";
		};
		class RscButtonInvisible_1640: MiddleButton
		{
			idc=1640;
			x="0.530468 * safezoneW + safezoneX";
			y="0.466074 * safezoneH + safezoneY";
			w="0.0082291 * safezoneW";
			h="0.0664444 * safezoneH";
		};
	};
};
class DeathScreen
{
	idd=1002;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	movingEnabled=0;
	class Controls
	{
		class DT_MedicsOnline: RscButtonGeneral
		{
			idc=7304;
			text="Medics: 1";
			x="0.4 * safezoneW + safezoneX";
			y="0.745 * safezoneH + safezoneY";
			w="0.1 * safezoneW";
			h="0.022 * safezoneH";
			onButtonClick="";
		};
		class DT_MedicNearby: RscButtonGeneral
		{
			idc=7305;
			text="Nearest: None";
			x="0.5 * safezoneW + safezoneX";
			y="0.745 * safezoneH + safezoneY";
			w="0.1 * safezoneW";
			h="0.022 * safezoneH";
			onButtonClick="";
		};
		class DT_RespawnButton: RscButtonGeneral
		{
			idc=7302;
			x="0.4 * safezoneW + safezoneX";
			y="0.767 * safezoneH + safezoneY";
			w="0.2 * safezoneW";
			h="0.022 * safezoneH";
			text="Respawn";
			onButtonClick="closeDialog 0; call DT_fnc_respawn;";
		};
		class DT_RespawnTime: RscButtonGeneral
		{
			idc=7301;
			text="";
			x="0.4 * safezoneW + safezoneX";
			y="0.723 * safezoneH + safezoneY";
			w="0.2 * safezoneW";
			h="0.022 * safezoneH";
			onButtonClick="";
		};
		class DT_KilledBy: RscButtonGeneral
		{
			idc=7306;
			text="Bled out";
			x="0.4 * safezoneW + safezoneX";
			y="0.701 * safezoneH + safezoneY";
			w="0.2 * safezoneW";
			h="0.022 * safezoneH";
			onButtonClick="";
		};
	};
};
class DT_craftingMenu
{
	idd=1003;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\misc\crafting.paa";
			x="0.273125 * safezoneW + safezoneX";
			y="0.115 * safezoneH + safezoneY";
			w="0.45375 * safezoneW";
			h="0.77 * safezoneH";
		};
		class RscListbox_1500: RscTreeInvisible
		{
			idc=1500;
			onTreeSelChanged="_this call DT_fnc_craftLBchange";
			x="0.298906 * safezoneW + safezoneX";
			y="0.28 * safezoneH + safezoneY";
			w="0.2 * safezoneW";
			h="0.458 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=1100;
			x="0.505156 * safezoneW + safezoneX";
			y="0.28 * safezoneH + safezoneY";
			w="0.195937 * safezoneW";
			h="0.407 * safezoneH";
		};
		class RscButton_1600: RscButtonGeneral
		{
			idc=1600;
			text="Craft";
			onButtonClick="call DT_fnc_craft";
			x="0.587656 * safezoneW + safezoneX";
			y="0.718 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscCombo_2100: RscCombo
		{
			idc=2100;
			onLBSelChanged="_this call DT_fnc_countCraftLBchange";
			x="0.505156 * safezoneW + safezoneX";
			y="0.718 * safezoneH + safezoneY";
			w="0.075 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscButton_1601: RscButtonGeneral
		{
			idc=1601;
			text="Close";
			onButtonClick="closeDialog 0";
			x="0.649531 * safezoneW + safezoneX";
			y="0.718 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.022 * safezoneH";
		};
	};
};
class DT_nameMenu
{
	idd=1004;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_nameMenu";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\misc\setName.paa";
			x="0.288594 * safezoneW + safezoneX";
			y="0.192 * safezoneH + safezoneY";
			w="0.4125 * safezoneW";
			h="0.638 * safezoneH";
		};
		class RscEdit_1400: RscEditInvisible
		{
			idc=1400;
			maxChars=50;
			colorText[]={1,1,1,1};
			onLoad="(_this select 0) ctrlSetText (['',MB_Interaction_Target] call DT_fnc_findName)";
			x="0.407187 * safezoneW + safezoneX";
			y="0.48 * safezoneH + safezoneY";
			w="0.175313 * safezoneW";
			h="0.03 * safezoneH";
		};
		class RscButton_1600: RscButtonGeneral
		{
			idc=-1;
			text="Set Name";
			onButtonClick="[MB_Interaction_Target] call DT_fnc_setName";
			x="0.448438 * safezoneW + safezoneX";
			y="0.518 * safezoneH + safezoneY";
			w="0.0876563 * safezoneW";
			h="0.0262 * safezoneH";
		};
	};
};
class DT_medicalMenu
{
	idd=1005;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_medicalMenu";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\medical\medicalBase.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1205: RscPicture
		{
			idc=1205;
			text="\Dom_UI\medical\lleg.paa";
			x="0.371094 * safezoneW + safezoneX";
			y="0.236 * safezoneH + safezoneY";
			w="0.299062 * safezoneW";
			h="0.407 * safezoneH";
		};
		class RscPicture_1206: RscPicture
		{
			idc=1206;
			text="\Dom_UI\medical\rleg.paa";
			x="0.371094 * safezoneW + safezoneX";
			y="0.236 * safezoneH + safezoneY";
			w="0.299062 * safezoneW";
			h="0.407 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=1202;
			text="\Dom_UI\medical\torso.paa";
			x="0.371094 * safezoneW + safezoneX";
			y="0.236 * safezoneH + safezoneY";
			w="0.299062 * safezoneW";
			h="0.407 * safezoneH";
		};
		class RscPicture_1203: RscPicture
		{
			idc=1203;
			text="\Dom_UI\medical\larm.paa";
			x="0.371094 * safezoneW + safezoneX";
			y="0.236 * safezoneH + safezoneY";
			w="0.299062 * safezoneW";
			h="0.407 * safezoneH";
		};
		class RscPicture_1204: RscPicture
		{
			idc=1204;
			text="\Dom_UI\medical\rarm.paa";
			x="0.371094 * safezoneW + safezoneX";
			y="0.236 * safezoneH + safezoneY";
			w="0.299062 * safezoneW";
			h="0.407 * safezoneH";
		};
		class RscPicture_1201: RscPicture
		{
			idc=1201;
			text="\Dom_UI\medical\head.paa";
			x="0.371094 * safezoneW + safezoneX";
			y="0.236 * safezoneH + safezoneY";
			w="0.299062 * safezoneW";
			h="0.407 * safezoneH";
		};
		class RscPicture_1210: RscButtonInvisible
		{
			idc=1210;
			tooltip="Select head";
			onButtonClick="['head'] call DT_fnc_updateMedicalMenu";
			x="0.505156 * safezoneW + safezoneX";
			y="0.258 * safezoneH + safezoneY";
			w="0.0309375 * safezoneW";
			h="0.055 * safezoneH";
		};
		class RscPicture_1211: RscButtonInvisible
		{
			idc=1211;
			tooltip="Select torso";
			onButtonClick="['torso'] call DT_fnc_updateMedicalMenu";
			x="0.494844 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.121 * safezoneH";
		};
		class RscPicture_1212: RscButtonInvisible
		{
			idc=1212;
			tooltip="Select left arm";
			onButtonClick="['arm_l'] call DT_fnc_updateMedicalMenu";
			x="0.546406 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.0309375 * safezoneW";
			h="0.154 * safezoneH";
		};
		class RscPicture_1207: RscButtonInvisible
		{
			idc=1207;
			tooltip="Select right arm";
			onButtonClick="['arm_r'] call DT_fnc_updateMedicalMenu";
			x="0.463906 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.0309375 * safezoneW";
			h="0.154 * safezoneH";
		};
		class RscPicture_1208: RscButtonInvisible
		{
			idc=1208;
			tooltip="Select left leg";
			onButtonClick="['leg_l'] call DT_fnc_updateMedicalMenu";
			x="0.520625 * safezoneW + safezoneX";
			y="0.434 * safezoneH + safezoneY";
			w="0.0257812 * safezoneW";
			h="0.187 * safezoneH";
		};
		class RscPicture_1209: RscButtonInvisible
		{
			idc=1209;
			tooltip="Select right leg";
			onButtonClick="['leg_r'] call DT_fnc_updateMedicalMenu";
			x="0.494844 * safezoneW + safezoneX";
			y="0.434 * safezoneH + safezoneY";
			w="0.0257812 * safezoneW";
			h="0.187 * safezoneH";
		};
		class RscListbox_1500: RscListboxInvisible
		{
			idc=1500;
			x="0.207 * safezoneW + safezoneX";
			y="0.655 * safezoneH + safezoneY";
			w="0.413 * safezoneW";
			h="0.169 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=1100;
			x="0.654688 * safezoneW + safezoneX";
			y="0.236 * safezoneH + safezoneY";
			w="0.185625 * safezoneW";
			h="0.396 * safezoneH";
			class Attributes
			{
				font="PuristaLight";
				color="#ffffff";
				align="left";
				shadow=1;
			};
		};
		class RscStructuredText_1101: DT_RscStructuredText
		{
			idc=1101;
			x="0.407187 * safezoneW + safezoneX";
			y="0.17 * safezoneH + safezoneY";
			w="0.237187 * safezoneW";
			h="0.033 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) * 1)";
			class Attributes
			{
				font="PuristaBold";
				color="#ffffff";
				align="center";
				shadow=1;
			};
		};
		class RscStructuredText_1102: DT_RscStructuredText
		{
			idc=1102;
			x="0.654688 * safezoneW + safezoneX";
			y="0.654 * safezoneH + safezoneY";
			w="0.190781 * safezoneW";
			h="0.165 * safezoneH";
			class Attributes
			{
				font="PuristaLight";
				color="#ffffff";
				align="left";
				shadow=1;
			};
		};
		class RscButton_1600: RscButton
		{
			idc=1600;
			onLoad="(_this select 0) ctrlShow false";
			x="0.209 * safezoneW + safezoneX";
			y="0.247 * safezoneH + safezoneY";
			w="0.185625 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscButton_1601: RscButton
		{
			idc=1601;
			onLoad="(_this select 0) ctrlShow false";
			x="0.209 * safezoneW + safezoneX";
			y="0.302 * safezoneH + safezoneY";
			w="0.185625 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscButton_1602: RscButton
		{
			idc=1602;
			onLoad="(_this select 0) ctrlShow false";
			x="0.209 * safezoneW + safezoneX";
			y="0.357 * safezoneH + safezoneY";
			w="0.185625 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscButton_1603: RscButton
		{
			idc=1603;
			onLoad="(_this select 0) ctrlShow false";
			x="0.209 * safezoneW + safezoneX";
			y="0.412 * safezoneH + safezoneY";
			w="0.185625 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscButton_1604: RscButton
		{
			idc=1604;
			onLoad="(_this select 0) ctrlShow false";
			x="0.209 * safezoneW + safezoneX";
			y="0.467 * safezoneH + safezoneY";
			w="0.185625 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscButton_1605: RscButton
		{
			idc=1605;
			onLoad="(_this select 0) ctrlShow false";
			x="0.209 * safezoneW + safezoneX";
			y="0.522 * safezoneH + safezoneY";
			w="0.185625 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscButton_1606: RscButton
		{
			idc=1606;
			onLoad="(_this select 0) ctrlShow false";
			x="0.209 * safezoneW + safezoneX";
			y="0.577 * safezoneH + safezoneY";
			w="0.185625 * safezoneW";
			h="0.044 * safezoneH";
		};
	};
};
class DT_promotionMenu
{
	idd=1006;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_promotionMenu";
	movingEnable=0;
	class controls
	{
		class DT_background: RscText
		{
			idc=-1;
			x="0.427812 * safezoneW + safezoneX";
			y="0.324 * safezoneH + safezoneY";
			w="0.139219 * safezoneW";
			h="0.341 * safezoneH";
			colorBackground[]={0,0,0,0.5};
		};
		class DT_nameBox: RscText
		{
			idc=9200;
			style=2;
			x="0.438125 * safezoneW + safezoneX";
			y="0.335 * safezoneH + safezoneY";
			w="0.12 * safezoneW";
			h="0.04 * safezoneH";
			colorBackground[]={0,0,0,0.69999999};
		};
		class DT_rankBox: DT_RscTree
		{
			idc=9201;
			x="0.438125 * safezoneW + safezoneX";
			y="0.39 * safezoneH + safezoneY";
			w="0.118594 * safezoneW";
			h="0.231 * safezoneH";
		};
		class DT_Accept: RscButtonGeneral
		{
			idc=-1;
			text="Input";
			x="0.5 * safezoneW + safezoneX";
			y="0.632 * safezoneH + safezoneY";
			w="0.0567187 * safezoneW";
			h="0.022 * safezoneH";
			onButtonClick="[true] call DT_fnc_changeRank";
		};
		class DT_Fire: RscButtonGeneral
		{
			idc=-1;
			text="Fire";
			x="0.438125 * safezoneW + safezoneX";
			y="0.632 * safezoneH + safezoneY";
			w="0.0567187 * safezoneW";
			h="0.022 * safezoneH";
			onButtonClick="[false] call DT_fnc_changeRank";
		};
	};
};
class DT_itemShop
{
	idd=1007;
	movingEnable=0;
	onUnLoad="['Item'] call DT_fnc_closeShop";
	onMouseButtonDown="_this call DT_fnc_clickChecker; _this call DT_fnc_onMouseButtonDown";
	onMouseButtonUp="_this call DT_fnc_onMouseButtonUp";
	class controlsBackground
	{
		class DT_background: DT_ctrlStatic
		{
			idc=1100;
			style=16;
			onMouseMoving="_this call DT_fnc_handleMouse";
			onMouseHolding="_this call DT_fnc_handleMouse";
			onMouseZChanged="_this call DT_fnc_handleScroll";
			x="safezoneX";
			y="safezoneY";
			w="safezoneW";
			h="safezoneH";
		};
	};
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\misc\store.paa";
			x="-0.0826563 * safezoneW + safezoneX";
			y="0.016 * safezoneH + safezoneY";
			w="0.391875 * safezoneW";
			h="0.968 * safezoneH";
		};
		class RscListbox_1500: RscTreeInvisible
		{
			idc=1500;
			onTreeSelChanged="_this call DT_fnc_itemShopLBChange";
			x="0.0368 * safezoneW + safezoneX";
			y="0.238 * safezoneH + safezoneY";
			w="0.152 * safezoneW";
			h="0.519 * safezoneH";
		};
		class RscStructuredText_1102: DT_RscStructuredText
		{
			idc=1102;
			x="0.0359375 * safezoneW + safezoneX";
			y="0.775 * safezoneH + safezoneY";
			w="0.149531 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscStructuredText_1101: DT_RscStructuredText
		{
			idc=1101;
			x="0.0307812 * safezoneW + safezoneX";
			y="0.186 * safezoneH + safezoneY";
			w="0.165 * safezoneW";
			h="0.033 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) * 1)";
		};
		class RscButton_1600: RscButtonGeneral
		{
			idc=1600;
			text="Buy";
			onButtonClick="call DT_fnc_itemShopBuySell";
			x="0.118437 * safezoneW + safezoneX";
			y="0.83 * safezoneH + safezoneY";
			w="0.0670312 * safezoneW";
			h="0.0262 * safezoneH";
		};
		class RscButton_1601: RscButtonGeneral
		{
			idc=-1;
			text="Close";
			onButtonClick="closeDialog 0";
			x="0.0359375 * safezoneW + safezoneX";
			y="0.83 * safezoneH + safezoneY";
			w="0.0670312 * safezoneW";
			h="0.0262 * safezoneH";
		};
	};
};
class DT_vehShop
{
	idd=1008;
	name="DT_vehShop";
	movingEnable=0;
	onUnLoad="['Vehicle'] call DT_fnc_closeShop";
	onMouseButtonDown="_this call DT_fnc_clickChecker; _this call DT_fnc_onMouseButtonDown";
	onMouseButtonUp="_this call DT_fnc_onMouseButtonUp";
	class controlsBackground
	{
		class DT_background: DT_ctrlStatic
		{
			idc=1100;
			style=16;
			onMouseMoving="_this call DT_fnc_handleMouse";
			onMouseHolding="_this call DT_fnc_handleMouse";
			onMouseZChanged="_this call DT_fnc_handleScroll";
			x="safezoneX";
			y="safezoneY";
			w="safezoneW";
			h="safezoneH";
		};
	};
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\misc\carShop.paa";
			x="-0.0826563 * safezoneW + safezoneX";
			y="0.016 * safezoneH + safezoneY";
			w="0.391875 * safezoneW";
			h="0.968 * safezoneH";
		};
		class RscListbox_1500: RscListboxInvisible
		{
			idc=1500;
			onLBSelChanged="_this call DT_fnc_vehicleShopLBChange";
			x="0.0368 * safezoneW + safezoneX";
			y="0.238 * safezoneH + safezoneY";
			w="0.152 * safezoneW";
			h="0.429 * safezoneH";
		};
		class RscStructuredText_1102: DT_RscStructuredText
		{
			idc=1102;
			x="0.0359375 * safezoneW + safezoneX";
			y="0.676 * safezoneH + safezoneY";
			w="0.149531 * safezoneW";
			h="0.143 * safezoneH";
		};
		class RscStructuredText_1101: DT_RscStructuredText
		{
			idc=1101;
			x="0.0307812 * safezoneW + safezoneX";
			y="0.186 * safezoneH + safezoneY";
			w="0.165 * safezoneW";
			h="0.033 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) * 1)";
		};
		class RscButton_1600: RscButtonGeneral
		{
			idc=1600;
			text="Buy";
			onButtonClick="call DT_fnc_buyVehicle";
			x="0.118437 * safezoneW + safezoneX";
			y="0.83 * safezoneH + safezoneY";
			w="0.0670312 * safezoneW";
			h="0.0262 * safezoneH";
		};
		class RscCombo_2100: RscCombo
		{
			idc=2100;
			onLBSelChanged="[client_preview,lbValue[2100,(lbCurSel 2100)],true,0] call DT_fnc_setCustomisation";
			x="0.0359375 * safezoneW + safezoneX";
			y="0.83 * safezoneH + safezoneY";
			w="0.0670312 * safezoneW";
			h="0.0262 * safezoneH";
		};
	};
};
class DT_arrestMenu
{
	idd=1009;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_arrestMenu";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\tabletFrame.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1201: RscPicture
		{
			idc=1201;
			onLoad="(_this select 0) ctrlSetText format['\Dom_UI\policeDatabase\Backgrounds\BG_%1',player getVariable ['department','Patrol']]";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\menu_inputArrest.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class nameBox: RscEditInvisible
		{
			idc=1400;
			style="0x02 + 0x0200";
			maxChars=63;
			onLoad="(_this select 0) ctrlSetText (['Unknown',MB_Interaction_Target] call DT_fnc_findName)";
			x="0.335 * safezoneW + safezoneX";
			y="0.344 * safezoneH + safezoneY";
			w="0.27 * safezoneW";
			h="0.02 * safezoneH";
		};
		class crimesBox: RscEditInvisible
		{
			idc=1401;
			style="0x02 + 0x0200 + 0x10";
			text="";
			x="0.335 * safezoneW + safezoneX";
			y="0.415 * safezoneH + safezoneY";
			w="0.27 * safezoneW";
			h="0.08 * safezoneH";
		};
		class timeBox: RscEditInvisible
		{
			idc=1402;
			style="0x02 + 0x0200";
			text="10";
			maxChars=3;
			x="0.335 * safezoneW + safezoneX";
			y="0.542 * safezoneH + safezoneY";
			w="0.27 * safezoneW";
			h="0.02 * safezoneH";
		};
		class bailBox: RscEditInvisible
		{
			idc=1403;
			style="0x02 + 0x0200";
			text="0";
			maxChars=9;
			x="0.335 * safezoneW + safezoneX";
			y="0.613 * safezoneH + safezoneY";
			w="0.27 * safezoneW";
			h="0.02 * safezoneH";
		};
		class notesBox: RscEditInvisible
		{
			idc=1404;
			maxChars=255;
			x="0.62375 * safezoneW + safezoneX";
			y="0.337 * safezoneH + safezoneY";
			w="0.180469 * safezoneW";
			h="0.231 * safezoneH";
		};
		class RscPicture_1203: RscPicture
		{
			idc=1203;
			text="\Dom_UI\policeDatabase\SendToJail_Blue.paa";
			x="0.6875 * safezoneW + safezoneX";
			y="0.6 * safezoneH + safezoneY";
			w="0.1125 * safezoneW";
			h="0.03 * safezoneH";
		};
		class RscButton_1601: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="[MB_Interaction_Target] call DT_fnc_arrestPlayer";
			onMouseEnter="ctrlSetText [1203,'\Dom_UI\policeDatabase\SendToJail.paa']";
			onMouseExit="ctrlSetText [1203,'\Dom_UI\policeDatabase\SendToJail_Blue.paa']";
			x="0.6875 * safezoneW + safezoneX";
			y="0.6 * safezoneH + safezoneY";
			w="0.1125 * safezoneW";
			h="0.03 * safezoneH";
		};
		class RscButton_1604: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="closeDialog 0";
			x="0.737188 * safezoneW + safezoneX";
			y="0.676 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.033 * safezoneH";
		};
	};
};
class DT_jailMenu
{
	idd=1010;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_jailMenu";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\tabletFrame.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1201: RscPicture
		{
			idc=1201;
			onLoad="(_this select 0) ctrlSetText format['\Dom_UI\policeDatabase\Backgrounds\BG_%1',player getVariable ['department','Patrol']]";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\menu_editArrest.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=1100;
			x="0.355625 * safezoneW + safezoneX";
			y="0.335 * safezoneH + safezoneY";
			w="0.340312 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscEdit_1400: RscEditInvisible
		{
			idc=1400;
			maxChars=2;
			x="0.355625 * safezoneW + safezoneX";
			y="0.434 * safezoneH + safezoneY";
			w="0.04125 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscEdit_1401: RscEditInvisible
		{
			idc=1401;
			maxChars=2;
			x="0.453594 * safezoneW + safezoneX";
			y="0.434 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscEdit_1402: RscEditInvisible
		{
			idc=1402;
			maxChars=2;
			x="0.5825 * safezoneW + safezoneX";
			y="0.434 * safezoneH + safezoneY";
			w="0.0464063 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscEdit_1403: RscEditInvisible
		{
			idc=1403;
			x="0.350469 * safezoneW + safezoneX";
			y="0.511 * safezoneH + safezoneY";
			w="0.350625 * safezoneW";
			h="0.088 * safezoneH";
		};
		class RscPicture_1205: RscPicture
		{
			idc=1202;
			text="\Dom_UI\policeDatabase\Update_Blue.paa";
			x="0.505156 * safezoneW + safezoneX";
			y="0.61 * safezoneH + safezoneY";
			w="0.0928125 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscButton_1205: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="[MB_Interaction_Target] call DT_fnc_updateJailTime";
			onMouseEnter="ctrlSetText [1205,'\Dom_UI\policeDatabase\Update.paa']";
			onMouseExit="ctrlSetText [1205,'\Dom_UI\policeDatabase\Update_Blue.paa']";
			x="0.505156 * safezoneW + safezoneX";
			y="0.61 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.039 * safezoneH";
		};
		class RscPicture_1203: RscPicture
		{
			idc=1203;
			text="\Dom_UI\policeDatabase\Cuff_Blue.paa";
			x="0.639219 * safezoneW + safezoneX";
			y="0.61 * safezoneH + safezoneY";
			w="0.103125 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscButton_1203: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="remoteExecCall ['DT_fnc_switchLegCuff',MB_Interaction_Target]";
			onMouseEnter="ctrlSetText [1203,'\Dom_UI\policeDatabase\Cuff.paa']";
			onMouseExit="ctrlSetText [1203,'\Dom_UI\policeDatabase\Cuff_Blue.paa']";
			x="0.639219 * safezoneW + safezoneX";
			y="0.61 * safezoneH + safezoneY";
			w="0.0309375 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscPicture_1204: RscPicture
		{
			idc=1204;
			text="\Dom_UI\policeDatabase\Pickaxe_Blue.paa";
			x="0.365937 * safezoneW + safezoneX";
			y="0.61 * safezoneH + safezoneY";
			w="0.0876563 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscButton_1204: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="[MB_Interaction_Target] call DT_fnc_switchPickaxe;";
			onMouseEnter="ctrlSetText [1204,'\Dom_UI\policeDatabase\Pickaxe.paa']";
			onMouseExit="ctrlSetText [1204,'\Dom_UI\policeDatabase\Pickaxe_Blue.paa']";
			x="0.365937 * safezoneW + safezoneX";
			y="0.61 * safezoneH + safezoneY";
			w="0.0515 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscButton_1604: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="closeDialog 0";
			x="0.737188 * safezoneW + safezoneX";
			y="0.676 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.033 * safezoneH";
		};
	};
};
class DT_garage
{
	idd=1011;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_garage";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\misc\garage.paa";
			x="0.275 * safezoneW + safezoneX";
			y="0.12 * safezoneH + safezoneY";
			w="0.45 * safezoneW";
			h="0.76 * safezoneH";
		};
		class RscListbox_1500: RscListboxInvisible
		{
			idc=1500;
			x="0.311 * safezoneW + safezoneX";
			y="0.337 * safezoneH + safezoneY";
			w="0.383 * safezoneW";
			h="0.31 * safezoneH";
		};
		class RscButton_1600: RscButtonGeneral
		{
			idc=-1;
			text="Destroy";
			action="call DT_fnc_destroyVehicle";
			x="0.497 * safezoneW + safezoneX";
			y="0.678 * safezoneH + safezoneY";
			w="0.0897 * safezoneW";
			h="0.0262 * safezoneH";
		};
		class RscButton_1601: RscButtonGeneral
		{
			idc=-1;
			text="Retrieve";
			action="call DT_fnc_getVehicle";
			x="0.6044 * safezoneW + safezoneX";
			y="0.678 * safezoneH + safezoneY";
			w="0.0897 * safezoneW";
			h="0.0262 * safezoneH";
		};
	};
};
class DT_giveMoney
{
	idd=1012;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_giveMoney";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\misc\setName.paa";
			x="0.288594 * safezoneW + safezoneX";
			y="0.192 * safezoneH + safezoneY";
			w="0.4125 * safezoneW";
			h="0.638 * safezoneH";
		};
		class RscEdit_1400: RscEditInvisible
		{
			idc=1400;
			maxChars=50;
			colorText[]={1,1,1,1};
			text="0";
			x="0.407187 * safezoneW + safezoneX";
			y="0.48 * safezoneH + safezoneY";
			w="0.175313 * safezoneW";
			h="0.03 * safezoneH";
		};
		class RscButton_1600: RscButtonGeneral
		{
			idc=-1;
			text="Give money";
			onButtonClick="[MB_Interaction_Target] call DT_fnc_giveMoney";
			x="0.448438 * safezoneW + safezoneX";
			y="0.518 * safezoneH + safezoneY";
			w="0.0876563 * safezoneW";
			h="0.0262 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=1100;
			x="0.396875 * safezoneW + safezoneX";
			y="0.442 * safezoneH + safezoneY";
			w="0.195937 * safezoneW";
			h="0.022 * safezoneH";
		};
	};
};
class DT_clothingShop
{
	idd=1013;
	name="DT_clothingShop";
	onUnload="['Clothing'] call DT_fnc_closeShop";
	onMouseButtonDown="_this call DT_fnc_clickChecker; _this call DT_fnc_onMouseButtonDown";
	onMouseButtonUp="_this call DT_fnc_onMouseButtonUp";
	movingEnable=0;
	class controlsBackground
	{
		class DT_background: DT_ctrlStatic
		{
			idc=1100;
			style=16;
			onMouseMoving="_this call DT_fnc_handleMouse";
			onMouseHolding="_this call DT_fnc_handleMouse";
			onMouseZChanged="_this call DT_fnc_handleScroll";
			x="safezoneX";
			y="safezoneY";
			w="safezoneW";
			h="safezoneH";
		};
	};
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\misc\store.paa";
			x="-0.0826563 * safezoneW + safezoneX";
			y="0.016 * safezoneH + safezoneY";
			w="0.391875 * safezoneW";
			h="0.968 * safezoneH";
		};
		class RscListbox_1500: RscTreeInvisible
		{
			idc=1500;
			onTreeSelChanged="_this call DT_fnc_previewClothing";
			x="0.0368 * safezoneW + safezoneX";
			y="0.238 * safezoneH + safezoneY";
			w="0.152 * safezoneW";
			h="0.519 * safezoneH";
		};
		class RscStructuredText_1102: DT_RscStructuredText
		{
			idc=1102;
			x="0.0359375 * safezoneW + safezoneX";
			y="0.775 * safezoneH + safezoneY";
			w="0.149531 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscStructuredText_1101: DT_RscStructuredText
		{
			idc=1101;
			x="0.0307812 * safezoneW + safezoneX";
			y="0.186 * safezoneH + safezoneY";
			w="0.165 * safezoneW";
			h="0.033 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) * 1)";
		};
		class RscButton_1600: RscButtonGeneral
		{
			idc=1600;
			text="Buy";
			onButtonClick="call DT_fnc_buyClothing";
			x="0.118437 * safezoneW + safezoneX";
			y="0.83 * safezoneH + safezoneY";
			w="0.0670312 * safezoneW";
			h="0.0262 * safezoneH";
		};
		class RscButton_1601: RscButtonGeneral
		{
			idc=-1;
			text="Close";
			onButtonClick="closeDialog 0";
			x="0.0359375 * safezoneW + safezoneX";
			y="0.83 * safezoneH + safezoneY";
			w="0.0670312 * safezoneW";
			h="0.0262 * safezoneH";
		};
	};
};
class DT_keyMenu
{
	idd=1014;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_keyMenu";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\misc\giveKeys.paa";
			x="0.288594 * safezoneW + safezoneX";
			y="0.192 * safezoneH + safezoneY";
			w="0.4125 * safezoneW";
			h="0.638 * safezoneH";
		};
		class RscListbox_1500: RscListboxInvisible
		{
			idc=1500;
			x="0.319531 * safezoneW + safezoneX";
			y="0.428 * safezoneH + safezoneY";
			w="0.350625 * safezoneW";
			h="0.176 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=1100;
			text="Give key to: Unknown";
			x="0.304062 * safezoneW + safezoneX";
			y="0.375 * safezoneH + safezoneY";
			w="0.381563 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscButton_1600: RscButtonGeneral
		{
			idc=-1;
			text="Give key";
			onButtonClick="[MB_Interaction_Target] call DT_fnc_giveKey";
			x="0.448438 * safezoneW + safezoneX";
			y="0.617 * safezoneH + safezoneY";
			w="0.0876563 * safezoneW";
			h="0.0262 * safezoneH";
		};
	};
};
class DT_ticketMenu
{
	idd=1015;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_ticketMenu";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\tabletFrame.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1201: RscPicture
		{
			idc=1201;
			onLoad="(_this select 0) ctrlSetText format['\Dom_UI\policeDatabase\Backgrounds\BG_%1',player getVariable ['department','Patrol']]";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\menu_inputTicket.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class nameBox: RscEditInvisible
		{
			idc=1400;
			style="0x02 + 0x0200";
			maxChars=63;
			onLoad="(_this select 0) ctrlSetText (['Unknown',MB_Interaction_Target] call DT_fnc_findName)";
			x="0.39 * safezoneW + safezoneX";
			y="0.344 * safezoneH + safezoneY";
			w="0.27 * safezoneW";
			h="0.02 * safezoneH";
		};
		class crimesBox: RscEditInvisible
		{
			idc=1401;
			style="0x02 + 0x0200 + 0x10";
			text="";
			x="0.39 * safezoneW + safezoneX";
			y="0.415 * safezoneH + safezoneY";
			w="0.27 * safezoneW";
			h="0.08 * safezoneH";
		};
		class costBox: RscEditInvisible
		{
			idc=1402;
			style="0x02 + 0x0200";
			maxChars=7;
			text="";
			x="0.39 * safezoneW + safezoneX";
			y="0.542 * safezoneH + safezoneY";
			w="0.27 * safezoneW";
			h="0.02 * safezoneH";
		};
		class officerBox: RscEditInvisible
		{
			idc=1403;
			style="0x02 + 0x0200";
			maxChars=64;
			onLoad="(_this select 0) ctrlSetText profileName";
			x="0.39 * safezoneW + safezoneX";
			y="0.613 * safezoneH + safezoneY";
			w="0.27 * safezoneW";
			h="0.02 * safezoneH";
		};
		class RscPicture_1203: RscPicture
		{
			idc=1203;
			text="\Dom_UI\policeDatabase\Issue_Citation_Blue.paa";
			x="0.6875 * safezoneW + safezoneX";
			y="0.6 * safezoneH + safezoneY";
			w="0.1125 * safezoneW";
			h="0.03 * safezoneH";
		};
		class RscButton_1601: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="[MB_Interaction_Target,false] call DT_fnc_giveTicket";
			onMouseEnter="ctrlSetText [1203,'\Dom_UI\policeDatabase\Issue_Citation.paa']";
			onMouseExit="ctrlSetText [1203,'\Dom_UI\policeDatabase\Issue_Citation_Blue.paa']";
			x="0.6875 * safezoneW + safezoneX";
			y="0.6 * safezoneH + safezoneY";
			w="0.1125 * safezoneW";
			h="0.03 * safezoneH";
		};
		class RscPicture_1204: RscPicture
		{
			idc=1204;
			text="\Dom_UI\policeDatabase\Issue_Bail_Blue.paa";
			x="0.6875 * safezoneW + safezoneX";
			y="0.55 * safezoneH + safezoneY";
			w="0.1125 * safezoneW";
			h="0.03 * safezoneH";
		};
		class RscButton_1602: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="[MB_Interaction_Target,true] call DT_fnc_giveTicket";
			onMouseEnter="ctrlSetText [1204,'\Dom_UI\policeDatabase\Issue_Bail.paa']";
			onMouseExit="ctrlSetText [1204,'\Dom_UI\policeDatabase\Issue_Bail_Blue.paa']";
			x="0.6875 * safezoneW + safezoneX";
			y="0.55 * safezoneH + safezoneY";
			w="0.1125 * safezoneW";
			h="0.03 * safezoneH";
		};
		class RscButton_1604: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="closeDialog 0";
			x="0.737188 * safezoneW + safezoneX";
			y="0.676 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.033 * safezoneH";
		};
	};
};
class DT_recieveTicket
{
	idd=1016;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_recieveTicket";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\police\ticket.paa";
			x="0.365937 * safezoneW + safezoneX";
			y="0.225 * safezoneH + safezoneY";
			w="0.273281 * safezoneW";
			h="0.528 * safezoneH";
		};
		class RscPicture_1201: RscPicture
		{
			idc=1201;
			text="\Dom_UI\police\ticket_sign_base.paa";
			x="0.43 * safezoneW + safezoneX";
			y="0.62 * safezoneH + safezoneY";
			w="0.05 * safezoneW";
			h="0.02 * safezoneH";
		};
		class RscButton_1606: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="[true] call DT_fnc_respondTicket";
			onMouseEnter="ctrlSetText [1201,'\Dom_UI\police\ticket_sign.paa']";
			onMouseExit="ctrlSetText [1201,'\Dom_UI\police\ticket_sign_base.paa']";
			x="0.425 * safezoneW + safezoneX";
			y="0.62 * safezoneH + safezoneY";
			w="0.059 * safezoneW";
			h="0.017 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=1202;
			text="\Dom_UI\police\ticket_refuse_base.paa";
			x="0.5125 * safezoneW + safezoneX";
			y="0.62 * safezoneH + safezoneY";
			w="0.0625 * safezoneW";
			h="0.02 * safezoneH";
		};
		class RscButton_1607: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="[false] call DT_fnc_respondTicket";
			onMouseEnter="ctrlSetText [1202,'\Dom_UI\police\ticket_refuse.paa']";
			onMouseExit="ctrlSetText [1202,'\Dom_UI\police\ticket_refuse_base.paa']";
			x="0.5125 * safezoneW + safezoneX";
			y="0.62 * safezoneH + safezoneY";
			w="0.0625 * safezoneW";
			h="0.017 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=1100;
			x="0.406 * safezoneW + safezoneX";
			y="0.4 * safezoneH + safezoneY";
			w="0.192 * safezoneW";
			h="0.03 * safezoneH";
		};
		class RscStructuredText_1101: DT_RscStructuredText
		{
			idc=1101;
			x="0.406 * safezoneW + safezoneX";
			y="0.457 * safezoneH + safezoneY";
			w="0.192 * safezoneW";
			h="0.027 * safezoneH";
		};
		class RscStructuredText_1102: DT_RscStructuredText
		{
			idc=1102;
			x="0.406 * safezoneW + safezoneX";
			y="0.5079 * safezoneH + safezoneY";
			w="0.192 * safezoneW";
			h="0.027 * safezoneH";
		};
		class RscStructuredText_1103: DT_RscStructuredText
		{
			idc=1103;
			x="0.406 * safezoneW + safezoneX";
			y="0.562 * safezoneH + safezoneY";
			w="0.192 * safezoneW";
			h="0.027 * safezoneH";
		};
	};
};
class DT_profileSearch
{
	idd=1017;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_profileSearch";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\tabletFrame.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1201: RscPicture
		{
			idc=1201;
			onLoad="(_this select 0) ctrlSetText format['\Dom_UI\policeDatabase\Backgrounds\BG_%1',player getVariable ['department','Patrol']]";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\menu_searchPlayer.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscListbox_1500: RscTreeInvisible
		{
			idc=1500;
			onTreeSelChanged="_this call DT_fnc_profileLBchange";
			x="0.247344 * safezoneW + safezoneX";
			y="0.36 * safezoneH + safezoneY";
			w="0.214 * safezoneW";
			h="0.272 * safezoneH";
		};
		class RscEdit_1400: RscEditInvisible
		{
			idc=1400;
			style="0x00 + 0x0200";
			maxChars=50;
			x="0.324687 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.268125 * safezoneW";
			h="0.026 * safezoneH";
		};
		class RscButton_1600: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="[true] call DT_fnc_search";
			x="0.6 * safezoneW + safezoneX";
			y="0.3 * safezoneH + safezoneY";
			w="0.075 * safezoneW";
			h="0.04 * safezoneH";
		};
		class RscControlsGroup_2300: RscControlsGroup
		{
			idc=2300;
			x="0.479375 * safezoneW + safezoneX";
			y="0.357 * safezoneH + safezoneY";
			w="0.324844 * safezoneW";
			h="0.275 * safezoneH";
			class Controls
			{
				class RscStructuredText_1100: DT_RscStructuredText
				{
					idc=1100;
					text="";
					sizeEx=0.025;
					x="0 * safezoneW + safezoneX";
					y="0 * safezoneH + safezoneY";
					w="0.324844 * safezoneW";
					h="0.275 * safezoneH";
				};
			};
		};
		class RscButton_1603: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="['init'] call DT_fnc_createWarrant";
			onMouseEnter="ctrlSetText [1203,'\Dom_UI\policeDatabase\Create_Warrant.paa']";
			onMouseExit="ctrlSetText [1203,'\Dom_UI\policeDatabase\Create_Warrant_Blue.paa']";
			x="0.690781 * safezoneW + safezoneX";
			y="0.315 * safezoneH + safezoneY";
			w="0.1 * safezoneW";
			h="0.02 * safezoneH";
		};
		class RscPicture_1203: RscPicture
		{
			idc=1203;
			text="\Dom_UI\policeDatabase\Create_Warrant_Blue.paa";
			x="0.690781 * safezoneW + safezoneX";
			y="0.315 * safezoneH + safezoneY";
			w="0.1 * safezoneW";
			h="0.02 * safezoneH";
		};
		class RscButton_1604: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="closeDialog 0";
			x="0.737188 * safezoneW + safezoneX";
			y="0.676 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.033 * safezoneH";
		};
	};
};
class DT_policeDatabaseMain
{
	idd=1018;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_policeDatabaseMain";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\tabletFrame.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1201: RscPicture
		{
			idc=1201;
			onLoad="(_this select 0) ctrlSetText format['\Dom_UI\policeDatabase\Backgrounds\BG_%1',player getVariable ['department','Patrol']]";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\menu_mainMenu.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscListbox_1500: RscListboxInvisible
		{
			idc=1500;
			x="0.558 * safezoneW + safezoneX";
			y="0.395 * safezoneH + safezoneY";
			w="0.245 * safezoneW";
			h="0.15 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=1100;
			text="";
			x="0.5625 * safezoneW + safezoneX";
			y="0.6 * safezoneH + safezoneY";
			w="0.2375 * safezoneW";
			h="0.03 * safezoneH";
			class Attributes
			{
				font="PuristaSemiBold";
				color="#ffffff";
				align="center";
				shadow=1;
			};
		};
		class RscStructuredText_1101: DT_RscStructuredText
		{
			idc=1101;
			text="";
			x="0.325 * safezoneW + safezoneX";
			y="0.3 * safezoneH + safezoneY";
			w="0.4875 * safezoneW";
			h="0.045 * safezoneH";
		};
		class RscPicture_1203: RscPicture
		{
			idc=1203;
			text="\Dom_UI\policeDatabase\Search_Police_Records_Blue.paa";
			x="0.2375 * safezoneW + safezoneX";
			y="0.42 * safezoneH + safezoneY";
			w="0.15 * safezoneW";
			h="0.02 * safezoneH";
		};
		class RscButton_1603: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="createDialog 'DT_profileSearch'";
			onMouseEnter="ctrlSetText [1203,'\Dom_UI\policeDatabase\Search_Police_Records.paa']";
			onMouseExit="ctrlSetText [1203,'\Dom_UI\policeDatabase\Search_Police_Records_Blue.paa']";
			x="0.2375 * safezoneW + safezoneX";
			y="0.42 * safezoneH + safezoneY";
			w="0.15 * safezoneW";
			h="0.02 * safezoneH";
		};
		class RscPicture_1204: RscPicture
		{
			idc=1204;
			text="\Dom_UI\policeDatabase\View_Active_Warrants_Blue.paa";
			x="0.2375 * safezoneW + safezoneX";
			y="0.5 * safezoneH + safezoneY";
			w="0.15 * safezoneW";
			h="0.02 * safezoneH";
		};
		class RscButton_1604: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="call DT_fnc_initWarrants";
			onMouseEnter="ctrlSetText [1204,'\Dom_UI\policeDatabase\View_Active_Warrants.paa']";
			onMouseExit="ctrlSetText [1204,'\Dom_UI\policeDatabase\View_Active_Warrants_Blue.paa']";
			x="0.2375 * safezoneW + safezoneX";
			y="0.5 * safezoneH + safezoneY";
			w="0.15 * safezoneW";
			h="0.02 * safezoneH";
		};
		class RscPicture_1205: RscPicture
		{
			idc=1205;
			text="\Dom_UI\policeDatabase\Manage_Blue.paa";
			onLoad="if (player getVariable ['copRank',0] < 5) then {(_this select 0) ctrlShow false}";
			x="0.2378 * safezoneW + safezoneX";
			y="0.58 * safezoneH + safezoneY";
			w="0.0875 * safezoneW";
			h="0.026 * safezoneH";
		};
		class RscButton_1605: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="createDialog 'DT_policeManagement'";
			onMouseEnter="ctrlSetText [1205,'\Dom_UI\policeDatabase\Manage.paa']";
			onMouseExit="ctrlSetText [1205,'\Dom_UI\policeDatabase\Manage_Blue.paa']";
			onLoad="if (player getVariable ['copRank',0] < 5) then {(_this select 0) ctrlEnable false}";
			x="0.2378 * safezoneW + safezoneX";
			y="0.58 * safezoneH + safezoneY";
			w="0.055 * safezoneW";
			h="0.026 * safezoneH";
		};
		class RscPicture_1206: RscPicture
		{
			idc=1206;
			text="\Dom_UI\policeDatabase\Search_DMV_Records_Blue.paa";
			x="0.2375 * safezoneW + safezoneX";
			y="0.46 * safezoneH + safezoneY";
			w="0.15 * safezoneW";
			h="0.02 * safezoneH";
		};
		class RscButton_1606: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="createDialog 'DT_vehicleSearch'";
			onMouseEnter="ctrlSetText [1206,'\Dom_UI\policeDatabase\Search_DMV_Records.paa']";
			onMouseExit="ctrlSetText [1206,'\Dom_UI\policeDatabase\Search_DMV_Records_Blue.paa']";
			x="0.2375 * safezoneW + safezoneX";
			y="0.46 * safezoneH + safezoneY";
			w="0.15 * safezoneW";
			h="0.02 * safezoneH";
		};
		class RscPicture_1208: RscPicture
		{
			idc=1208;
			text="\Dom_UI\policeDatabase\Create_BOLO_Blue.paa";
			x="0.2375 * safezoneW + safezoneX";
			y="0.54 * safezoneH + safezoneY";
			w="0.0928125 * safezoneW";
			h="0.02 * safezoneH";
		};
		class RscButton_1608: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="createDialog 'DT_addBOLO'";
			onMouseEnter="ctrlSetText [1208,'\Dom_UI\policeDatabase\Create_BOLO.paa']";
			onMouseExit="ctrlSetText [1208,'\Dom_UI\policeDatabase\Create_BOLO_Blue.paa']";
			x="0.2375 * safezoneW + safezoneX";
			y="0.54 * safezoneH + safezoneY";
			w="0.0773437 * safezoneW";
			h="0.02 * safezoneH";
		};
		class RscPicture_1209: RscPicture
		{
			idc=1209;
			text="\Dom_UI\policeDatabase\Criminal_Code_Blue.paa";
			x="0.237547 * safezoneW + safezoneX";
			y="0.38 * safezoneH + safezoneY";
			w="0.15 * safezoneW";
			h="0.02 * safezoneH";
		};
		class RscButton_1609: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="call DT_fnc_initCriminalCode";
			onMouseEnter="ctrlSetText [1209,'\Dom_UI\policeDatabase\Criminal_Code.paa']";
			onMouseExit="ctrlSetText [1209,'\Dom_UI\policeDatabase\Criminal_Code_Blue.paa']";
			x="0.237547 * safezoneW + safezoneX";
			y="0.38 * safezoneH + safezoneY";
			w="0.1 * safezoneW";
			h="0.02 * safezoneH";
		};
		class RscButton_1607: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="closeDialog 0";
			x="0.737188 * safezoneW + safezoneX";
			y="0.676 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.033 * safezoneH";
		};
	};
};
class DT_viewWarrants
{
	idd=1019;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_viewWarrants";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\tabletFrame.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1201: RscPicture
		{
			idc=1201;
			onLoad="(_this select 0) ctrlSetText format['\Dom_UI\policeDatabase\Backgrounds\BG_%1',player getVariable ['department','Patrol']]";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\menu_viewWarrants.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscListbox_1500: RscTreeInvisibleSearch
		{
			idc=1500;
			onTreeSelChanged="_this call DT_fnc_warBOLOLBchange";
			x="0.242187 * safezoneW + safezoneX";
			y="0.357 * safezoneH + safezoneY";
			w="0.216563 * safezoneW";
			h="0.275 * safezoneH";
		};
		class RscEdit_1400: RscEditInvisible
		{
			idc=645;
			style="0x00 + 0x0200";
			maxChars=50;
			x="0.324687 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.268125 * safezoneW";
			h="0.026 * safezoneH";
		};
		class RscControlsGroup_2300: RscControlsGroup
		{
			idc=2300;
			x="0.474219 * safezoneW + safezoneX";
			y="0.357 * safezoneH + safezoneY";
			w="0.235 * safezoneW";
			h="0.275 * safezoneH";
			class Controls
			{
				class RscStructuredText_1100: DT_RscStructuredText
				{
					idc=1205;
					text="";
					sizeEx=0.025;
					x="0 * safezoneW + safezoneX";
					y="0 * safezoneH + safezoneY";
					w="0.235 * safezoneW";
					h="0.275 * safezoneH";
				};
			};
		};
		class RscPicture_1206: RscPicture
		{
			idc=1206;
			text="\Dom_UI\policeDatabase\Complete_Blue.paa";
			x="0.732031 * safezoneW + safezoneX";
			y="0.61 * safezoneH + safezoneY";
			w="0.0670312 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscButton_1605: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="['complete'] call DT_fnc_updateWarrant";
			onMouseEnter="ctrlSetText [1206,'\Dom_UI\policeDatabase\Complete.paa']";
			onMouseExit="ctrlSetText [1206,'\Dom_UI\policeDatabase\Complete_Blue.paa']";
			x="0.732031 * safezoneW + safezoneX";
			y="0.61 * safezoneH + safezoneY";
			w="0.0670312 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscPicture_1203: RscPicture
		{
			idc=1203;
			text="\Dom_UI\policeDatabase\Remove_Blue.paa";
			x="0.732031 * safezoneW + safezoneX";
			y="0.566 * safezoneH + safezoneY";
			w="0.0567187 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscButton_1608: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="['remove'] call DT_fnc_updateWarrant";
			onMouseEnter="ctrlSetText [1203,'\Dom_UI\policeDatabase\Remove.paa']";
			onMouseExit="ctrlSetText [1203,'\Dom_UI\policeDatabase\Remove_Blue.paa']";
			x="0.732031 * safezoneW + safezoneX";
			y="0.566 * safezoneH + safezoneY";
			w="0.0567187 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscPicture_1204: RscPicture
		{
			idc=1204;
			text="\Dom_UI\policeDatabase\Approve_Blue.paa";
			x="0.732031 * safezoneW + safezoneX";
			y="0.522 * safezoneH + safezoneY";
			w="0.061875 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscButton_1606: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="['approve'] call DT_fnc_updateWarrant";
			onMouseEnter="ctrlSetText [1204,'\Dom_UI\policeDatabase\Approve.paa']";
			onMouseExit="ctrlSetText [1204,'\Dom_UI\policeDatabase\Approve_Blue.paa']";
			x="0.732031 * safezoneW + safezoneX";
			y="0.522 * safezoneH + safezoneY";
			w="0.061875 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscButton_1600: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="";
			x="0.6 * safezoneW + safezoneX";
			y="0.3 * safezoneH + safezoneY";
			w="0.075 * safezoneW";
			h="0.04 * safezoneH";
		};
		class RscButton_1607: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="closeDialog 0";
			x="0.737188 * safezoneW + safezoneX";
			y="0.676 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.033 * safezoneH";
		};
	};
};
class DT_vehicleSearch
{
	idd=1020;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_vehicleSearch";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\tabletFrame.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1201: RscPicture
		{
			idc=1201;
			onLoad="(_this select 0) ctrlSetText format['\Dom_UI\policeDatabase\Backgrounds\BG_%1',player getVariable ['department','Patrol']]";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\menu_searchPlate.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscEdit_1400: RscEditInvisible
		{
			idc=1400;
			style="0x00 + 0x0200";
			maxChars=50;
			x="0.324687 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.268125 * safezoneW";
			h="0.026 * safezoneH";
		};
		class RscButton_1600: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="[false] call DT_fnc_search";
			x="0.6 * safezoneW + safezoneX";
			y="0.3 * safezoneH + safezoneY";
			w="0.075 * safezoneW";
			h="0.04 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=1100;
			text="";
			x="0.335 * safezoneW + safezoneX";
			y="0.398 * safezoneH + safezoneY";
			w="0.340312 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscStructuredText_1101: DT_RscStructuredText
		{
			idc=1101;
			text="";
			x="0.335 * safezoneW + safezoneX";
			y="0.522 * safezoneH + safezoneY";
			w="0.340312 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscStructuredText_1102: DT_RscStructuredText
		{
			idc=1102;
			text="";
			x="0.335 * safezoneW + safezoneX";
			y="0.588 * safezoneH + safezoneY";
			w="0.340312 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscStructuredText_1103: DT_RscStructuredText
		{
			idc=1103;
			text="";
			x="0.335 * safezoneW + safezoneX";
			y="0.46 * safezoneH + safezoneY";
			w="0.340312 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscButton_1604: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="closeDialog 0";
			x="0.737188 * safezoneW + safezoneX";
			y="0.676 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.033 * safezoneH";
		};
	};
};
class DT_policeManagement
{
	idd=1021;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_policeManagement";
	movingEnable=0;
	onUnload="['close'] spawn DT_fnc_manage";
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\tabletFrame.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1201: RscPicture
		{
			idc=1201;
			onLoad="(_this select 0) ctrlSetText format['\Dom_UI\policeDatabase\Backgrounds\BG_%1',player getVariable ['department','Patrol']]";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1206: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\menu_management.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1207: RscPicture
		{
			idc=1207;
			text="\Dom_UI\policeDatabase\Update_Blue.paa";
			x="0.355625 * safezoneW + safezoneX";
			y="0.61 * safezoneH + safezoneY";
			w="0.0928125 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscButton_1201: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="['changeRank'] call DT_fnc_manage";
			onMouseEnter="ctrlSetText [1207,'\Dom_UI\policeDatabase\Update.paa']";
			onMouseExit="ctrlSetText [1207,'\Dom_UI\policeDatabase\Update_Blue.paa']";
			x="0.355625 * safezoneW + safezoneX";
			y="0.61 * safezoneH + safezoneY";
			w="0.0515 * safezoneW";
			h="0.029 * safezoneH";
		};
		class RscEdit_1400: RscEditInvisible
		{
			idc=1400;
			onLoad="(_this select 0) ctrlSetText PD_announcement";
			maxChars=140;
			x="0.556719 * safezoneW + safezoneX";
			y="0.348 * safezoneH + safezoneY";
			w="0.251 * safezoneW";
			h="0.088 * safezoneH";
		};
		class RscEdit_1401: RscEditInvisible
		{
			idc=1401;
			onLoad="(_this select 0) ctrlSetText threat_level";
			maxChars=8;
			x="0.556719 * safezoneW + safezoneX";
			y="0.518 * safezoneH + safezoneY";
			w="0.251 * safezoneW";
			h="0.088 * safezoneH";
		};
		class RscListbox_1500: RscTreeInvisible
		{
			idc=1500;
			x="0.247344 * safezoneW + safezoneX";
			y="0.349 * safezoneH + safezoneY";
			w="0.2782 * safezoneW";
			h="0.13 * safezoneH";
		};
		class RscListbox_1501: RscTreeInvisible
		{
			idc=1501;
			x="0.247344 * safezoneW + safezoneX";
			y="0.489 * safezoneH + safezoneY";
			w="0.2782 * safezoneW";
			h="0.113 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=1202;
			text="\Dom_UI\policeDatabase\Refresh_Blue.paa";
			x="0.247344 * safezoneW + safezoneX";
			y="0.61 * safezoneH + safezoneY";
			w="0.0876563 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscButton_1202: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="['populatePolice'] remoteExecCall ['DB_fnc_manageUpdate',2]";
			onMouseEnter="ctrlSetText [1202,'\Dom_UI\policeDatabase\Refresh.paa']";
			onMouseExit="ctrlSetText [1202,'\Dom_UI\policeDatabase\Refresh_Blue.paa']";
			x="0.247344 * safezoneW + safezoneX";
			y="0.61 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.024 * safezoneH";
		};
		class RscPicture_1204: RscPicture
		{
			idc=1204;
			text="\Dom_UI\policeDatabase\Remove_Blue.paa";
			x="0.463906 * safezoneW + safezoneX";
			y="0.61 * safezoneH + safezoneY";
			w="0.061875 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscButton_1204: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="['fire'] call DT_fnc_manage";
			onMouseEnter="ctrlSetText [1204,'\Dom_UI\policeDatabase\Remove.paa']";
			onMouseExit="ctrlSetText [1204,'\Dom_UI\policeDatabase\Remove_Blue.paa']";
			x="0.463906 * safezoneW + safezoneX";
			y="0.61 * safezoneH + safezoneY";
			w="0.061875 * safezoneW";
			h="0.029 * safezoneH";
		};
		class RscPicture_1203: RscPicture
		{
			idc=1203;
			text="\Dom_UI\policeDatabase\Update_Blue.paa";
			x="0.654688 * safezoneW + safezoneX";
			y="0.445 * safezoneH + safezoneY";
			w="0.0928125 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscButton_1203: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="['updateAnnouncement'] call DT_fnc_manage";
			onMouseEnter="ctrlSetText [1203,'\Dom_UI\policeDatabase\Update.paa']";
			onMouseExit="ctrlSetText [1203,'\Dom_UI\policeDatabase\Update_Blue.paa']";
			x="0.654688 * safezoneW + safezoneX";
			y="0.445 * safezoneH + safezoneY";
			w="0.0515 * safezoneW";
			h="0.029 * safezoneH";
		};
		class RscPicture_1205: RscPicture
		{
			idc=1205;
			text="\Dom_UI\policeDatabase\Update_Blue.paa";
			x="0.654688 * safezoneW + safezoneX";
			y="0.61 * safezoneH + safezoneY";
			w="0.0928125 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscButton_1205: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="['updateThreat'] call DT_fnc_manage";
			onMouseEnter="ctrlSetText [1205,'\Dom_UI\policeDatabase\Update.paa']";
			onMouseExit="ctrlSetText [1205,'\Dom_UI\policeDatabase\Update_Blue.paa']";
			x="0.654688 * safezoneW + safezoneX";
			y="0.61 * safezoneH + safezoneY";
			w="0.0515 * safezoneW";
			h="0.029 * safezoneH";
		};
		class RscButton_1604: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="closeDialog 0";
			x="0.737188 * safezoneW + safezoneX";
			y="0.676 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.033 * safezoneH";
		};
	};
};
class DT_addWarrant
{
	idd=1022;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_addWarrant";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\tabletFrame.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1201: RscPicture
		{
			idc=1201;
			onLoad="(_this select 0) ctrlSetText format['\Dom_UI\policeDatabase\Backgrounds\BG_%1',player getVariable ['department','Patrol']]";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\menu_createWarrant.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscEdit_1403: RscEditInvisible
		{
			idc=1403;
			style="0x00 + 0x0200";
			maxChars=63;
			x="0.262 * safezoneW + safezoneX";
			y="0.379 * safezoneH + safezoneY";
			w="0.279 * safezoneW";
			h="0.025 * safezoneH";
		};
		class RscEdit_1402: RscEditInvisible
		{
			idc=1402;
			style="0x00 + 0x0200";
			onLoad="(_this select 0) ctrlSetText profileName";
			maxChars=63;
			x="0.262 * safezoneW + safezoneX";
			y="0.445 * safezoneH + safezoneY";
			w="0.28 * safezoneW";
			h="0.025 * safezoneH";
		};
		class RscEdit_1400: RscEditInvisible
		{
			idc=1400;
			x="0.556719 * safezoneW + safezoneX";
			y="0.348 * safezoneH + safezoneY";
			w="0.25 * safezoneW";
			h="0.088 * safezoneH";
		};
		class RscEdit_1401: RscEditInvisible
		{
			idc=1401;
			x="0.556719 * safezoneW + safezoneX";
			y="0.478 * safezoneH + safezoneY";
			w="0.25 * safezoneW";
			h="0.158 * safezoneH";
		};
		class RscCheckbox_2801: RscCheckBox
		{
			idc=2801;
			x="0.381406 * safezoneW + safezoneX";
			y="0.533 * safezoneH + safezoneY";
			w="0.020625 * safezoneW";
			h="0.033 * safezoneH";
			onCheckedChanged="private _otherBox = (findDisplay 1022) displayCtrl 2800; if ((_this select 1) isEqualTo 1 && {cbChecked _otherBox}) then {_otherBox cbSetChecked false};";
		};
		class RscCheckbox_2800: RscCheckBox
		{
			idc=2800;
			x="0.283437 * safezoneW + safezoneX";
			y="0.533 * safezoneH + safezoneY";
			w="0.020625 * safezoneW";
			h="0.033 * safezoneH";
			onCheckedChanged="private _otherBox = (findDisplay 1022) displayCtrl 2801; if ((_this select 1) isEqualTo 1 && {cbChecked _otherBox}) then {_otherBox cbSetChecked false};";
		};
		class RscPicture_1203: RscPicture
		{
			idc=1203;
			text="\Dom_UI\policeDatabase\Create_Warrant_Blue.paa";
			x="0.2585 * safezoneW + safezoneX";
			y="0.6 * safezoneH + safezoneY";
			w="0.113437 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscButton_1606: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="['file'] call DT_fnc_createWarrant";
			onMouseEnter="ctrlSetText [1203,'\Dom_UI\policeDatabase\Create_Warrant.paa']";
			onMouseExit="ctrlSetText [1203,'\Dom_UI\policeDatabase\Create_Warrant_Blue.paa']";
			x="0.2585 * safezoneW + safezoneX";
			y="0.6 * safezoneH + safezoneY";
			w="0.113437 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscButton_1607: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="closeDialog 0";
			x="0.737188 * safezoneW + safezoneX";
			y="0.676 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.033 * safezoneH";
		};
	};
};
class DT_policeRankMenu
{
	idd=1023;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_policeRankMenu";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\tabletFrame.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1201: RscPicture
		{
			idc=1201;
			onLoad="(_this select 0) ctrlSetText format['\Dom_UI\policeDatabase\Backgrounds\BG_%1',player getVariable ['department','Patrol']]";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\menu_promotedemote.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscListbox_1500: RscTreeInvisible
		{
			idc=1500;
			x="0.381506 * safezoneW + safezoneX";
			y="0.379 * safezoneH + safezoneY";
			w="0.28875 * safezoneW";
			h="0.262 * safezoneH";
		};
		class RscStructuredText_1101: DT_RscStructuredText
		{
			idc=1101;
			text="";
			x="0.385 * safezoneW + safezoneX";
			y="0.343 * safezoneH + safezoneY";
			w="0.278437 * safezoneW";
			h="0.023 * safezoneH";
		};
		class RscPicture_1203: RscPicture
		{
			idc=1203;
			text="\Dom_UI\policeDatabase\Update_Blue.paa";
			x="0.726875 * safezoneW + safezoneX";
			y="0.599 * safezoneH + safezoneY";
			w="0.113437 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscPicture_1204: RscPicture
		{
			idc=1204;
			text="\Dom_UI\policeDatabase\Remove_Blue.paa";
			x="0.726875 * safezoneW + safezoneX";
			y="0.555 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscButton_1606: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="[false] call DT_fnc_changeRank";
			onMouseEnter="ctrlSetText [1204,'\Dom_UI\policeDatabase\Remove.paa']";
			onMouseExit="ctrlSetText [1204,'\Dom_UI\policeDatabase\Remove_Blue.paa']";
			x="0.726875 * safezoneW + safezoneX";
			y="0.555 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscButton_1605: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="[true] call DT_fnc_changeRank";
			onMouseEnter="ctrlSetText [1203,'\Dom_UI\policeDatabase\Update.paa']";
			onMouseExit="ctrlSetText [1203,'\Dom_UI\policeDatabase\Update_Blue.paa']";
			x="0.726875 * safezoneW + safezoneX";
			y="0.599 * safezoneH + safezoneY";
			w="0.113437 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscButton_1607: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="closeDialog 0";
			x="0.737188 * safezoneW + safezoneX";
			y="0.676 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.033 * safezoneH";
		};
	};
};
class DT_addBOLO
{
	idd=1024;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_addBOLO";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\tabletFrame.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1201: RscPicture
		{
			idc=1201;
			onLoad="(_this select 0) ctrlSetText format['\Dom_UI\policeDatabase\Backgrounds\BG_%1',player getVariable ['department','Patrol']]";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\menu_createBOLO.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscEdit_1403: RscEditInvisible
		{
			idc=1403;
			style="0x00 + 0x0200";
			x="0.262 * safezoneW + safezoneX";
			y="0.379 * safezoneH + safezoneY";
			w="0.279 * safezoneW";
			h="0.025 * safezoneH";
		};
		class RscEdit_1402: RscEditInvisible
		{
			idc=1402;
			style="0x00 + 0x0200";
			onLoad="(_this select 0) ctrlSetText profileName";
			maxChars=63;
			x="0.262 * safezoneW + safezoneX";
			y="0.445 * safezoneH + safezoneY";
			w="0.28 * safezoneW";
			h="0.025 * safezoneH";
		};
		class RscEdit_1400: RscEditInvisible
		{
			idc=1400;
			x="0.556719 * safezoneW + safezoneX";
			y="0.348 * safezoneH + safezoneY";
			w="0.25 * safezoneW";
			h="0.287 * safezoneH";
		};
		class RscCheckbox_2801: RscCheckBox
		{
			idc=2801;
			x="0.381406 * safezoneW + safezoneX";
			y="0.533 * safezoneH + safezoneY";
			w="0.020625 * safezoneW";
			h="0.033 * safezoneH";
			onCheckedChanged="private _otherBox = (findDisplay 1024) displayCtrl 2800; if ((_this select 1) isEqualTo 1 && {cbChecked _otherBox}) then {_otherBox cbSetChecked false};";
		};
		class RscCheckbox_2800: RscCheckBox
		{
			idc=2800;
			x="0.283437 * safezoneW + safezoneX";
			y="0.533 * safezoneH + safezoneY";
			w="0.020625 * safezoneW";
			h="0.033 * safezoneH";
			onCheckedChanged="private _otherBox = (findDisplay 1024) displayCtrl 2801; if ((_this select 1) isEqualTo 1 && {cbChecked _otherBox}) then {_otherBox cbSetChecked false};";
		};
		class RscPicture_1203: RscPicture
		{
			idc=1203;
			text="\Dom_UI\policeDatabase\Create_BOLO_Blue.paa";
			x="0.2585 * safezoneW + safezoneX";
			y="0.6 * safezoneH + safezoneY";
			w="0.113437 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscButton_1606: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="call DT_fnc_createBOLO";
			onMouseEnter="ctrlSetText [1203,'\Dom_UI\policeDatabase\Create_BOLO.paa']";
			onMouseExit="ctrlSetText [1203,'\Dom_UI\policeDatabase\Create_BOLO_Blue.paa']";
			x="0.2585 * safezoneW + safezoneX";
			y="0.6 * safezoneH + safezoneY";
			w="0.113437 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscButton_1607: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="closeDialog 0";
			x="0.737188 * safezoneW + safezoneX";
			y="0.676 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.033 * safezoneH";
		};
	};
};
class DT_showCompanies
{
	idd=1025;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_showCompanies";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\misc\crafting.paa";
			x="0.273125 * safezoneW + safezoneX";
			y="0.115 * safezoneH + safezoneY";
			w="0.45375 * safezoneW";
			h="0.77 * safezoneH";
		};
		class RscListbox_1500: RscListboxInvisible
		{
			idc=1500;
			onLBSelChanged="_this call DT_fnc_companyLBChanged";
			x="0.298906 * safezoneW + safezoneX";
			y="0.28 * safezoneH + safezoneY";
			w="0.2 * safezoneW";
			h="0.458 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=1100;
			x="0.505156 * safezoneW + safezoneX";
			y="0.28 * safezoneH + safezoneY";
			w="0.195937 * safezoneW";
			h="0.363 * safezoneH";
		};
		class RscButton_1600: RscButtonGeneral
		{
			idc=1600;
			text="My Company";
			action="call DT_fnc_showCompany";
			x="0.505156 * safezoneW + safezoneX";
			y="0.7075 * safezoneH + safezoneY";
			w="0.195937 * safezoneW";
			h="0.022 * safezoneH";
		};
	};
};
class DT_createCompany
{
	idd=1026;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_createCompany";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\misc\createCompany.paa";
			x="0.273125 * safezoneW + safezoneX";
			y="0.115 * safezoneH + safezoneY";
			w="0.45375 * safezoneW";
			h="0.77 * safezoneH";
		};
		class RscEdit_1400: RscEditInvisible
		{
			idc=1400;
			maxChars=48;
			colorText[]={1,1,1,1};
			x="0.298906 * safezoneW + safezoneX";
			y="0.326 * safezoneH + safezoneY";
			w="0.402187 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscEdit_1401: RscEditInvisible
		{
			idc=1401;
			maxChars=256;
			colorText[]={1,1,1,1};
			x="0.298906 * safezoneW + safezoneX";
			y="0.423 * safezoneH + safezoneY";
			w="0.402187 * safezoneW";
			h="0.286 * safezoneH";
		};
		class RscButton_1600: RscButtonGeneral
		{
			idc=-1;
			text="Create company";
			onButtonClick="call DT_fnc_createCompany";
			x="0.448438 * safezoneW + safezoneX";
			y="0.731 * safezoneH + safezoneY";
			w="0.103125 * safezoneW";
			h="0.022 * safezoneH";
		};
	};
};
class DT_myCompany
{
	idd=1027;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_myCompany";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\misc\myCompany.paa";
			x="0.273125 * safezoneW + safezoneX";
			y="0.115 * safezoneH + safezoneY";
			w="0.45375 * safezoneW";
			h="0.77 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=1100;
			x="0.288594 * safezoneW + safezoneX";
			y="0.228 * safezoneH + safezoneY";
			w="0.422812 * safezoneW";
			h="0.03 * safezoneH";
		};
		class RscStructuredText_1101: DT_RscStructuredText
		{
			idc=1101;
			x="0.298906 * safezoneW + safezoneX";
			y="0.324 * safezoneH + safezoneY";
			w="0.193 * safezoneW";
			h="0.363 * safezoneH";
		};
		class RscListbox_1500: RscTreeInvisible
		{
			idc=1500;
			x="0.509 * safezoneW + safezoneX";
			y="0.324 * safezoneH + safezoneY";
			w="0.190781 * safezoneW";
			h="0.429 * safezoneH";
		};
		class RscButton_1600: RscButtonGeneral
		{
			idc=-1;
			text="Quit";
			onButtonClick="call DT_fnc_quitCompany";
			x="0.365937 * safezoneW + safezoneX";
			y="0.72 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscButton_1601: RscButtonGeneral
		{
			idc=1601;
			text="Manage";
			onButtonClick="closeDialog 0; ['init'] call DT_fnc_manageCompany";
			x="0.427812 * safezoneW + safezoneX";
			y="0.72 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscButton_1602: RscButtonGeneral
		{
			idc=-1;
			text="Close";
			onButtonClick="closeDialog 0";
			x="0.304062 * safezoneW + safezoneX";
			y="0.72 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.022 * safezoneH";
		};
	};
};
class DT_manageCompany
{
	idd=1028;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_manageCompany";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\misc\manageCompany.paa";
			x="0.273125 * safezoneW + safezoneX";
			y="0.115 * safezoneH + safezoneY";
			w="0.45375 * safezoneW";
			h="0.77 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=1100;
			x="0.288594 * safezoneW + safezoneX";
			y="0.228 * safezoneH + safezoneY";
			w="0.422812 * safezoneW";
			h="0.03 * safezoneH";
		};
		class RscEdit_1400: RscEditInvisible
		{
			idc=1400;
			maxChars=256;
			colorText[]={1,1,1,1};
			x="0.507 * safezoneW + safezoneX";
			y="0.546 * safezoneH + safezoneY";
			w="0.197 * safezoneW";
			h="0.143 * safezoneH";
		};
		class RscEdit_1401: RscEditInvisible
		{
			idc=1401;
			maxChars=256;
			colorText[]={1,1,1,1};
			x="0.507 * safezoneW + safezoneX";
			y="0.32 * safezoneH + safezoneY";
			w="0.197 * safezoneW";
			h="0.143 * safezoneH";
		};
		class RscEdit_1402: RscEditInvisible
		{
			idc=1402;
			maxChars=5;
			colorText[]={1,1,1,1};
			x="0.298906 * safezoneW + safezoneX";
			y="0.654 * safezoneH + safezoneY";
			w="0.1225 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscListbox_1500: RscTreeInvisible
		{
			idc=1500;
			onTreeSelChanged="['treeChange',_this] call DT_fnc_manageCompany";
			x="0.298906 * safezoneW + safezoneX";
			y="0.324 * safezoneH + safezoneY";
			w="0.1935 * safezoneW";
			h="0.286 * safezoneH";
		};
		class RscButton_1600: RscButtonGeneral
		{
			idc=-1;
			text="Update";
			onButtonClick="['updateDescription'] call DT_fnc_manageCompany";
			x="0.577344 * safezoneW + safezoneX";
			y="0.478 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscButton_1601: RscButtonGeneral
		{
			idc=-1;
			text="Update";
			onButtonClick="['updateTasks'] call DT_fnc_manageCompany";
			x="0.577344 * safezoneW + safezoneX";
			y="0.698 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscButton_1602: RscButtonGeneral
		{
			idc=-1;
			text="Fire";
			onButtonClick="['removeEmployee'] call DT_fnc_manageCompany";
			x="0.432969 * safezoneW + safezoneX";
			y="0.698 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscButton_1603: RscButtonGeneral
		{
			idc=-1;
			text="Promote";
			onButtonClick="['updateEmployee',true] call DT_fnc_manageCompany";
			x="0.340156 * safezoneW + safezoneX";
			y="0.731 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscButton_1604: RscButtonGeneral
		{
			idc=-1;
			text="Refresh";
			onButtonClick="[player getVariable ['company',''],8] remoteExecCall ['DB_fnc_updateCompany',2]";
			x="0.304062 * safezoneW + safezoneX";
			y="0.698 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscButton_1605: RscButtonGeneral
		{
			idc=-1;
			text="Demote";
			onButtonClick="['updateEmployee',false] call DT_fnc_manageCompany";
			x="0.396875 * safezoneW + safezoneX";
			y="0.731 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscButton_1606: RscButtonGeneral
		{
			idc=-1;
			text="Update";
			onButtonClick="['updateSalary',false] call DT_fnc_manageCompany";
			x="0.432969 * safezoneW + safezoneX";
			y="0.6565 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.022 * safezoneH";
		};
	};
};
class DT_houseManagement
{
	idd=1029;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_houseManagement";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\misc\houseManagement.paa";
			x="0.273125 * safezoneW + safezoneX";
			y="0.115 * safezoneH + safezoneY";
			w="0.45375 * safezoneW";
			h="0.77 * safezoneH";
		};
		class RscListbox_1500: RscListboxInvisible
		{
			idc=1500;
			x="0.3 * safezoneW + safezoneX";
			y="0.328 * safezoneH + safezoneY";
			w="0.188 * safezoneW";
			h="0.344 * safezoneH";
		};
		class RscButton_1600: RscButtonGeneral
		{
			idc=-1;
			text="Remove";
			onButtonClick="[MB_Interaction_Target] call DT_fnc_removeKey";
			x="0.360781 * safezoneW + safezoneX";
			y="0.698 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscButton_1601: RscButtonGeneral
		{
			idc=-1;
			text="Update";
			onButtonClick="[MB_Interaction_Target] call DT_fnc_changeAlarm";
			x="0.587656 * safezoneW + safezoneX";
			y="0.698 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscCheckbox_2800: RscCheckBox
		{
			idc=2800;
			x="0.567031 * safezoneW + safezoneX";
			y="0.33 * safezoneH + safezoneY";
			w="0.020625 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscCheckbox_2801: RscCheckBox
		{
			idc=2801;
			x="0.567031 * safezoneW + safezoneX";
			y="0.39 * safezoneH + safezoneY";
			w="0.020625 * safezoneW";
			h="0.033 * safezoneH";
		};
	};
};
class DT_banking
{
	idd=1030;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_banking";
	movingEnable=0;
	onUnload="uiNamespace setVariable ['compFunds',nil]";
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\misc\bank.paa";
			x="0.206093 * safezoneW + safezoneX";
			y="0.016 * safezoneH + safezoneY";
			w="0.587812 * safezoneW";
			h="0.946 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=-1;
			onLoad="(_this select 0) ctrlSetStructuredText parseText format['<t color=""#777777"">Welcome back, %1.</t>',profileName]";
			x="0.644375 * safezoneW + safezoneX";
			y="0.258 * safezoneH + safezoneY";
			w="0.118594 * safezoneW";
			h="0.055 * safezoneH";
			class Attributes
			{
				font="PuristaLight";
				color="#ffffff";
				align="right";
				shadow=1;
			};
		};
		class RscEdit_1400: RscEditInvisible
		{
			idc=1400;
			text="0";
			maxChars=6;
			colorText[]={1,1,1,1};
			x="0.5325 * safezoneW + safezoneX";
			y="0.379 * safezoneH + safezoneY";
			w="0.163 * safezoneW";
			h="0.028 * safezoneH";
		};
		class RscCombo_2100: RscCombo
		{
			idc=2100;
			x="0.5325 * safezoneW + safezoneX";
			y="0.433 * safezoneH + safezoneY";
			w="0.163 * safezoneW";
			h="0.033 * safezoneH";
			colorBackground[]={0,0,0,0};
		};
		class RscStructuredText_1101: DT_RscStructuredText
		{
			idc=1101;
			onLoad="(_this select 0) ctrlSetStructuredText parseText format['$%1<br/>',(player getVariable ['bank',0])]";
			x="0.340156 * safezoneW + safezoneX";
			y="0.39 * safezoneH + safezoneY";
			w="0.12375 * safezoneW";
			h="0.033 * safezoneH";
			class Attributes
			{
				font="PuristaLight";
				color="#ffffff";
				align="left";
				shadow=1;
			};
		};
		class RscStructuredText_1102: DT_RscStructuredText
		{
			idc=1102;
			x="0.340156 * safezoneW + safezoneX";
			y="0.425 * safezoneH + safezoneY";
			w="0.12375 * safezoneW";
			h="0.033 * safezoneH";
			class Attributes
			{
				font="PuristaLight";
				color="#ffffff";
				align="left";
				shadow=1;
			};
		};
		class RscButton_1600: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="[0] call DT_fnc_useATM";
			x="0.304062 * safezoneW + safezoneX";
			y="0.489 * safezoneH + safezoneY";
			w="0.167 * safezoneW";
			h="0.037 * safezoneH";
		};
		class RscButton_1601: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="[1] call DT_fnc_useATM";
			x="0.304062 * safezoneW + safezoneX";
			y="0.5675 * safezoneH + safezoneY";
			w="0.167 * safezoneW";
			h="0.037 * safezoneH";
		};
		class RscButton_1602: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="[3] call DT_fnc_useATM";
			x="0.304062 * safezoneW + safezoneX";
			y="0.645 * safezoneH + safezoneY";
			w="0.167 * safezoneW";
			h="0.037 * safezoneH";
		};
		class RscButton_1603: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="[2] call DT_fnc_useATM";
			x="0.530937 * safezoneW + safezoneX";
			y="0.489 * safezoneH + safezoneY";
			w="0.167 * safezoneW";
			h="0.037 * safezoneH";
		};
		class RscButton_1604: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="[1,true] call DT_fnc_useATM";
			x="0.530937 * safezoneW + safezoneX";
			y="0.5675 * safezoneH + safezoneY";
			w="0.167 * safezoneW";
			h="0.037 * safezoneH";
		};
		class RscButton_1605: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="[4] call DT_fnc_useATM";
			x="0.530937 * safezoneW + safezoneX";
			y="0.645 * safezoneH + safezoneY";
			w="0.167 * safezoneW";
			h="0.037 * safezoneH";
		};
	};
};
class DT_phoneMain
{
	idd=1031;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_phoneMain";
	movingEnable=0;
	onLoad="phone_appOpen = 1031";
	onUnload="phone_appOpen = -1";
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=1200;
			text="\Dom_UI\phone\backgrounds\background1.paa";
			x="0.231875 * safezoneW + safezoneX";
			y="0.038 * safezoneH + safezoneY";
			w="0.541406 * safezoneW";
			h="0.924 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=1202;
			x="0.575 * safezoneW + safezoneX";
			y="0.1435 * safezoneH + safezoneY";
			w="0.020625 * safezoneW";
			h="0.014 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=1100;
			x="0.547437 * safezoneW + safezoneX";
			y="0.143 * safezoneH + safezoneY";
			w="0.026 * safezoneW";
			h="0.016 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 32.5) * 1)";
			class Attributes
			{
				font="PuristaLight";
				color="#ffffff";
				align="right";
				shadow=1;
			};
		};
		class RscStructuredText_1101: DT_RscStructuredText
		{
			idc=1101;
			x="0.412344 * safezoneW + safezoneX";
			y="0.236 * safezoneH + safezoneY";
			w="0.180469 * safezoneW";
			h="0.165 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 5) * 1)";
		};
		class RscPicture_1205: RscPicture
		{
			idc=1205;
			text="Dom_UI\phone\frame.paa";
			x="0.231875 * safezoneW + safezoneX";
			y="0.038 * safezoneH + safezoneY";
			w="0.541406 * safezoneW";
			h="0.924 * safezoneH";
		};
		class RscPicture_1212: RscPicture
		{
			idc=1212;
			text="\Dom_UI\phone\icons\settings.paa";
			x="0.556719 * safezoneW + safezoneX";
			y="0.687 * safezoneH + safezoneY";
			w="0.04125 * safezoneW";
			h="0.066 * safezoneH";
		};
		class RscButton_1600: RscButtonInvisible
		{
			idc=1600;
			onButtonClick="call DT_fnc_initSettings";
			onMouseEnter="ctrlSetText [1212,'\Dom_UI\phone\icons\settings_selected.paa']";
			onMouseExit="ctrlSetText [1212,'\Dom_UI\phone\icons\settings.paa']";
			x="0.556719 * safezoneW + safezoneX";
			y="0.687 * safezoneH + safezoneY";
			w="0.04125 * safezoneW";
			h="0.066 * safezoneH";
		};
		class RscPicture_1206: RscPicture
		{
			idc=1206;
			text="\Dom_UI\phone\icons\contacts.paa";
			x="0.507218 * safezoneW + safezoneX";
			y="0.687 * safezoneH + safezoneY";
			w="0.04125 * safezoneW";
			h="0.066 * safezoneH";
		};
		class RscButton_1601: RscButtonInvisible
		{
			idc=1601;
			onButtonClick="call DT_fnc_initContacts";
			onMouseEnter="ctrlSetText [1206,'\Dom_UI\phone\icons\contacts_selected.paa']";
			onMouseExit="ctrlSetText [1206,'\Dom_UI\phone\icons\contacts.paa']";
			x="0.507218 * safezoneW + safezoneX";
			y="0.687 * safezoneH + safezoneY";
			w="0.04125 * safezoneW";
			h="0.066 * safezoneH";
		};
		class RscPicture_1207: RscPicture
		{
			idc=1207;
			text="\Dom_UI\phone\icons\sms.paa";
			x="0.456688 * safezoneW + safezoneX";
			y="0.687 * safezoneH + safezoneY";
			w="0.04125 * safezoneW";
			h="0.066 * safezoneH";
		};
		class RscButton_1602: RscButtonInvisible
		{
			idc=1602;
			onButtonClick="call DT_fnc_initInbox";
			onMouseEnter="ctrlSetText [1207,'\Dom_UI\phone\icons\sms_selected.paa']";
			onMouseExit="ctrlSetText [1207,'\Dom_UI\phone\icons\sms.paa']";
			x="0.456688 * safezoneW + safezoneX";
			y="0.687 * safezoneH + safezoneY";
			w="0.04125 * safezoneW";
			h="0.066 * safezoneH";
		};
		class RscPicture_1208: RscPicture
		{
			idc=1208;
			text="\Dom_UI\phone\icons\menu.paa";
			x="0.481438 * safezoneW + safezoneX";
			y="0.786 * safezoneH + safezoneY";
			w="0.04125 * safezoneW";
			h="0.066 * safezoneH";
		};
		class RscButton_1603: RscButtonInvisible
		{
			idc=1603;
			onButtonClick="closeDialog 0";
			onMouseEnter="ctrlSetText [1208,'\Dom_UI\phone\icons\menu_selected.paa']";
			onMouseExit="ctrlSetText [1208,'\Dom_UI\phone\icons\menu.paa']";
			x="0.481438 * safezoneW + safezoneX";
			y="0.786 * safezoneH + safezoneY";
			w="0.04125 * safezoneW";
			h="0.066 * safezoneH";
		};
		class RscPicture_1204: RscPicture
		{
			idc=1204;
			text="\Dom_UI\phone\icons\call.paa";
			x="0.407187 * safezoneW + safezoneX";
			y="0.687 * safezoneH + safezoneY";
			w="0.04125 * safezoneW";
			h="0.066 * safezoneH";
		};
		class RscButton_1604: RscButtonInvisible
		{
			idc=1604;
			onButtonClick="createDialog 'DT_dialpad'; [phone_appOpen] call DT_fnc_updatePhone;";
			onMouseEnter="ctrlSetText [1204,'\Dom_UI\phone\icons\call_selected.paa']";
			onMouseExit="ctrlSetText [1204,'\Dom_UI\phone\icons\call.paa']";
			x="0.407187 * safezoneW + safezoneX";
			y="0.687 * safezoneH + safezoneY";
			w="0.04125 * safezoneW";
			h="0.066 * safezoneH";
		};
		class RscPicture_1209: RscPicture
		{
			idc=1209;
			text="\Dom_UI\phone\icons\answer.paa";
			x="0.551562 * safezoneW + safezoneX";
			y="0.434 * safezoneH + safezoneY";
			w="0.04125 * safezoneW";
			h="0.066 * safezoneH";
		};
		class RscButton_1606: RscButtonInvisible
		{
			idc=1606;
			onButtonClick="['Call ended.'] call DT_fnc_notify; if (phone_callOwner isEqualTo player) then {call DT_fnc_endCall} else {['callerHungup'] remoteExecCall ['DT_fnc_phoneStateChanged',phone_callOwner]; call DT_fnc_endCall}; closeDialog 0;";
			onMouseEnter="ctrlSetText [1209,'\Dom_UI\phone\icons\answer_selected.paa']";
			onMouseExit="ctrlSetText [1209,'\Dom_UI\phone\icons\answer.paa']";
			x="0.551562 * safezoneW + safezoneX";
			y="0.434 * safezoneH + safezoneY";
			w="0.04125 * safezoneW";
			h="0.066 * safezoneH";
		};
		class RscStructuredText_1103: DT_RscStructuredText
		{
			idc=1103;
			text="time of call";
			x="0.412344 * safezoneW + safezoneX";
			y="0.434 * safezoneH + safezoneY";
			w="0.103125 * safezoneW";
			h="0.066 * safezoneH";
		};
		class RscPicture_1211: RscPicture
		{
			idc=1211;
			text="\Dom_UI\phone\icons\bank.paa";
			x="0.407187 * safezoneW + safezoneX";
			y="0.61 * safezoneH + safezoneY";
			w="0.04125 * safezoneW";
			h="0.066 * safezoneH";
		};
		class RscButton_1605: RscButtonInvisible
		{
			idc=1605;
			onButtonClick="[true] call DT_fnc_initATM";
			onMouseEnter="ctrlSetText [1211,'\Dom_UI\phone\icons\bank_selected.paa']";
			onMouseExit="ctrlSetText [1211,'\Dom_UI\phone\icons\bank.paa']";
			x="0.407187 * safezoneW + safezoneX";
			y="0.61 * safezoneH + safezoneY";
			w="0.04125 * safezoneW";
			h="0.066 * safezoneH";
		};
	};
};
class DT_incomingCall
{
	idd=1032;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_incomingCall";
	movingEnable=0;
	onLoad="phone_appOpen = 1032";
	onUnload="phone_appOpen = -1";
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=1200;
			text="\Dom_UI\phone\backgrounds\background1.paa";
			x="0.231875 * safezoneW + safezoneX";
			y="0.038 * safezoneH + safezoneY";
			w="0.541406 * safezoneW";
			h="0.924 * safezoneH";
		};
		class RscPicture_1201: RscPicture
		{
			idc=1201;
			text="\Dom_UI\phone\frame_incomingCall.paa";
			x="0.231875 * safezoneW + safezoneX";
			y="0.038 * safezoneH + safezoneY";
			w="0.541406 * safezoneW";
			h="0.924 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=1202;
			x="0.575 * safezoneW + safezoneX";
			y="0.1435 * safezoneH + safezoneY";
			w="0.020625 * safezoneW";
			h="0.014 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=1100;
			x="0.547437 * safezoneW + safezoneX";
			y="0.143 * safezoneH + safezoneY";
			w="0.026 * safezoneW";
			h="0.016 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 32.5) * 1)";
			class Attributes
			{
				font="PuristaLight";
				color="#ffffff";
				align="right";
				shadow=1;
			};
		};
		class RscStructuredText_1101: DT_RscStructuredText
		{
			idc=1101;
			x="0.474219 * safezoneW + safezoneX";
			y="0.143 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.016 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 32.5) * 1)";
		};
		class RscPicture_1205: RscPicture
		{
			idc=1205;
			text="Dom_UI\phone\frame.paa";
			x="0.231875 * safezoneW + safezoneX";
			y="0.038 * safezoneH + safezoneY";
			w="0.541406 * safezoneW";
			h="0.924 * safezoneH";
		};
		class RscStructuredText_1102: DT_RscStructuredText
		{
			idc=1102;
			x="0.448438 * safezoneW + safezoneX";
			y="0.423 * safezoneH + safezoneY";
			w="0.108281 * safezoneW";
			h="0.121 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) * 1)";
		};
		class RscPicture_1204: RscPicture
		{
			idc=1204;
			text="\Dom_UI\phone\icons\answer2.paa";
			x="0.427812 * safezoneW + safezoneX";
			y="0.665 * safezoneH + safezoneY";
			w="0.04125 * safezoneW";
			h="0.077 * safezoneH";
		};
		class RscPicture_1206: RscPicture
		{
			idc=1206;
			text="\Dom_UI\phone\icons\answer.paa";
			x="0.530937 * safezoneW + safezoneX";
			y="0.665 * safezoneH + safezoneY";
			w="0.04125 * safezoneW";
			h="0.077 * safezoneH";
		};
		class RscButton_1600: RscButtonInvisible
		{
			idc=1600;
			onButtonClick="[true] call DT_fnc_respondCall";
			onMouseEnter="ctrlSetText [1204,'\Dom_UI\phone\icons\answer2_selected.paa']";
			onMouseExit="ctrlSetText [1204,'\Dom_UI\phone\icons\answer2.paa']";
			x="0.427812 * safezoneW + safezoneX";
			y="0.665 * safezoneH + safezoneY";
			w="0.04125 * safezoneW";
			h="0.077 * safezoneH";
		};
		class RscButton_1601: RscButtonInvisible
		{
			idc=1601;
			onButtonClick="[false] call DT_fnc_respondCall";
			onMouseEnter="ctrlSetText [1206,'\Dom_UI\phone\icons\answer_selected.paa']";
			onMouseExit="ctrlSetText [1206,'\Dom_UI\phone\icons\answer.paa']";
			x="0.530937 * safezoneW + safezoneX";
			y="0.665 * safezoneH + safezoneY";
			w="0.04125 * safezoneW";
			h="0.077 * safezoneH";
		};
	};
};
class DT_dialpad
{
	idd=1033;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_dialpad";
	movingEnable=0;
	onLoad="phone_appOpen = 1033";
	onUnload="uiNamespace setVariable ['callNumber',nil]; phone_appOpen = 1031";
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=1200;
			text="\Dom_UI\phone\frame_dialpad.paa";
			x="0.231875 * safezoneW + safezoneX";
			y="0.038 * safezoneH + safezoneY";
			w="0.541406 * safezoneW";
			h="0.924 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=1202;
			x="0.575 * safezoneW + safezoneX";
			y="0.1435 * safezoneH + safezoneY";
			w="0.020625 * safezoneW";
			h="0.014 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=1100;
			x="0.547437 * safezoneW + safezoneX";
			y="0.143 * safezoneH + safezoneY";
			w="0.026 * safezoneW";
			h="0.016 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 32.5) * 1)";
			class Attributes
			{
				font="PuristaLight";
				color="#ffffff";
				align="right";
				shadow=1;
			};
		};
		class RscStructuredText_1101: DT_RscStructuredText
		{
			idc=1101;
			x="0.474219 * safezoneW + safezoneX";
			y="0.143 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.016 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 32.5) * 1)";
		};
		class RscPicture_1205: RscPicture
		{
			idc=1205;
			text="Dom_UI\phone\frame.paa";
			x="0.231875 * safezoneW + safezoneX";
			y="0.038 * safezoneH + safezoneY";
			w="0.541406 * safezoneW";
			h="0.924 * safezoneH";
		};
		class RscStructuredText_1102: DT_RscStructuredText
		{
			idc=1102;
			x="0.402031 * safezoneW + safezoneX";
			y="0.346 * safezoneH + safezoneY";
			w="0.201094 * safezoneW";
			h="0.038 * safezoneH";
		};
		class RscButton_1600: RscButtonInvisible
		{
			idc=1600;
			onButtonClick="closeDialog 0";
			x="0.402031 * safezoneW + safezoneX";
			y="0.17 * safezoneH + safezoneY";
			w="0.0309375 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscButton_1601: RscButtonInvisible
		{
			idc=1601;
			onButtonClick="['1'] call DT_fnc_dialPad";
			x="0.4175 * safezoneW + safezoneX";
			y="0.423 * safezoneH + safezoneY";
			w="0.0360937 * safezoneW";
			h="0.055 * safezoneH";
		};
		class RscButton_1602: RscButtonInvisible
		{
			idc=1602;
			onButtonClick="['2'] call DT_fnc_dialPad";
			x="0.488 * safezoneW + safezoneX";
			y="0.423 * safezoneH + safezoneY";
			w="0.034 * safezoneW";
			h="0.055 * safezoneH";
		};
		class RscButton_1603: RscButtonInvisible
		{
			idc=1603;
			onButtonClick="['3'] call DT_fnc_dialPad";
			x="0.556719 * safezoneW + safezoneX";
			y="0.423 * safezoneH + safezoneY";
			w="0.0360937 * safezoneW";
			h="0.055 * safezoneH";
		};
		class RscButton_1604: RscButtonInvisible
		{
			idc=1604;
			onButtonClick="['4'] call DT_fnc_dialPad";
			x="0.4175 * safezoneW + safezoneX";
			y="0.506 * safezoneH + safezoneY";
			w="0.0360937 * safezoneW";
			h="0.058 * safezoneH";
		};
		class RscButton_1605: RscButtonInvisible
		{
			idc=1605;
			onButtonClick="['5'] call DT_fnc_dialPad";
			x="0.488 * safezoneW + safezoneX";
			y="0.506 * safezoneH + safezoneY";
			w="0.034 * safezoneW";
			h="0.058 * safezoneH";
		};
		class RscButton_1606: RscButtonInvisible
		{
			idc=1606;
			onButtonClick="['6'] call DT_fnc_dialPad";
			x="0.556719 * safezoneW + safezoneX";
			y="0.506 * safezoneH + safezoneY";
			w="0.0360937 * safezoneW";
			h="0.058 * safezoneH";
		};
		class RscButton_1607: RscButtonInvisible
		{
			idc=1607;
			onButtonClick="['7'] call DT_fnc_dialPad";
			x="0.4175 * safezoneW + safezoneX";
			y="0.588 * safezoneH + safezoneY";
			w="0.0360937 * safezoneW";
			h="0.055 * safezoneH";
		};
		class RscButton_1608: RscButtonInvisible
		{
			idc=1608;
			onButtonClick="['8'] call DT_fnc_dialPad";
			x="0.488 * safezoneW + safezoneX";
			y="0.588 * safezoneH + safezoneY";
			w="0.034 * safezoneW";
			h="0.058 * safezoneH";
		};
		class RscButton_1609: RscButtonInvisible
		{
			idc=1609;
			onButtonClick="['9'] call DT_fnc_dialPad";
			x="0.556719 * safezoneW + safezoneX";
			y="0.588 * safezoneH + safezoneY";
			w="0.0360937 * safezoneW";
			h="0.058 * safezoneH";
		};
		class RscButton_1610: RscButtonInvisible
		{
			idc=1610;
			x="0.4175 * safezoneW + safezoneX";
			y="0.676 * safezoneH + safezoneY";
			w="0.0360937 * safezoneW";
			h="0.055 * safezoneH";
		};
		class RscButton_1611: RscButtonInvisible
		{
			idc=1611;
			onButtonClick="['0'] call DT_fnc_dialPad";
			x="0.488 * safezoneW + safezoneX";
			y="0.676 * safezoneH + safezoneY";
			w="0.0354 * safezoneW";
			h="0.055 * safezoneH";
		};
		class RscButton_1612: RscButtonInvisible
		{
			idc=1612;
			x="0.556719 * safezoneW + safezoneX";
			y="0.676 * safezoneH + safezoneY";
			w="0.0360937 * safezoneW";
			h="0.055 * safezoneH";
		};
		class RscPicture_1206: RscPicture
		{
			idc=1206;
			text="Dom_UI\phone\icons\call.paa";
			x="0.487 * safezoneW + safezoneX";
			y="0.76 * safezoneH + safezoneY";
			w="0.0360937 * safezoneW";
			h="0.06 * safezoneH";
		};
		class RscButton_1613: RscButtonInvisible
		{
			idc=1613;
			onButtonClick="[uiNamespace getVariable ['callNumber','']] call DT_fnc_callNumber";
			onMouseEnter="ctrlSetText [1206,'\Dom_UI\phone\icons\call_selected.paa']";
			onMouseExit="ctrlSetText [1206,'\Dom_UI\phone\icons\call.paa']";
			x="0.487 * safezoneW + safezoneX";
			y="0.76 * safezoneH + safezoneY";
			w="0.0360937 * safezoneW";
			h="0.06 * safezoneH";
		};
	};
};
class DT_messages
{
	idd=1034;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_messages";
	movingEnable=0;
	onLoad="phone_appOpen = 1034";
	onUnload="phone_appOpen = 1031";
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=1200;
			text="\Dom_UI\phone\frame_messages.paa";
			x="0.231875 * safezoneW + safezoneX";
			y="0.038 * safezoneH + safezoneY";
			w="0.541406 * safezoneW";
			h="0.924 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=1202;
			x="0.575 * safezoneW + safezoneX";
			y="0.1435 * safezoneH + safezoneY";
			w="0.020625 * safezoneW";
			h="0.014 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=1100;
			x="0.547437 * safezoneW + safezoneX";
			y="0.143 * safezoneH + safezoneY";
			w="0.026 * safezoneW";
			h="0.016 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 32.5) * 1)";
			class Attributes
			{
				font="PuristaLight";
				color="#ffffff";
				align="right";
				shadow=1;
			};
		};
		class RscStructuredText_1101: DT_RscStructuredText
		{
			idc=1101;
			x="0.474219 * safezoneW + safezoneX";
			y="0.143 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.016 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 32.5) * 1)";
		};
		class RscPicture_1205: RscPicture
		{
			idc=1205;
			text="Dom_UI\phone\frame.paa";
			x="0.231875 * safezoneW + safezoneX";
			y="0.038 * safezoneH + safezoneY";
			w="0.541406 * safezoneW";
			h="0.924 * safezoneH";
		};
		class RscButton_1600: RscButtonInvisible
		{
			idc=1600;
			onButtonClick="closeDialog 0";
			x="0.402031 * safezoneW + safezoneX";
			y="0.17 * safezoneH + safezoneY";
			w="0.0309375 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscButton_1601: RscButtonInvisible
		{
			idc=1601;
			onButtonClick="closeDialog 0; createDialog 'DT_newMessage'";
			x="0.448438 * safezoneW + safezoneX";
			y="0.239 * safezoneH + safezoneY";
			w="0.118594 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscControlsGroup_2300: RscControlsGroup
		{
			idc=2300;
			x="0.402031 * safezoneW + safezoneX";
			y="0.291 * safezoneH + safezoneY";
			w="0.201094 * safezoneW";
			h="0.561 * safezoneH";
			class Controls
			{
			};
		};
	};
};
class DT_seeMessage
{
	idd=1035;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_seeMessage";
	movingEnable=0;
	onLoad="phone_appOpen = 1035";
	onUnload="phone_appOpen = 1034; [{isNull (findDisplay 1034)},{call DT_fnc_initInbox}] call CBA_fnc_waitUntilAndExecute;";
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=1200;
			text="\Dom_UI\phone\frame_sendMessage.paa";
			x="0.231875 * safezoneW + safezoneX";
			y="0.038 * safezoneH + safezoneY";
			w="0.541406 * safezoneW";
			h="0.924 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=1202;
			x="0.575 * safezoneW + safezoneX";
			y="0.1435 * safezoneH + safezoneY";
			w="0.020625 * safezoneW";
			h="0.014 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=1100;
			x="0.547437 * safezoneW + safezoneX";
			y="0.143 * safezoneH + safezoneY";
			w="0.026 * safezoneW";
			h="0.016 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 32.5) * 1)";
			class Attributes
			{
				font="PuristaLight";
				color="#ffffff";
				align="right";
				shadow=1;
			};
		};
		class RscStructuredText_1101: DT_RscStructuredText
		{
			idc=1101;
			x="0.474219 * safezoneW + safezoneX";
			y="0.143 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.016 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 32.5) * 1)";
		};
		class RscPicture_1205: RscPicture
		{
			idc=1205;
			text="Dom_UI\phone\frame.paa";
			x="0.231875 * safezoneW + safezoneX";
			y="0.038 * safezoneH + safezoneY";
			w="0.541406 * safezoneW";
			h="0.924 * safezoneH";
		};
		class RscButton_1600: RscButtonInvisible
		{
			idc=1600;
			onButtonClick="closeDialog 0";
			x="0.402031 * safezoneW + safezoneX";
			y="0.17 * safezoneH + safezoneY";
			w="0.0309375 * safezoneW";
			h="0.044 * safezoneH";
			colorBackground[]={0,0,0,0};
		};
		class RscControlsGroup_2300: RscControlsGroup
		{
			idc=2300;
			x="0.402031 * safezoneW + safezoneX";
			y="0.225 * safezoneH + safezoneY";
			w="0.201094 * safezoneW";
			h="0.506 * safezoneH";
			class Controls
			{
			};
		};
		class RscEdit_1400: RscEditInvisible
		{
			idc=1400;
			colorText[]={1,1,1,1};
			x="0.407187 * safezoneW + safezoneX";
			y="0.753 * safezoneH + safezoneY";
			w="0.149531 * safezoneW";
			h="0.082 * safezoneH";
		};
		class RscButton_1601: RscButtonInvisible
		{
			idc=1601;
			onButtonClick="call DT_fnc_sendText";
			x="0.563 * safezoneW + safezoneX";
			y="0.817 * safezoneH + safezoneY";
			w="0.04 * safezoneW";
			h="0.024 * safezoneH";
		};
		class RscStructuredText_1103: DT_RscStructuredText
		{
			idc=1103;
			x="0.443281 * safezoneW + safezoneX";
			y="0.17 * safezoneH + safezoneY";
			w="0.134062 * safezoneW";
			h="0.044 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 15) * 1)";
		};
	};
};
class DT_contacts
{
	idd=1036;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_contacts";
	movingEnable=0;
	onLoad="phone_appOpen = 1036";
	onUnload="phone_appOpen = 1031";
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=1200;
			text="\Dom_UI\phone\frame_contacts.paa";
			x="0.231875 * safezoneW + safezoneX";
			y="0.038 * safezoneH + safezoneY";
			w="0.541406 * safezoneW";
			h="0.924 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=1202;
			x="0.575 * safezoneW + safezoneX";
			y="0.1435 * safezoneH + safezoneY";
			w="0.020625 * safezoneW";
			h="0.014 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=1100;
			x="0.547437 * safezoneW + safezoneX";
			y="0.143 * safezoneH + safezoneY";
			w="0.026 * safezoneW";
			h="0.016 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 32.5) * 1)";
			class Attributes
			{
				font="PuristaLight";
				color="#ffffff";
				align="right";
				shadow=1;
			};
		};
		class RscStructuredText_1101: DT_RscStructuredText
		{
			idc=1101;
			x="0.474219 * safezoneW + safezoneX";
			y="0.143 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.016 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 32.5) * 1)";
		};
		class RscPicture_1205: RscPicture
		{
			idc=1205;
			text="Dom_UI\phone\frame.paa";
			x="0.231875 * safezoneW + safezoneX";
			y="0.038 * safezoneH + safezoneY";
			w="0.541406 * safezoneW";
			h="0.924 * safezoneH";
		};
		class RscButton_1600: RscButtonInvisible
		{
			idc=1600;
			onButtonClick="closeDialog 0";
			x="0.402031 * safezoneW + safezoneX";
			y="0.17 * safezoneH + safezoneY";
			w="0.0309375 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscButton_1601: RscButtonInvisible
		{
			idc=1601;
			onButtonClick="['load',['','','']] call DT_fnc_editContact";
			x="0.448438 * safezoneW + safezoneX";
			y="0.23908 * safezoneH + safezoneY";
			w="0.108281 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscControlsGroup_2300: RscControlsGroup
		{
			idc=2300;
			x="0.402031 * safezoneW + safezoneX";
			y="0.291 * safezoneH + safezoneY";
			w="0.201094 * safezoneW";
			h="0.561 * safezoneH";
			class Controls
			{
			};
		};
	};
};
class DT_editContact
{
	idd=1037;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_editContact";
	movingEnable=0;
	onLoad="phone_appOpen = 1037";
	onUnload="phone_appOpen = 1036; [{isNull (findDisplay 1036)},{call DT_fnc_initContacts}] call CBA_fnc_waitUntilAndExecute;";
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=1200;
			text="\Dom_UI\phone\frame_viewContact.paa";
			x="0.231875 * safezoneW + safezoneX";
			y="0.038 * safezoneH + safezoneY";
			w="0.541406 * safezoneW";
			h="0.924 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=1202;
			x="0.575 * safezoneW + safezoneX";
			y="0.1435 * safezoneH + safezoneY";
			w="0.020625 * safezoneW";
			h="0.014 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=1100;
			x="0.547437 * safezoneW + safezoneX";
			y="0.143 * safezoneH + safezoneY";
			w="0.026 * safezoneW";
			h="0.016 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 32.5) * 1)";
			class Attributes
			{
				font="PuristaLight";
				color="#ffffff";
				align="right";
				shadow=1;
			};
		};
		class RscStructuredText_1101: DT_RscStructuredText
		{
			idc=1101;
			x="0.474219 * safezoneW + safezoneX";
			y="0.143 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.016 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 32.5) * 1)";
		};
		class RscPicture_1205: RscPicture
		{
			idc=1205;
			text="Dom_UI\phone\frame.paa";
			x="0.231875 * safezoneW + safezoneX";
			y="0.038 * safezoneH + safezoneY";
			w="0.541406 * safezoneW";
			h="0.924 * safezoneH";
		};
		class RscEdit_1400: RscEditInvisible
		{
			idc=1400;
			maxChars=50;
			colorText[]={1,1,1,1};
			x="0.407187 * safezoneW + safezoneX";
			y="0.261 * safezoneH + safezoneY";
			w="0.190781 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscEdit_1401: RscEditInvisible
		{
			idc=1401;
			maxChars=6;
			colorText[]={1,1,1,1};
			x="0.407187 * safezoneW + safezoneX";
			y="0.337 * safezoneH + safezoneY";
			w="0.190781 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscEdit_1402: RscEditInvisible
		{
			idc=1402;
			maxChars=128;
			colorText[]={1,1,1,1};
			x="0.407187 * safezoneW + safezoneX";
			y="0.414 * safezoneH + safezoneY";
			w="0.190781 * safezoneW";
			h="0.132 * safezoneH";
		};
		class RscButton_1600: RscButtonInvisible
		{
			idc=1600;
			onButtonClick="['update'] call DT_fnc_editContact";
			x="0.407187 * safezoneW + safezoneX";
			y="0.602 * safezoneH + safezoneY";
			w="0.190781 * safezoneW";
			h="0.055 * safezoneH";
		};
		class RscButton_1601: RscButtonInvisible
		{
			idc=1601;
			onButtonClick="['delete'] call DT_fnc_editContact";
			x="0.407187 * safezoneW + safezoneX";
			y="0.677 * safezoneH + safezoneY";
			w="0.190781 * safezoneW";
			h="0.055 * safezoneH";
		};
		class RscButton_1602: RscButtonInvisible
		{
			idc=1602;
			onButtonClick="[false] call DT_fnc_useContact";
			x="0.507941 * safezoneW + safezoneX";
			y="0.753 * safezoneH + safezoneY";
			w="0.09 * safezoneW";
			h="0.055 * safezoneH";
		};
		class RscButton_1603: RscButtonInvisible
		{
			idc=1603;
			onButtonClick="closeDialog 0";
			x="0.402031 * safezoneW + safezoneX";
			y="0.17 * safezoneH + safezoneY";
			w="0.0309375 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscButton_1604: RscButtonInvisible
		{
			idc=1604;
			onButtonClick="[true] call DT_fnc_useContact";
			x="0.407187 * safezoneW + safezoneX";
			y="0.753 * safezoneH + safezoneY";
			w="0.09 * safezoneW";
			h="0.055 * safezoneH";
		};
	};
};
class DT_phoneBanking
{
	idd=1038;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_phoneBanking";
	movingEnable=0;
	onLoad="phone_appOpen = 1038";
	onUnload="phone_appOpen = 1031; uiNamespace setVariable ['compFunds',nil]";
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=1200;
			text="\Dom_UI\phone\frame_banking.paa";
			x="0.231875 * safezoneW + safezoneX";
			y="0.038 * safezoneH + safezoneY";
			w="0.541406 * safezoneW";
			h="0.924 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=1202;
			x="0.575 * safezoneW + safezoneX";
			y="0.1435 * safezoneH + safezoneY";
			w="0.020625 * safezoneW";
			h="0.014 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=1100;
			x="0.547437 * safezoneW + safezoneX";
			y="0.143 * safezoneH + safezoneY";
			w="0.026 * safezoneW";
			h="0.016 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 32.5) * 1)";
			class Attributes
			{
				font="PuristaLight";
				color="#ffffff";
				align="right";
				shadow=1;
			};
		};
		class RscStructuredText_1101: DT_RscStructuredText
		{
			idc=1101;
			x="0.474219 * safezoneW + safezoneX";
			y="0.143 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.016 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 32.5) * 1)";
		};
		class RscPicture_1205: RscPicture
		{
			idc=1205;
			text="Dom_UI\phone\frame.paa";
			x="0.231875 * safezoneW + safezoneX";
			y="0.038 * safezoneH + safezoneY";
			w="0.541406 * safezoneW";
			h="0.924 * safezoneH";
		};
		class RscStructuredText_1103: DT_RscStructuredText
		{
			idc=1103;
			onLoad="(_this select 0) ctrlSetStructuredText parseText format['$%1<br/>',(player getVariable ['bank',0])]";
			x="0.453594 * safezoneW + safezoneX";
			y="0.302 * safezoneH + safezoneY";
			w="0.128906 * safezoneW";
			h="0.033 * safezoneH";
			class Attributes
			{
				font="PuristaLight";
				color="#ffffff";
				align="left";
				shadow=1;
			};
		};
		class RscStructuredText_1102: DT_RscStructuredText
		{
			idc=1102;
			x="0.453594 * safezoneW + safezoneX";
			y="0.346 * safezoneH + safezoneY";
			w="0.128906 * safezoneW";
			h="0.033 * safezoneH";
			class Attributes
			{
				font="PuristaLight";
				color="#ffffff";
				align="left";
				shadow=1;
			};
		};
		class RscEdit_1400: RscEditInvisible
		{
			idc=1400;
			text="0";
			maxChars=6;
			colorText[]={1,1,1,1};
			x="0.417 * safezoneW + safezoneX";
			y="0.406 * safezoneH + safezoneY";
			w="0.1715 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscCombo_2100: RscCombo
		{
			idc=2100;
			x="0.417 * safezoneW + safezoneX";
			y="0.469 * safezoneH + safezoneY";
			w="0.1715 * safezoneW";
			h="0.044 * safezoneH";
			colorBackground[]={0,0,0,0};
		};
		class RscButton_1600: RscButtonInvisible
		{
			idc=1600;
			onButtonClick="[2] call DT_fnc_useATM";
			x="0.424 * safezoneW + safezoneX";
			y="0.533 * safezoneH + safezoneY";
			w="0.154687 * safezoneW";
			h="0.037 * safezoneH";
		};
		class RscButton_1601: RscButtonInvisible
		{
			idc=1601;
			onButtonClick="closeDialog 0";
			x="0.404 * safezoneW + safezoneX";
			y="0.797 * safezoneH + safezoneY";
			w="0.0257812 * safezoneW";
			h="0.044 * safezoneH";
		};
	};
};
class DT_settings
{
	idd=1039;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_settings";
	movingEnable=0;
	onLoad="phone_appOpen = 1039";
	onUnload="phone_appOpen = 1031; [{!isNull (findDisplay 1031)},{((findDisplay 1031) displayCtrl 1200) ctrlSetText (phone_settings select 0)}] call CBA_fnc_waitUntilAndExecute;";
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=1200;
			text="\Dom_UI\phone\frame_settings.paa";
			x="0.231875 * safezoneW + safezoneX";
			y="0.038 * safezoneH + safezoneY";
			w="0.541406 * safezoneW";
			h="0.924 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=1202;
			x="0.575 * safezoneW + safezoneX";
			y="0.1435 * safezoneH + safezoneY";
			w="0.020625 * safezoneW";
			h="0.014 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=1100;
			x="0.547437 * safezoneW + safezoneX";
			y="0.143 * safezoneH + safezoneY";
			w="0.026 * safezoneW";
			h="0.016 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 32.5) * 1)";
			class Attributes
			{
				font="PuristaLight";
				color="#ffffff";
				align="right";
				shadow=1;
			};
		};
		class RscStructuredText_1101: DT_RscStructuredText
		{
			idc=1101;
			x="0.474219 * safezoneW + safezoneX";
			y="0.143 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.016 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 32.5) * 1)";
		};
		class RscPicture_1205: RscPicture
		{
			idc=1205;
			text="Dom_UI\phone\frame.paa";
			x="0.231875 * safezoneW + safezoneX";
			y="0.038 * safezoneH + safezoneY";
			w="0.541406 * safezoneW";
			h="0.924 * safezoneH";
		};
		class RscButton_1600: RscButtonInvisible
		{
			idc=1600;
			onButtonClick="closeDialog 0";
			x="0.402031 * safezoneW + safezoneX";
			y="0.17 * safezoneH + safezoneY";
			w="0.0309375 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscCombo_2100: RscCombo
		{
			idc=2100;
			x="0.407187 * safezoneW + safezoneX";
			y="0.261 * safezoneH + safezoneY";
			w="0.190781 * safezoneW";
			h="0.033 * safezoneH";
			colorBackground[]={0,0,0,0.30000001};
		};
		class RscCombo_2101: RscCombo
		{
			idc=2101;
			x="0.407187 * safezoneW + safezoneX";
			y="0.337 * safezoneH + safezoneY";
			w="0.190781 * safezoneW";
			h="0.033 * safezoneH";
			colorBackground[]={0,0,0,0.30000001};
		};
		class RscSlider_1900: RscSlider
		{
			idc=1900;
			x="0.407187 * safezoneW + safezoneX";
			y="0.42 * safezoneH + safezoneY";
			w="0.190781 * safezoneW";
			h="0.033 * safezoneH";
			color[]={1,1,1,0.80000001};
		};
		class RscStructuredText_1102: DT_RscStructuredText
		{
			idc=1102;
			onLoad="(_this select 0) ctrlSetStructuredText parseText (player getVariable ['phoneNumber',''])";
			x="0.407187 * safezoneW + safezoneX";
			y="0.489 * safezoneH + safezoneY";
			w="0.190781 * safezoneW";
			h="0.031 * safezoneH";
		};
		class RscButton_1601: RscButtonInvisible
		{
			idc=1601;
			onButtonClick="call DT_fnc_updateSettings";
			x="0.407187 * safezoneW + safezoneX";
			y="0.753 * safezoneH + safezoneY";
			w="0.190781 * safezoneW";
			h="0.055 * safezoneH";
		};
	};
};
class DT_newMessage
{
	idd=1040;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_newMessage";
	movingEnable=0;
	onLoad="phone_appOpen = 1040";
	onUnload="phone_appOpen = 1034; [{isNull (findDisplay 1034)},{call DT_fnc_initInbox}] call CBA_fnc_waitUntilAndExecute;";
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=1200;
			text="\Dom_UI\phone\frame_newMessage.paa";
			x="0.231875 * safezoneW + safezoneX";
			y="0.038 * safezoneH + safezoneY";
			w="0.541406 * safezoneW";
			h="0.924 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=1202;
			x="0.575 * safezoneW + safezoneX";
			y="0.1435 * safezoneH + safezoneY";
			w="0.020625 * safezoneW";
			h="0.014 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=1100;
			x="0.547437 * safezoneW + safezoneX";
			y="0.143 * safezoneH + safezoneY";
			w="0.026 * safezoneW";
			h="0.016 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 32.5) * 1)";
			class Attributes
			{
				font="PuristaLight";
				color="#ffffff";
				align="right";
				shadow=1;
			};
		};
		class RscStructuredText_1101: DT_RscStructuredText
		{
			idc=1101;
			x="0.474219 * safezoneW + safezoneX";
			y="0.143 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.016 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 32.5) * 1)";
		};
		class RscPicture_1205: RscPicture
		{
			idc=1205;
			text="Dom_UI\phone\frame.paa";
			x="0.231875 * safezoneW + safezoneX";
			y="0.038 * safezoneH + safezoneY";
			w="0.541406 * safezoneW";
			h="0.924 * safezoneH";
		};
		class RscButton_1600: RscButtonInvisible
		{
			idc=1600;
			onButtonClick="closeDialog 0";
			x="0.402031 * safezoneW + safezoneX";
			y="0.17 * safezoneH + safezoneY";
			w="0.0309375 * safezoneW";
			h="0.044 * safezoneH";
			colorBackground[]={0,0,0,0};
		};
		class RscEdit_1400: RscEditInvisible
		{
			idc=1400;
			colorText[]={1,1,1,1};
			x="0.407187 * safezoneW + safezoneX";
			y="0.753 * safezoneH + safezoneY";
			w="0.149531 * safezoneW";
			h="0.082 * safezoneH";
		};
		class RscButton_1601: RscButtonInvisible
		{
			idc=1601;
			onButtonClick="call DT_fnc_sendText";
			x="0.563 * safezoneW + safezoneX";
			y="0.817 * safezoneH + safezoneY";
			w="0.04 * safezoneW";
			h="0.024 * safezoneH";
		};
		class RscEdit_1401: RscEdit_1400
		{
			idc=1401;
			x="0.41 * safezoneW + safezoneX";
			y="0.252 * safezoneH + safezoneY";
			w="0.185625 * safezoneW";
			h="0.032 * safezoneH";
		};
		class RscStructuredText_1103: DT_RscStructuredText
		{
			idc=1103;
			x="0.443281 * safezoneW + safezoneX";
			y="0.17 * safezoneH + safezoneY";
			w="0.134062 * safezoneW";
			h="0.044 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 15) * 1)";
		};
	};
};
class DT_manageShop
{
	idd=1041;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_manageShop";
	movingEnable=0;
	onUnLoad="MB_Interaction_Target setVariable ['shop_inUse',false,true]";
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\misc\manageShop.paa";
			x="0.216406 * safezoneW + safezoneX";
			y="0.038 * safezoneH + safezoneY";
			w="0.5775 * safezoneW";
			h="0.913 * safezoneH";
		};
		class RscListbox_1500: RscListboxInvisible
		{
			idc=1500;
			onLBSelChanged="['leftOnLBSelChanged',(_this select 1)] call DT_fnc_manageShop";
			x="0.249 * safezoneW + safezoneX";
			y="0.283 * safezoneH + safezoneY";
			w="0.173 * safezoneW";
			h="0.505 * safezoneH";
		};
		class RscListbox_1501: RscListboxInvisible
		{
			idc=1501;
			onLBSelChanged="['rightOnLBSelChanged',(_this select 1)] call DT_fnc_manageShop";
			x="0.5882 * safezoneW + safezoneX";
			y="0.283 * safezoneH + safezoneY";
			w="0.173 * safezoneW";
			h="0.505 * safezoneH";
		};
		class RscButton_1600: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="['addItem'] call DT_fnc_manageShop";
			x="0.453594 * safezoneW + safezoneX";
			y="0.478 * safezoneH + safezoneY";
			w="0.0360937 * safezoneW";
			h="0.055 * safezoneH";
		};
		class RscButton_1601: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="['removeItem'] call DT_fnc_manageShop";
			x="0.520625 * safezoneW + safezoneX";
			y="0.478 * safezoneH + safezoneY";
			w="0.0360937 * safezoneW";
			h="0.055 * safezoneH";
		};
		class RscEdit_1400: RscEditInvisible
		{
			idc=1400;
			colorText[]={1,1,1,1};
			text="Quantity";
			x="0.438125 * safezoneW + safezoneX";
			y="0.312 * safezoneH + safezoneY";
			w="0.134 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscEdit_1401: RscEditInvisible
		{
			idc=1401;
			colorText[]={1,1,1,1};
			text="Price";
			x="0.438125 * safezoneW + safezoneX";
			y="0.366 * safezoneH + safezoneY";
			w="0.134 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscButton_1602: RscButtonGeneral
		{
			idc=1602;
			text="Update";
			onButtonClick="['updateItem'] call DT_fnc_manageShop";
			x="0.448438 * safezoneW + safezoneX";
			y="0.412 * safezoneH + safezoneY";
			w="0.113437 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=1100;
			x="0.438125 * safezoneW + safezoneX";
			y="0.588 * safezoneH + safezoneY";
			w="0.134062 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscButton_1603: RscButtonGeneral
		{
			idc=1603;
			text="Withdraw";
			onButtonClick="['withdrawFunds'] call DT_fnc_manageShop";
			x="0.448438 * safezoneW + safezoneX";
			y="0.632 * safezoneH + safezoneY";
			w="0.113437 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscEdit_1402: RscEditInvisible
		{
			idc=1402;
			colorText[]={1,1,1,1};
			onLoad="(_this select 0) ctrlSetText (MB_Interaction_Target getVariable ['shop_name',''])";
			maxChars=32;
			x="0.438125 * safezoneW + safezoneX";
			y="0.709 * safezoneH + safezoneY";
			w="0.134 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscButton_1604: RscButtonGeneral
		{
			idc=1604;
			text="Update";
			onButtonClick="['updateName'] call DT_fnc_manageShop";
			x="0.448438 * safezoneW + safezoneX";
			y="0.753 * safezoneH + safezoneY";
			w="0.113437 * safezoneW";
			h="0.022 * safezoneH";
		};
	};
};
class DT_playerShop
{
	idd=1042;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_playerShop";
	movingEnable=0;
	onUnLoad="MB_Interaction_Target setVariable ['shop_inUse',false,true]";
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\misc\store.paa";
			x="0.298906 * safezoneW + safezoneX";
			y="0.016 * safezoneH + safezoneY";
			w="0.391875 * safezoneW";
			h="0.968 * safezoneH";
		};
		class RscListbox_1500: RscListboxInvisible
		{
			idc=1500;
			onLBSelChanged="_this call DT_fnc_playerShopLBchange";
			x="0.4195 * safezoneW + safezoneX";
			y="0.2375 * safezoneH + safezoneY";
			w="0.152 * safezoneW";
			h="0.519 * safezoneH";
		};
		class RscStructuredText_1102: DT_RscStructuredText
		{
			idc=1102;
			x="0.4195 * safezoneW + safezoneX";
			y="0.775 * safezoneH + safezoneY";
			w="0.149531 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscStructuredText_1101: DT_RscStructuredText
		{
			idc=1101;
			x="0.412344 * safezoneW + safezoneX";
			y="0.1825 * safezoneH + safezoneY";
			w="0.165 * safezoneW";
			h="0.033 * safezoneH";
		};
		class RscButton_1600: RscButtonGeneral
		{
			idc=1600;
			onButtonClick="call DT_fnc_buyPlayerShop";
			text="Buy";
			x="0.5 * safezoneW + safezoneX";
			y="0.83 * safezoneH + safezoneY";
			w="0.0670311 * safezoneW";
			h="0.0262 * safezoneH";
		};
		class RscButton_1601: RscButtonGeneral
		{
			onButtonClick="closeDialog 0";
			idc=-1;
			text="Close";
			x="0.422656 * safezoneW + safezoneX";
			y="0.83 * safezoneH + safezoneY";
			w="0.0670311 * safezoneW";
			h="0.0262 * safezoneH";
		};
	};
};
class DT_criminalCode
{
	idd=1043;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_criminalCode";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\tabletFrame.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1201: RscPicture
		{
			idc=1201;
			onLoad="(_this select 0) ctrlSetText format['\Dom_UI\policeDatabase\Backgrounds\BG_%1',player getVariable ['department','Patrol']]";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscPicture_1202: RscPicture
		{
			idc=-1;
			text="\Dom_UI\policeDatabase\Backgrounds\menu_criminalCode.paa";
			x="0.175 * safezoneW + safezoneX";
			y="-0.06 * safezoneH + safezoneY";
			w="0.7 * safezoneW";
			h="1.1 * safezoneH";
		};
		class RscListbox_1500: RscTreeInvisibleSearch
		{
			idc=1500;
			onTreeSelChanged="_this call DT_fnc_crimCodeChange";
			x="0.246 * safezoneW + safezoneX";
			y="0.357 * safezoneH + safezoneY";
			w="0.308 * safezoneW";
			h="0.276 * safezoneH";
		};
		class RscEdit_1400: RscEditInvisible
		{
			idc=645;
			style="0x00 + 0x0200";
			maxChars=50;
			x="0.324687 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.268125 * safezoneW";
			h="0.026 * safezoneH";
		};
		class RscControlsGroup_2300: RscControlsGroup
		{
			idc=2300;
			x="0.565 * safezoneW + safezoneX";
			y="0.357 * safezoneH + safezoneY";
			w="0.24 * safezoneW";
			h="0.275 * safezoneH";
			class Controls
			{
				class RscStructuredText_1100: DT_RscStructuredText
				{
					idc=1205;
					text="";
					sizeEx=0.025;
					x="0 * safezoneW";
					y="0 * safezoneH";
					w="0.239 * safezoneW";
					h="0.275 * safezoneH";
				};
			};
		};
		class RscButton_1600: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="";
			x="0.6 * safezoneW + safezoneX";
			y="0.3 * safezoneH + safezoneY";
			w="0.075 * safezoneW";
			h="0.04 * safezoneH";
		};
		class RscButton_1607: RscButtonInvisible
		{
			idc=-1;
			onButtonClick="closeDialog 0";
			x="0.737188 * safezoneW + safezoneX";
			y="0.676 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.033 * safezoneH";
		};
	};
};
class DT_transferMenu
{
	idd=1044;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_transferMenu";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\misc\giveKeys.paa";
			x="0.288594 * safezoneW + safezoneX";
			y="0.192 * safezoneH + safezoneY";
			w="0.4125 * safezoneW";
			h="0.638 * safezoneH";
		};
		class RscListbox_1500: RscListboxInvisible
		{
			idc=1500;
			x="0.319531 * safezoneW + safezoneX";
			y="0.428 * safezoneH + safezoneY";
			w="0.350625 * safezoneW";
			h="0.176 * safezoneH";
		};
		class RscStructuredText_1100: DT_RscStructuredText
		{
			idc=1100;
			onLoad="(_this select 0) ctrlSetText format['Transfer to: %1',(['Unknown',MB_Interaction_Target] call DT_fnc_findName)]";
			x="0.304062 * safezoneW + safezoneX";
			y="0.375 * safezoneH + safezoneY";
			w="0.381563 * safezoneW";
			h="0.022 * safezoneH";
		};
		class RscButton_1600: RscButtonGeneral
		{
			idc=-1;
			text="Transfer";
			onButtonClick="[MB_Interaction_Target] call DT_fnc_transferVehicle";
			x="0.448438 * safezoneW + safezoneX";
			y="0.617 * safezoneH + safezoneY";
			w="0.0876563 * safezoneW";
			h="0.0262 * safezoneH";
		};
	};
};
class DT_modShop
{
	idd=1045;
	name="DT_modShop";
	onUnload="['mod'] call DT_fnc_closeShop";
	onMouseButtonDown="_this call DT_fnc_clickChecker; _this call DT_fnc_onMouseButtonDown";
	onMouseButtonUp="_this call DT_fnc_onMouseButtonUp";
	movingEnable=0;
	class controlsBackground
	{
		class DT_background: DT_ctrlStatic
		{
			idc=1100;
			style=16;
			onMouseMoving="_this call DT_fnc_handleMouse";
			onMouseHolding="_this call DT_fnc_handleMouse";
			onMouseZChanged="_this call DT_fnc_handleScroll";
			x="safezoneX";
			y="safezoneY";
			w="safezoneW";
			h="safezoneH";
		};
	};
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\misc\store.paa";
			x="-0.0826563 * safezoneW + safezoneX";
			y="0.016 * safezoneH + safezoneY";
			w="0.391875 * safezoneW";
			h="0.968 * safezoneH";
		};
		class RscListbox_1500: RscTreeInvisible
		{
			idc=1500;
			onTreeSelChanged="_this call DT_fnc_modShopChange";
			x="0.0368 * safezoneW + safezoneX";
			y="0.238 * safezoneH + safezoneY";
			w="0.152 * safezoneW";
			h="0.519 * safezoneH";
		};
		class RscStructuredText_1102: DT_RscStructuredText
		{
			idc=1102;
			x="0.0359375 * safezoneW + safezoneX";
			y="0.775 * safezoneH + safezoneY";
			w="0.149531 * safezoneW";
			h="0.044 * safezoneH";
		};
		class RscStructuredText_1101: DT_RscStructuredText
		{
			idc=1101;
			x="0.0307812 * safezoneW + safezoneX";
			y="0.186 * safezoneH + safezoneY";
			w="0.165 * safezoneW";
			h="0.033 * safezoneH";
			size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) * 1)";
		};
		class RscButton_1600: RscButtonGeneral
		{
			idc=1600;
			text="Buy";
			onButtonClick="call DT_fnc_buyMods";
			x="0.118437 * safezoneW + safezoneX";
			y="0.83 * safezoneH + safezoneY";
			w="0.0670312 * safezoneW";
			h="0.0262 * safezoneH";
		};
		class RscButton_1601: RscButtonGeneral
		{
			idc=-1;
			text="Close";
			onButtonClick="closeDialog 0";
			x="0.0359375 * safezoneW + safezoneX";
			y="0.83 * safezoneH + safezoneY";
			w="0.0670312 * safezoneW";
			h="0.0262 * safezoneH";
		};
	};
};
class DT_spectateMenu
{
	idd=1046;
	name="DT_spectateMenu";
	onUnload="['none'] call DT_fnc_closeShop";
	onMouseButtonDown="_this call DT_fnc_clickChecker; _this call DT_fnc_onMouseButtonDown";
	onMouseButtonUp="_this call DT_fnc_onMouseButtonUp";
	movingEnable=0;
	class controlsBackground
	{
		class DT_background: DT_ctrlStatic
		{
			idc=1100;
			style=16;
			onMouseMoving="_this call DT_fnc_handleMouse";
			onMouseHolding="_this call DT_fnc_handleMouse";
			onMouseZChanged="_this call DT_fnc_handleScroll";
			x="safezoneX";
			y="safezoneY";
			w="safezoneW";
			h="safezoneH";
		};
	};
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\misc\store.paa";
			x="-0.0826563 * safezoneW + safezoneX";
			y="0.016 * safezoneH + safezoneY";
			w="0.391875 * safezoneW";
			h="0.968 * safezoneH";
		};
		class RscListbox_1500: RscListboxInvisible
		{
			idc=1500;
			onLoad="params ['_control']; {_control lbAdd (name _x)} forEach playableUnits;";
			onLBSelChanged="params ['_control','_index']; if !(isNull client_target) then {['none'] call DT_fnc_closeShop}; ['Spectate',(playableUnits select _index)] call DT_fnc_setupCamera";
			x="0.0368 * safezoneW + safezoneX";
			y="0.238 * safezoneH + safezoneY";
			w="0.152 * safezoneW";
			h="0.519 * safezoneH";
		};
		class RscButton_1601: RscButtonGeneral
		{
			idc=-1;
			text="Close";
			onButtonClick="closeDialog 0";
			x="0.0359375 * safezoneW + safezoneX";
			y="0.83 * safezoneH + safezoneY";
			w="0.0670312 * safezoneW";
			h="0.0262 * safezoneH";
		};
	};
};
class DT_bombTimer
{
	idd=1047;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_bombTimer";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\misc\setName.paa";
			x="0.288594 * safezoneW + safezoneX";
			y="0.192 * safezoneH + safezoneY";
			w="0.4125 * safezoneW";
			h="0.638 * safezoneH";
		};
		class RscEdit_1400: RscEditInvisible
		{
			idc=1400;
			maxChars=3;
			colorText[]={1,1,1,1};
			onLoad="(_this select 0) ctrlSetText '15'";
			x="0.407187 * safezoneW + safezoneX";
			y="0.48 * safezoneH + safezoneY";
			w="0.175313 * safezoneW";
			h="0.03 * safezoneH";
		};
		class RscButton_1600: RscButtonGeneral
		{
			idc=-1;
			text="Start";
			onButtonClick="[true] call DT_fnc_startJailbreak";
			x="0.448438 * safezoneW + safezoneX";
			y="0.518 * safezoneH + safezoneY";
			w="0.0876563 * safezoneW";
			h="0.0262 * safezoneH";
		};
	};
};
class DT_carNumbers
{
	idd=1048;
	onMouseButtonDown="_this call DT_fnc_clickChecker";
	name="DT_carNumbers";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc=-1;
			text="\Dom_UI\misc\setName.paa";
			x="0.288594 * safezoneW + safezoneX";
			y="0.192 * safezoneH + safezoneY";
			w="0.4125 * safezoneW";
			h="0.638 * safezoneH";
		};
		class RscEdit_1400: RscEditInvisible
		{
			idc=1400;
			maxChars=4;
			colorText[]={1,1,1,1};
			x="0.407187 * safezoneW + safezoneX";
			y="0.48 * safezoneH + safezoneY";
			w="0.175313 * safezoneW";
			h="0.03 * safezoneH";
		};
		class RscButton_1600: RscButtonGeneral
		{
			idc=-1;
			text="Set";
			onButtonClick="[vehicle player,ctrlText 1400] call ivory_fnc_setPoliceNum";
			x="0.448438 * safezoneW + safezoneX";
			y="0.518 * safezoneH + safezoneY";
			w="0.0876563 * safezoneW";
			h="0.0262 * safezoneH";
		};
	};
};
class RscTitles
{
	class DT_Notifications
	{
		idd=-1;
		duration=1e+012;
		onLoad="uiNamespace setVariable [""DT_Notifs"",_this select 0]";
		class controls
		{
			class Message: DT_RscStructuredText
			{
				idc=1200;
				x="-0.000156274 * safezoneW + safezoneX";
				y="-0.00199999 * safezoneH + safezoneY";
				w="0.311406 * safezoneW";
				h="0.55 * safezoneH";
				sizeEx=1;
				class Attributes
				{
					align="left";
					valign="middle";
					size=1;
				};
			};
		};
	};
	class DT_Progress
	{
		idd=-1;
		duration=1e+012;
		name="DT_Progress";
		onLoad="uiNamespace setVariable ['Progress_Bar',_this select 0]";
		class controls
		{
			class Bar: DT_RscProgress
			{
				idc=1000;
				text="";
				x="0.185469 * safezoneW + safezoneX";
				y="0.874 * safezoneH + safezoneY";
				w="0.623906 * safezoneW";
				h="0.022 * safezoneH";
			};
			class Title: DT_RscStructuredText
			{
				idc=1001;
				x="0.443281 * safezoneW + safezoneX";
				y="0.874 * safezoneH + safezoneY";
				w="0.0979687 * safezoneW";
				h="0.022 * safezoneH";
				sizeEx=1;
				class Attributes
				{
					align="center";
					valign="middle";
					size=1;
				};
			};
		};
	};
	class DT_HUD
	{
		idd=-1;
		duration=1e+012;
		name="DT_HUD";
		onLoad="uiNamespace setVariable ['DT_HUD',_this select 0]";
		class controls
		{
			class food: RscPicture
			{
				idc=1500;
				text="";
				x="0.95375 * safezoneW + safezoneX";
				y="0.544 * safezoneH + safezoneY";
				w="0.0257812 * safezoneW";
				h="0.044 * safezoneH";
			};
			class drink: RscPicture
			{
				idc=1501;
				text="";
				x="0.95375 * safezoneW + safezoneX";
				y="0.599 * safezoneH + safezoneY";
				w="0.0257812 * safezoneW";
				h="0.044 * safezoneH";
			};
			class health: RscPicture
			{
				idc=1502;
				text="";
				x="0.95375 * safezoneW + safezoneX";
				y="0.489 * safezoneH + safezoneY";
				w="0.0257812 * safezoneW";
				h="0.044 * safezoneH";
			};
			class seatbelt: RscPicture
			{
				idc=1503;
				text="";
				x="0.95375 * safezoneW + safezoneX";
				y="0.775 * safezoneH + safezoneY";
				w="0.0257812 * safezoneW";
				h="0.044 * safezoneH";
			};
			class camera: RscPicture
			{
				idc=1504;
				text="";
				x="0.95375 * safezoneW + safezoneX";
				y="0.709 * safezoneH + safezoneY";
				w="0.0257812 * safezoneW";
				h="0.044 * safezoneH";
			};
			class extraPicture: RscPicture
			{
				idc=1505;
				text="";
				x="0.95375 * safezoneW + safezoneX";
				y="0.654 * safezoneH + safezoneY";
				w="0.0257812 * safezoneW";
				h="0.044 * safezoneH";
			};
			class name: DT_RscStructuredText
			{
				idc=-1;
				onLoad="(_this select 0) ctrlSetStructuredText parseText profileName";
				x="0.8 * safezoneW + safezoneX";
				y="0.974 * safezoneH + safezoneY";
				w="0.2 * safezoneW";
				h="0.024 * safezoneH";
				class Attributes
				{
					font="PuristaLight";
					color="#ffffff";
					align="right";
					shadow=1;
				};
			};
			class gun: RscPictureKeepAspect
			{
				idc=1507;
				text="";
				x="0.89 * safezoneW + safezoneX";
				y="0.00500001 * safezoneH + safezoneY";
				w="0.109 * safezoneW";
				h="0.088 * safezoneH";
			};
			class firemode: DT_RscStructuredText
			{
				idc=1508;
				x="0.9175 * safezoneW + safezoneX";
				y="0.104 * safezoneH + safezoneY";
				w="0.05125 * safezoneW";
				h="0.022 * safezoneH";
				class Attributes
				{
					font="PuristaLight";
					color="#ffffff";
					align="center";
					shadow=1;
				};
			};
			class gunName: DT_RscStructuredText
			{
				idc=1509;
				x="0.720469 * safezoneW + safezoneX";
				y="0.00500001 * safezoneH + safezoneY";
				w="0.170156 * safezoneW";
				h="0.022 * safezoneH";
				class Attributes
				{
					font="PuristaLight";
					color="#ffffff";
					align="right";
					shadow=1;
				};
			};
			class magazines: gunName
			{
				idc=1510;
				x="0.720469 * safezoneW + safezoneX";
				y="0.038 * safezoneH + safezoneY";
				w="0.170156 * safezoneW";
				h="0.022 * safezoneH";
			};
			class ammo: gunName
			{
				idc=1511;
				x="0.720469 * safezoneW + safezoneX";
				y="0.071 * safezoneH + safezoneY";
				w="0.170156 * safezoneW";
				h="0.022 * safezoneH";
			};
			class charging: firemode
			{
				idc=1512;
				x="0.29375 * safezoneW + safezoneX";
				y="0.005 * safezoneH + safezoneY";
				w="0.4125 * safezoneW";
				h="0.022 * safezoneH";
				class Attributes
				{
					font="PuristaLight";
					color="#5FC900";
					align="center";
					shadow=1;
				};
			};
			class jailTime: firemode
			{
				idc=1513;
				x="0.29375 * safezoneW + safezoneX";
				y="0.027 * safezoneH + safezoneY";
				w="0.4125 * safezoneW";
				h="0.022 * safezoneH";
				size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) * 1)";
				class Attributes
				{
					font="PuristaLight";
					color="#B0B0B0";
					align="center";
					shadow=1;
				};
			};
			class jailReason: jailTime
			{
				idc=1514;
				x="-0.00531252 * safezoneW + safezoneX";
				y="0.051 * safezoneH + safezoneY";
				w="1.00547 * safezoneW";
				class Attributes
				{
					font="PuristaLight";
					color="#FF9500";
					align="center";
					shadow=1;
				};
			};
		};
	};
	class DT_popupPhone
	{
		idd=-1;
		duration=1e+012;
		name="DT_popupPhone";
		onLoad="uiNamespace setVariable ['DT_popupPhone',_this select 0]";
		class controls
		{
			class RscPicture_1200: RscPicture
			{
				idc=1200;
				text="\Dom_UI\phone\backgrounds\background1.paa";
				x="0.742344 * safezoneW + safezoneX";
				y="0.17 * safezoneH + safezoneY";
				w="0.345469 * safezoneW";
				h="0.638 * safezoneH";
			};
			class RscPicture_1205: RscPicture
			{
				idc=1205;
				text="Dom_UI\phone\frame.paa";
				x="0.742344 * safezoneW + safezoneX";
				y="0.17 * safezoneH + safezoneY";
				w="0.345469 * safezoneW";
				h="0.638 * safezoneH";
			};
			class RscStructuredText_1100: DT_RscStructuredText
			{
				idc=1100;
				x="0.850625 * safezoneW + safezoneX";
				y="0.269 * safezoneH + safezoneY";
				w="0.128906 * safezoneW";
				h="0.06 * safezoneH";
			};
			class RscStructuredText_1101: DT_RscStructuredText
			{
				idc=1101;
				x="0.850625 * safezoneW + safezoneX";
				y="0.295 * safezoneH + safezoneY";
				w="0.128906 * safezoneW";
				h="0.432 * safezoneH";
				size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
				class Attributes
				{
					font="PuristaLight";
					color="#ffffff";
					align="left";
					shadow=1;
				};
			};
		};
	};
};

#include "radio_ids.hpp"
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
		tf_range=50000;
		tf_dialog="";
		tf_encryptionCode="tf_west_radio_code";
		tf_dialogUpdate = "call TFAR_fnc_updateSWDialogToChannel;";
		tf_subtype="digital";
		tf_parent="D_Phone";
		tf_additional_channel=1;
	};
	TF_RADIO_IDS(D_Phone,dPhone)
};

class cfgMods
{
	author="Happy Panda";
	timepacked="1564939390";
};