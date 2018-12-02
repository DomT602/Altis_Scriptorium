class CfgPatches
{
	class Dom_UI
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredaddons[]=
		{
			"Dom_Client"
		};
	};
};
#define ST_LEFT           0x00
#define ST_CENTER           0x02
#define ST_MULTI          0x10
#define GUI_GRID_CENTER_WAbs        ((safezoneW / safezoneH) min 1.2)
#define GUI_GRID_CENTER_HAbs        (GUI_GRID_CENTER_WAbs / 1.2)
#define GUI_GRID_CENTER_W        (GUI_GRID_CENTER_WAbs / 40)
#define GUI_GRID_CENTER_H        (GUI_GRID_CENTER_HAbs / 25)
#define GUI_GRID_CENTER_X        (safezoneX + (safezoneW - GUI_GRID_CENTER_WAbs)/2)
#define GUI_GRID_CENTER_Y        (safezoneY + (safezoneH - GUI_GRID_CENTER_HAbs)/2)

class PS_Checkbox
{
    idc = -1; // Control identification (without it, the control won't be displayed)
    type = 77; // Type
    style = ST_LEFT + ST_MULTI; // Style
    default = 0; // Control selected by default (only one within a display can be used)
    blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.

    x = 0;
    y = 0;
    w = 1 * GUI_GRID_CENTER_W; // Width
    h = 1 * GUI_GRID_CENTER_H; // Height

    //Colors
    color[] = { 1, 1, 1, 0.7 }; // Texture color
    colorFocused[] = { 1, 1, 1, 1 }; // Focused texture color
    colorHover[] = { 1, 1, 1, 1 }; // Mouse over texture color
    colorPressed[] = { 1, 1, 1, 1 }; // Mouse pressed texture color
    colorDisabled[] = { 1, 1, 1, 0.2 }; // Disabled texture color

    //Background colors
    colorBackground[] = { 0, 0, 0, 0 }; // Fill color
    colorBackgroundFocused[] = { 0, 0, 0, 0 }; // Focused fill color
    colorBackgroundHover[] = { 0, 0, 0, 0 }; // Mouse hover fill color
    colorBackgroundPressed[] = { 0, 0, 0, 0 }; // Mouse pressed fill color
    colorBackgroundDisabled[] = { 0, 0, 0, 0 }; // Disabled fill color

    //Textures
    textureChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";        //Texture of checked CheckBox.
    textureUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";        //Texture of unchecked CheckBox.
    textureFocusedChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";    //Texture of checked focused CheckBox (Could be used for showing different texture when focused).
    textureFocusedUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";    //Texture of unchecked focused CheckBox.
    textureHoverChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureHoverUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    texturePressedChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    texturePressedUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    textureDisabledChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureDisabledUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";

    tooltip = ""; // Tooltip text
    tooltipColorShade[] = { 0, 0, 0, 1 }; // Tooltip background color
    tooltipColorText[] = { 1, 1, 1, 1 }; // Tooltip text color
    tooltipColorBox[] = { 1, 1, 1, 1 }; // Tooltip frame color

    //Sounds
    soundClick[] = { "\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1 }; // Sound played after control is activated in format {file, volume, pitch}
    soundEnter[] = { "\A3\ui_f\data\sound\RscButton\soundEnter", 0.09, 1 }; // Sound played when mouse cursor enters the control
    soundPush[] = { "\A3\ui_f\data\sound\RscButton\soundPush", 0.09, 1 }; // Sound played when the control is pushed down
    soundEscape[] = { "\A3\ui_f\data\sound\RscButton\soundEscape", 0.09, 1 }; // Sound played when the control is released after pushing down

};

class PS_RscScrollBar
{
    color[] = {1,1,1,0.6};
    colorActive[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.3};
    thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
    arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
    shadow = 0;
    scrollSpeed = 0.06;
    width = 0;
    height = 0;
    autoScrollEnabled = 1;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
};

class PS_RscControlsGroup {
    type = 15;
    idc = -1;
    x = 0;
    y = 0;
    w = 1;
    h = 1;
    shadow = 0;
    style = 16;

    class VScrollBar : PS_RscScrollBar
    {
        width = 0.021;
        autoScrollEnabled = 1;
    };

    class HScrollBar : PS_RscScrollBar
    {
        height = 0.028;
    };

    class Controls {};
};

class PS_RscControlsGroupNoScrollbars : PS_RscControlsGroup {
    class VScrollbar : VScrollbar {
        width = 0;
    };

    class HScrollbar : HScrollbar {
        height = 0;
    };
};

class PS_RscListNBox
{
    style = 16;
    type = 102;
    shadow = 0;
    font = "PuristaLight";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    color[] = {0.95,0.95,0.95,1};
    colorText[] = {1,1,1,1.0};
    colorDisabled[] = {1,1,1,0.25};
    colorScrollbar[] = {0.95,0.95,0.95,1};
    colorSelect[] = {0,0,0,1};
    colorSelect2[] = {0,0,0,1};
    colorSelectBackground[] = {0.8,0.8,0.8,1};
    colorSelectBackground2[] = {1,1,1,0.5};
    colorPicture[] = {1,1,1,1};
    colorPictureSelected[] = {1,1,1,1};
        colorPictureDisabled[] = {1,1,1,1};
    soundSelect[] = {"",0.1,1};
    soundExpand[] = {"",0.1,1};
    soundCollapse[] = {"",0.1,1};
    period = 1.2;
    maxHistoryDelay = 0.5;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
    class ListScrollBar: PS_RscScrollBar{};
    class ScrollBar: PS_RscScrollBar{};
};


class PS_RscText {
    x = 0;
    y = 0;
    h = 0.037;
    w = 0.3;
    type = 0;
    style = 0;
    shadow = 1;
    colorShadow[] = {0, 0, 0, 0.5};
    font = "PuristaLight";
    SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    text = "";
    colorText[] = {1, 1, 1, 1.0};
    colorBackground[] = {0.529,0,0,1};
    linespacing = 1;
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
};

class PS_RscLine: PS_RscText {
    idc = -1;
    style = 176;
    x = 0.17;
    y = 0.48;
    w = 0.66;
    h = 0;
    text = "";
    colorBackground[] = {0, 0, 0, 0};
    colorText[] = {1, 1, 1, 1.0};
};

class PS_RscTitle: PS_RscText {
    style = 0;
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    colorText[] = {0.95, 0.95, 0.95, 1};
};

class PS_RscPicture {
    shadow = 0;
    type = 0;
    style = 48;
    sizeEx = 0.023;
    font = "PuristaLight";
    colorBackground[] = {};
    colorText[] = {};
    x = 0;
    y = 0;
    w = 0.2;
    h = 0.15;
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
};

class PS_RscTextMulti: PS_RscText
{
    linespacing = 1;
    style = 0 + 16 + 0x200;
};

class PS_RscPictureKeepAspect : PS_RscPicture
{
    style = 0x30 + 0x800;
};

class PS_RscStructuredText {
    type = 13;
    style = 0;
    x = 0;
    y = 0;
    h = 0.035;
    w = 0.1;
    text = "";
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    colorText[] = {1, 1, 1, 1.0};
    shadow = 1;
    sizeEx = 0.035;
    class Attributes {
        font = "PuristaLight";
        color = "#ffffff";
        align = "center";
        shadow = 1;
    };
};

class PS_RscButton
{
	deletable = 0;
	fade = 0;
	type = 1;
	text = "";
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	colorDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	colorBackground[] = 
	{
		0,
		0,
		0,
		0.5
	};
	colorBackgroundDisabled[] = 
	{
		0,
		0,
		0,
		0.5
	};
	colorBackgroundActive[] = 
	{
		0,
		0,
		0,
		0.5
	};
	colorFocused[] = 
	{
		0,
		0,
		0,
		0.5
	};
	colorShadow[] = 
	{
		0,
		0,
		0,
		0
	};
	colorBorder[] = 
	{
		0,
		0,
		0,
		1
	};
	soundEnter[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.09,
		1
	};
	soundPush[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.09,
		1
	};
	soundClick[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.09,
		1
	};
	soundEscape[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.09,
		1
	};
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = 0;
	offsetPressedY = 0;
	borderSize = 0;
};

class PS_RscButtonTextOnly : PS_RscButton {
    SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    colorBackground[] = {1, 1, 1, 0};
    colorBackgroundActive[] = {1, 1, 1, 0};
    colorBackgroundDisabled[] = {1, 1, 1, 0};
    colorFocused[] = {1, 1, 1, 0};
    colorShadow[] = {1, 1, 1, 0};
    borderSize = 0.0;
};

class PS_RscShortcutButton {
    idc = -1;
    style = 0;
    default = 0;
    shadow = 1;
    w = 0.183825;
    h = "((((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
    color[] = {1,1,1,1.0};
    colorFocused[] = {1,1,1,1.0};
    color2[] = {0.95,0.95,0.95,1};
    colorDisabled[] = {1,1,1,0.25};
    colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
    colorBackgroundFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
    colorBackground2[] = {1,1,1,1};
    animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
    animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
    animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
    animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
    animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
    animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
    periodFocus = 1.2;
    periodOver = 0.8;
    class HitZone
    {
        left = 0.0;
        top = 0.0;
        right = 0.0;
        bottom = 0.0;
    };
    class ShortcutPos
    {
        left = 0;
        top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
        w = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
        h = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    };
    class TextPos
    {
        left = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
        top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
        right = 0.005;
        bottom = 0.0;
    };
    period = 0.4;
    font = "PuristaLight";
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    text = "";
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
    action = "";
    class Attributes
    {
        font = "PuristaLight";
        color = "#E5E5E5";
        align = "center";
        shadow = "true";
    };
    class AttributesImage
    {
        font = "PuristaLight";
        color = "#E5E5E5";
        align = "center";
    };
};

class PS_RscButtonMenu : PS_RscShortcutButton {
    idc = -1;
    type = 16;
    style = "0x02 + 0xC0";
    default = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.095589;
    h = 0.039216;
    animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
    animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
    colorBackground[] = {0.529,0,0,1};
    colorBackgroundFocused[] = {1,1,1,1};
    colorBackground2[] = {0.75,0.75,0.75,1};
    color[] = {1,1,1,1};
    colorFocused[] = {0,0,0,1};
    color2[] = {0,0,0,1};
    colorText[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.25};
    period = 1.2;
    periodFocus = 1.2;
    periodOver = 1.2;
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
    class TextPos
    {
        left = "0.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
        top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
        right = 0.005;
        bottom = 0.0;
    };
    class Attributes
    {
        font = "PuristaLight";
        color = "#E5E5E5";
        align = "center";
        shadow = "false";
    };
    class ShortcutPos
    {
        left = "(6.25 * (((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
        top = 0.005;
        w = 0.0225;
        h = 0.03;
    };
    soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1};
    soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1};
    textureNoShortcut = "";
};

class PS_RscShortcutButtonMain : PS_RscShortcutButton {
    idc = -1;
    style = 0;
    default = 0;
    w = 0.313726;
    h = 0.104575;
    color[] = {1, 1, 1, 1.0};
    colorDisabled[] = {1, 1, 1, 0.25};

    class HitZone {
        left = 0.0;
        top = 0.0;
        right = 0.0;
        bottom = 0.0;
    };

    class ShortcutPos {
        left = 0.0145;
        top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)) / 2";
        w = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2) * (3/4)";
        h = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
    };

    class TextPos {
        left = "(        ((safezoneW / safezoneH) min 1.2) / 32) * 1.5";
        top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20)*2 - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)) / 2";
        right = 0.005;
        bottom = 0.0;
    };
    animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\normal_ca.paa";
    animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\disabled_ca.paa";
    animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\over_ca.paa";
    animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\focus_ca.paa";
    animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\down_ca.paa";
    animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\normal_ca.paa";
    period = 0.5;
    font = "PuristaLight";
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
    text = "";
    soundEnter[] = {"\A3\ui_f\data\sound\onover", 0.09, 1};
    soundPush[] = {"\A3\ui_f\data\sound\new1", 0.0, 0};
    soundClick[] = {"\A3\ui_f\data\sound\onclick", 0.07, 1};
    soundEscape[] = {"\A3\ui_f\data\sound\onescape", 0.09, 1};
    action = "";

    class Attributes {
        font = "PuristaLight";
        color = "#E5E5E5";
        align = "center";
        shadow = "false";
    };

    class AttributesImage {
        font = "PuristaLight";
        color = "#E5E5E5";
        align = "false";
    };
};

class PS_RscCheckbox {
    idc = -1;
    type = 7;
    style = 0;
    x = "LINE_X(XVAL)";
    y = LINE_Y;
    w = "LINE_W(WVAL)";
    h = 0.029412;
    colorText[] = {1, 0, 0, 1};
    color[] = {0, 0, 0, 0};
    colorBackground[] = {0, 0, 1, 1};
    colorTextSelect[] = {0, 0.8, 0, 1};
    colorSelectedBg[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1};
    colorSelect[] = {0, 0, 0, 1};
    colorTextDisable[] = {0.4, 0.4, 0.4, 1};
    colorDisable[] = {0.4, 0.4, 0.4, 1};
    font = "PuristaLight";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    rows = 1;
    5ns = 1;
    strings[] = {UNCHECKED};
    checked_strings[] = {CHECKED};
};

class PS_RscProgress
{
    type = 8;
    style = 0;
    x = 0.344;
    y = 0.619;
    w = 0.313726;
    h = 0.0261438;
    texture = "";
    shadow = 2;
    colorFrame[] = {0, 0, 0, 1};
    colorBackground[] = {0,0,0,0.7};
    colorBar[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
};

class PS_RscListBox
{
    style = 16;
    idc = -1;
    type = 5;
    w = 0.275;
    h = 0.04;
    font = "PuristaLight";
    colorSelect[] = {1, 1, 1, 1};
    colorText[] = {1, 1, 1, 1};
    colorBackground[] = {0.529,0,0,1};
    colorSelect2[] = {1, 1, 1, 1};
    colorSelectBackground[] = {0.95, 0.95, 0.95, 0.5};
    colorSelectBackground2[] = {1, 1, 1, 0.5};
    colorScrollbar[] = {0.2, 0.2, 0.2, 1};
    colorPicture[] = {1,1,1,1};
    colorPictureSelected[] = {1,1,1,1};
    colorPictureDisabled[] = {1,1,1,1};
    arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
    arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
    wholeHeight = 0.45;
    rowHeight = 0.04;
    color[] = {0.7, 0.7, 0.7, 1};
    colorActive[] = {0,0,0,1};
    colorDisabled[] = {0,0,0,0.3};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    soundSelect[] = {"",0.1,1};
    soundExpand[] = {"",0.1,1};
    soundCollapse[] = {"",0.1,1};
    maxHistoryDelay = 1;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
    class ListScrollBar: PS_RscScrollBar
    {
        color[] = {1,1,1,1};
        autoScrollEnabled = 1;
    };
};

class PS_RscTree
{
    idc = -1;
    type = 12;
    style = 2;
    blinkingPeriod = 0;
    w = 0.275;
    h = 0.04;
    colorBackground[] = {0,0,0,0.2};
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";

    picture = "";
    colorPicture[] = {1,1,1,1};
    colorPictureSelected[] = {1,1,1,1};
    colorPictureDisabled[] = {1,1,1,1};
    colorPictureRight[] = {1,1,1,1};
    colorPictureRightSelected[] = {1,1,1,1};
    colorPictureRightDisabled[] = {1,1,1,1};
    colorPictureLeft[] = {1,1,1,1};
    colorPictureLeftSelected[] = {1,1,1,1};
    colorPictureLeftDisabled[] = {1,1,1,1};

    font = "PuristaLight";
    rowHeight = 0.04;
    color[] = {1, 1, 1, 1};
    colorSelect[] = {0.7, 0.7, 0.7, 1};
    colorSelectBackground[] = {0, 0, 0, 0.5};
    colorBorder[] = {0, 0, 0, 0};
    borderSize = 0;

    colorMarked[] = {1,0.5,0,0.5};
    colorMarkedSelected[] = {1,0.5,0,1}; 

    colorText[] = {1,1,1,1};
    colorSelectText[] = {1,1,1,1}; 
    colorMarkedText[] = {1,1,1,1}; 

    tooltip = "";
    tooltipColorShade[] = {0,0,0,1};
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {1,1,1,1};

    multiselectEnabled = 1; 
    expandOnDoubleclick = 1; 
    hiddenTexture = "\A3\ui_f\data\gui\rsccommon\rsctree\hiddenTexture_ca.paa";
    expandedTexture = "\A3\ui_f\data\gui\rsccommon\rsctree\expandedTexture_ca.paa";
    maxHistoryDelay = 1;
    colorDisabled[] = {0,0,0,0}; 
    colorArrow[] = {0,0,0,0};
    class ScrollBar: PS_RscScrollBar{};
};

class PS_RscEdit {
    type = 2;
    style = 0x00 + 0x40;
    font = "PuristaLight";
    shadow = 2;
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    colorBackground[] = {0.529,0,0,1};
    soundSelect[] = {"",0.1,1};
    soundExpand[] = {"",0.1,1};
    colorText[] = {0.95, 0.95, 0.95, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    autocomplete = false;
    colorSelection[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1};
    canModify = 1;
};

class PS_RscSlider {
    h = 0.025;
    color[] = {1, 1, 1, 0.8};
    colorActive[] = {1, 1, 1, 1};
};

class PS_RscXSliderH
{
    style = 1024;
    type = 43;
    shadow = 2;
    x = 0;
    y = 0;
    h = 0.029412;
    w = 0.400000;
    color[] = {
            1, 1, 1, 0.7
    };
    colorActive[] = {
            1, 1, 1, 1
    };
    colorDisabled[] = {
            1, 1, 1, 0.500000
    };
    arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
    thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
};

class PS_RscFrame {
    type = 0;
    idc = -1;
    style = 64;
    shadow = 2;
    colorBackground[] = {0, 0, 0, 0};
    colorText[] = {1, 1, 1, 1};
    font = "PuristaLight";
    sizeEx = 0.02;
    text = "";
};

class PS_RscBackground: PS_RscText {
    type = 0;
    IDC = -1;
    style = 512;
    shadow = 0;
    x = 0.0;
    y = 0.0;
    w = 1.0;
    h = 1.0;
    text = "";
    ColorBackground[] = {0.48, 0.5, 0.35, 1};
    ColorText[] = {0.1, 0.1, 0.1, 1};
    font = "PuristaLight";
    SizeEx = 1;
};

class PS_RscHitZones {
    x = 0;
    y = 0;
    w = 0.1;
    h = 0.1;
    xCount = 1;
    yCount = 1;
    xSpace = 0;
    ySpace = 0;
};

class PS_RscCombo {
    style = 16;
    type = 4;
    x = 0;
    y = 0;
    w = 0.12;
    h = 0.035;
    shadow = 0;
    colorSelect[] = {0, 0, 0, 1};
    soundExpand[] = {"",0.1,1};
    colorText[] = {0.95, 0.95, 0.95, 1};
    soundCollapse[] = {"",0.1,1};
    maxHistoryDelay = 1;
    colorBackground[] = {0.529,0,0,1};
    colorSelectBackground[] = {1, 1, 1, 0.7};
    colorScrollbar[] = {1, 0, 0, 1};
    soundSelect[] = {
            "", 0.000000, 1
    };
    arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
    arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
    wholeHeight = 0.45;
    color[] = {1, 1, 1, 1};
    colorActive[] = {1, 0, 0, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    font = "PuristaLight";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";

    class ComboScrollBar : PS_RscScrollBar {};
};

class PS_RscToolbox {
    colorText[] = {0.95, 0.95, 0.95, 1};
    color[] = {0.95, 0.95, 0.95, 1};
    colorTextSelect[] = {0.95, 0.95, 0.95, 1};
    colorSelect[] = {0.95, 0.95, 0.95, 1};
    colorTextDisable[] = {0.4, 0.4, 0.4, 1};
    colorDisable[] = {0.4, 0.4, 0.4, 1};
    colorSelectedBg[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
    font = "PuristaLight";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
};
class PS_ctrlDefault
{
    idc = -1;
    style = ST_LEFT;
    default = 0;
    show = 1;
    fade = 0;
    blinkingPeriod = 0;
    deletable = 0;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    tooltip = "";
    tooltipMaxWidth = 0.5;
    tooltipColorShade[] = {0,0,0,1};
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {0,0,0,0};
    class ScrollBar
    {
        width = 0;
        height = 0;
        scrollSpeed = 0.06;
        arrowEmpty = "\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa";
        arrowFull = "\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa";
        border = "\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa";
        thumb = "\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa";
        color[] = {1,1,1,1};
    };
};
class PS_ctrlDefaultText: PS_ctrlDefault
{
    sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
    font = "PuristaLight";
    shadow = 1;
};
class PS_ctrlStatic: PS_ctrlDefaultText
{
    type = 0;
    colorBackground[] = {0,0,0,0};
    text = "";
    lineSpacing = 1;
    fixedWidth = 0;
    colorText[] = {1,1,1,1};
    colorShadow[] = {0,0,0,1};
    moving = 0;
    autoplay = 0;
    loops = 0;
    tileW = 1;
    tileH = 1;
    onCanDestroy = "";
    onDestroy = "";
    onMouseEnter = "";
    onMouseExit = "";
    onSetFocus = "";
    onKillFocus = "";
    onKeyDown = "";
    onKeyUp = "";
    onMouseButtonDown = "";
    onMouseButtonUp = "";
    onMouseButtonClick = "";
    onMouseButtonDblClick = "";
    onMouseZChanged = "";
    onMouseMoving = "";
    onMouseHolding = "";
    onVideoStopped = "";
};

class RscButtonInvisible: PS_RscButton
{
	idc=-1;
	text="";
	colorBackground[]={0,0,0,0};
	colorBackgroundActive[]={0,0,0,0};
	colorBackgroundDisabled[]={0,0,0,0};
	colorBorder[]={0,0,0,0};
	colorFocused[]={0,0,0,0};
};
class RscInteractionText: PS_RscText
{
	font = "PuristaLight";
    colorBackground[] = {0, 0, 0, 0};
	SizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75)";
	Style=0x02;
	Shadow=0;
};
class MB_Interaction_Menu
{
	idd=1000;
	movingenable=0;
	enableSimulation=1;
	class controlsBackground
	{
		class RscPicture_1205: PS_RscPicture
		{
			idc=1205;
			text="\Dom_UI\radial\Bottom.paa";
			x="0.386562 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.216563 * safezoneW";
			h="0.374 * safezoneH";
			colorBackground[]={0,0,0,1};
		};
		class RscPicture_1206: PS_RscPicture
		{
			idc=1206;
			text="\Dom_UI\radial\BottomLeft.paa";
			x="0.386562 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.216563 * safezoneW";
			h="0.374 * safezoneH";
		};
		class RscPicture_1208: PS_RscPicture
		{
			idc=1208;
			text="\Dom_UI\radial\CenterLeft.paa";
			x="0.386562 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.216563 * safezoneW";
			h="0.374 * safezoneH";
		};
		class RscPicture_1207: PS_RscPicture
		{
			idc=1207;
			text="\Dom_UI\radial\TopLeft.paa";
			x="0.386562 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.216563 * safezoneW";
			h="0.374 * safezoneH";
		};
		class RscPicture_1200: PS_RscPicture
		{
			idc=1200;
			text="\Dom_UI\radial\Top.paa";
			x="0.386562 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.216563 * safezoneW";
			h="0.374 * safezoneH";
		};
		class RscPicture_1201: PS_RscPicture
		{
			idc=1201;
			text="\Dom_UI\radial\TopRight.paa";
			x="0.386562 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.216563 * safezoneW";
			h="0.374 * safezoneH";
		};
		class RscPicture_1203: PS_RscPicture
		{
			idc=1203;
			text="\Dom_UI\radial\CenterRight.paa";
			x="0.386562 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.216563 * safezoneW";
			h="0.374 * safezoneH";
		};
		class RscPicture_1204: PS_RscPicture
		{
			idc=1204;
			text="\Dom_UI\radial\BottomRight.paa";
			x="0.386562 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.216563 * safezoneW";
			h="0.374 * safezoneH";
		};
		class RscPicture_1202: PS_RscPicture
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
	movingEnabled="false";
	enableSimulation="true";
	class Controls
	{
		class DT_MedicsOnline: PS_RscButtonMenu
		{
			idc=7304;
			text="Medics: 1";
			x="0.4 * safezoneW + safezoneX";
			y="0.745 * safezoneH + safezoneY";
			w="0.1 * safezoneW";
			h="0.022 * safezoneH";
			onButtonClick="";
		};
		class DT_MedicNearby: PS_RscButtonMenu
		{
			idc=7305;
			text="Nearest: None";
			x="0.5 * safezoneW + safezoneX";
			y="0.745 * safezoneH + safezoneY";
			w="0.1 * safezoneW";
			h="0.022 * safezoneH";
			onButtonClick="";
		};
		class DT_RespawnButton: PS_RscButtonMenu
		{
			idc=7302;
			x="0.4 * safezoneW + safezoneX";
			y="0.767 * safezoneH + safezoneY";
			w="0.2 * safezoneW";
			h="0.022 * safezoneH";
			text="Respawn";
			onButtonClick="closeDialog 0; call DT_fnc_respawn;";
		};
		class DT_RespawnTime: PS_RscButtonMenu
		{
			idc=7301;
			text="";
			x="0.4 * safezoneW + safezoneX";
			y="0.723 * safezoneH + safezoneY";
			w="0.2 * safezoneW";
			h="0.022 * safezoneH";
			onButtonClick="";
		};
		class DT_KilledBy: PS_RscButtonMenu
		{
			idc=7306;
			text="Killed by: ";
			x="0.4 * safezoneW + safezoneX";
			y="0.701 * safezoneH + safezoneY";
			w="0.2 * safezoneW";
			h="0.022 * safezoneH";
			onButtonClick="";
		};
	};
};
class Crafting_Menu
{
	idd=1003;
	movingEnable=0;
	enableSimulation=1;
	class controls
	{
		class Main_Tree: PS_RscTree
		{
			idc=1500;
			onTreeSelChanged="_this call DT_fnc_craftLBchange";
			x="0.319531 * safezoneW + safezoneX";
			y="0.302 * safezoneH + safezoneY";
			w="0.144375 * safezoneW";
			h="0.396 * safezoneH";
		};
		class Ingredients_Listbox: PS_RscListBox
		{
			idc=1501;
			x="0.463906 * safezoneW + safezoneX";
			y="0.302 * safezoneH + safezoneY";
			w="0.12375 * safezoneW";
			h="0.264 * safezoneH";
		};
		class Count_Listbox: PS_RscListBox
		{
			idc=1502;
			onLBSelChanged="_this call DT_fnc_countCraftLBchange";
			x="0.463906 * safezoneW + safezoneX";
			y="0.566 * safezoneH + safezoneY";
			w="0.0670312 * safezoneW";
			h="0.132 * safezoneH";
		};
		class DT_Button1: PS_RscButtonMenu
		{
			idc=2400;
			text="Craft";
			onButtonClick="call DT_fnc_craft";
			x="0.530937 * safezoneW + safezoneX";
			y="0.566 * safezoneH + safezoneY";
			w="0.0567187 * safezoneW";
			h="0.066 * safezoneH";
		};
		class DT_Button2: PS_RscButtonMenu
		{
			idc=-1;
			text="Close";
			onButtonClick="closeDialog 0";
			x="0.530937 * safezoneW + safezoneX";
			y="0.632 * safezoneH + safezoneY";
			w="0.0567187 * safezoneW";
			h="0.066 * safezoneH";
		};
	};
};
class DT_SetPlayerTag
{
	idd=1004;
	name="DT_SetPlayerTag";
	movingEnable=0;
	class controls
	{
		class DT_EnterName: PS_RscEdit
		{
			idc=1400;
			x="0.412344 * safezoneW + safezoneX";
			y="0.467 * safezoneH + safezoneY";
			w="0.165 * safezoneW";
			h="0.033 * safezoneH";
			colorBackground[]={0.69999999,0.69999999,0.69999999,0.69999999};
		};
		class DT_Accept: PS_RscButtonMenu
		{
			idc=-1;
			text="Set Name";
			x="0.463906 * safezoneW + safezoneX";
			y="0.5 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.022 * safezoneH";
			action="[MB_Interaction_Target] call DT_fnc_setName";
		};
	};
};
class MedicalMenu
{
	idd=1005;
	class controls
	{
		class DT_Head: PS_RscPicture
		{
			idc=9301;
			text="\Dom_UI\medical\head_white.paa";
			x="0.469062 * safezoneW + safezoneX";
			y="0.225 * safezoneH + safezoneY";
			w="0.0515625 * safezoneW";
			h="0.121 * safezoneH";
		};
		class DT_Body: PS_RscPicture
		{
			idc=9302;
			text="\Dom_UI\medical\body_white.paa";
			x="0.443281 * safezoneW + safezoneX";
			y="0.302 * safezoneH + safezoneY";
			w="0.108281 * safezoneW";
			h="0.253 * safezoneH";
		};
		class DT_Arms: PS_RscPicture
		{
			idc=9303;
			text="\Dom_UI\medical\arms_white.paa";
			x="0.386562 * safezoneW + safezoneX";
			y="0.313 * safezoneH + safezoneY";
			w="0.4125 * safezoneW";
			h="0.253 * safezoneH";
		};
		class DT_Legs: PS_RscPicture
		{
			idc=9304;
			text="\Dom_UI\medical\legs_white.paa";
			x="0.432969 * safezoneW + safezoneX";
			y="0.511 * safezoneH + safezoneY";
			w="0.216563 * safezoneW";
			h="0.561 * safezoneH";
		};
		class DT_Button1: PS_RscButtonMenu
		{
			idc=16000;
			x="0.365937 * safezoneW + safezoneX";
			y="0.819 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.022 * safezoneH";
			colorBackground[]={0,0,0,0.69999999};
		};
		class DT_Button2: PS_RscButtonMenu
		{
			idc=16001;
			x="0.453594 * safezoneW + safezoneX";
			y="0.819 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.022 * safezoneH";
			colorBackground[]={0,0,0,0.69999999};
		};
		class DT_Button3: PS_RscButtonMenu
		{
			idc=16002;
			x="0.530937 * safezoneW + safezoneX";
			y="0.819 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.022 * safezoneH";
			colorBackground[]={0,0,0,0.69999999};
		};
		class DT_Button4: PS_RscButtonMenu
		{
			idc=16003;
			x="0.365937 * safezoneW + safezoneX";
			y="0.852 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.022 * safezoneH";
			colorBackground[]={0,0,0,0.69999999};
		};
		class DT_Button5: PS_RscButtonMenu
		{
			idc=16004;
			x="0.453594 * safezoneW + safezoneX";
			y="0.852 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.022 * safezoneH";
			colorBackground[]={0,0,0,0.69999999};
		};
		class DT_Button6: PS_RscButtonMenu
		{
			idc=16005;
			x="0.530937 * safezoneW + safezoneX";
			y="0.852 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.022 * safezoneH";
			colorBackground[]={0,0,0,0.69999999};
		};
		class DT_Button7: PS_RscButtonMenu
		{
			idc=16006;
			x="0.365937 * safezoneW + safezoneX";
			y="0.885 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.022 * safezoneH";
			colorBackground[]={0,0,0,0.69999999};
		};
		class DT_Button8: PS_RscButtonMenu
		{
			idc=16007;
			x="0.453594 * safezoneW + safezoneX";
			y="0.885 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.022 * safezoneH";
			colorBackground[]={0,0,0,0.69999999};
		};
		class DT_Button9: PS_RscButtonMenu
		{
			idc=16008;
			x="0.530937 * safezoneW + safezoneX";
			y="0.885 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.022 * safezoneH";
			colorBackground[]={0,0,0,0.69999999};
		};
		class DT_Text1: PS_RscText
		{
			idc=16009;
			x="0.587656 * safezoneW + safezoneX";
			y="0.577 * safezoneH + safezoneY";
			w="0.0928125 * safezoneW";
			h="0.022 * safezoneH";
			colorBackground[]={0,0,0,0.69999999};
		};
		class DT_Text2: PS_RscText
		{
			idc=16010;
			x="0.587656 * safezoneW + safezoneX";
			y="0.61 * safezoneH + safezoneY";
			w="0.0928125 * safezoneW";
			h="0.022 * safezoneH";
			colorBackground[]={0,0,0,0.69999999};
		};
	};
};
class DT_promotionMenu
{
	idd=1006;
	name="DT_promotionMenu";
	movingEnable=0;
	class controls
	{
		class DT_background: PS_RscText
		{
			idc=-1;
			x="0.43 * safezoneW + safezoneX";
			y="0.401 * safezoneH + safezoneY";
			w="0.14 * safezoneW";
			h="0.28 * safezoneH";
			colorBackground[]={0,0,0,0.5};
		};
		class DT_nameBox: PS_RscText
		{
			idc=9200;
            style = ST_CENTER;
			x="0.44 * safezoneW + safezoneX";
			y="0.41 * safezoneH + safezoneY";
			w="0.12 * safezoneW";
			h="0.04 * safezoneH";
			colorBackground[]={0,0,0,0.69999999};
		};
		class DT_rankBox: PS_RscListBox
		{
			idc=9201;
			x="0.44 * safezoneW + safezoneX";
			y="0.46 * safezoneH + safezoneY";
			w="0.12 * safezoneW";
			h="0.08 * safezoneH";
			colorBackground[]={0,0,0,0.69999999};
		};
		class DT_departmentBox: PS_RscListBox
		{
			idc=9202;
			x="0.44 * safezoneW + safezoneX";
			y="0.55 * safezoneH + safezoneY";
			w="0.12 * safezoneW";
			h="0.08 * safezoneH";
			colorBackground[]={0,0,0,0.69999999};
		};
		class DT_Accept: PS_RscButtonMenu
		{
			idc=-1;
			text="Input";
			x="0.475 * safezoneW + safezoneX";
			y="0.64 * safezoneH + safezoneY";
			w="0.05 * safezoneW";
			h="0.025 * safezoneH";
			action="call DT_fnc_changeRank";
		};
	};
};
class Item_Shop
{
	idd=1007;
	movingEnable=0;
	enableSimulation=1;
	class controls
	{
		class Primary_List: PS_RscListBox
		{
			idc=6000;
			onLBSelChanged="[_this,0] call DT_fnc_itemShopLBChange";
			x="0.118437 * safezoneW + safezoneX";
			y="0.302 * safezoneH + safezoneY";
			w="0.113437 * safezoneW";
			h="0.407 * safezoneH";
		};
		class Secondary_List: PS_RscListBox
		{
			idc=6001;
			onLBSelChanged="[_this,1] call DT_fnc_itemShopLBChange";
			x="0.2525 * safezoneW + safezoneX";
			y="0.302 * safezoneH + safezoneY";
			w="0.113437 * safezoneW";
			h="0.407 * safezoneH";
		};
		class Inventory_List: PS_RscListBox
		{
			idc=6002;
			onLBSelChanged="[_this,2] call DT_fnc_itemShopLBChange";
			x="0.701094 * safezoneW + safezoneX";
			y="0.302 * safezoneH + safezoneY";
			w="0.113437 * safezoneW";
			h="0.407 * safezoneH";
		};
		class Primary_Info: PS_RscStructuredText
		{
			idc=6100;
			text="";
			sizeEx=0.029999999;
			x="0.118437 * safezoneW + safezoneX";
			y="0.709 * safezoneH + safezoneY";
			w="0.113437 * safezoneW";
			h="0.033 * safezoneH";
			colorBackground[]={0.69999999,0.69999999,0.69999999,0.69999999};
		};
		class Secondary_Info: PS_RscStructuredText
		{
			idc=6101;
			text="";
			sizeEx=0.029999999;
			x="0.2525 * safezoneW + safezoneX";
			y="0.709 * safezoneH + safezoneY";
			w="0.113437 * safezoneW";
			h="0.033 * safezoneH";
			colorBackground[]={0.69999999,0.69999999,0.69999999,0.69999999};
		};
		class Inventory_Info: PS_RscStructuredText
		{
			idc=6102;
			text="";
			sizeEx=0.029999999;
			x="0.701094 * safezoneW + safezoneX";
			y="0.709 * safezoneH + safezoneY";
			w="0.113437 * safezoneW";
			h="0.033 * safezoneH";
			colorBackground[]={0.69999999,0.69999999,0.69999999,0.69999999};
		};
		class Primary_Title: PS_RscText
		{
			idc=6200;
			text="";
			x="0.118437 * safezoneW + safezoneX";
			y="0.28 * safezoneH + safezoneY";
			w="0.113437 * safezoneW";
			h="0.022 * safezoneH";
		};
		class Secondary_Title: PS_RscText
		{
			idc=6201;
			text="Magazines";
			x="0.2525 * safezoneW + safezoneX";
			y="0.28 * safezoneH + safezoneY";
			w="0.113437 * safezoneW";
			h="0.022 * safezoneH";
		};
		class Inventory_Title: PS_RscText
		{
			idc=6202;
			text="Inventory";
			x="0.701094 * safezoneW + safezoneX";
			y="0.28 * safezoneH + safezoneY";
			w="0.113437 * safezoneW";
			h="0.022 * safezoneH";
		};
		class Primary_Buy: PS_RscButtonMenu
		{
			idc=-1;
			text="Buy";
			onButtonClick="[0] call DT_fnc_itemShopBuySell";
			x="0.118437 * safezoneW + safezoneX";
			y="0.742 * safezoneH + safezoneY";
			w="0.113437 * safezoneW";
			h="0.022 * safezoneH";
		};
		class Secondary_Buy: PS_RscButtonMenu
		{
			idc=6301;
			text="Buy";
			onButtonClick="[1] call DT_fnc_itemShopBuySell";
			x="0.2525 * safezoneW + safezoneX";
			y="0.742 * safezoneH + safezoneY";
			w="0.113437 * safezoneW";
			h="0.022 * safezoneH";
		};
		class Inventory_Sell: PS_RscButtonMenu
		{
			idc=-1;
			text="Sell";
			onButtonClick="[2] call DT_fnc_itemShopBuySell";
			x="0.701094 * safezoneW + safezoneX";
			y="0.742 * safezoneH + safezoneY";
			w="0.113437 * safezoneW";
			h="0.022 * safezoneH";
		};
	};
};
class DT_vehShop
{
    idd=1015;
    name="DT_vehShop";
    movingEnable=0;
    enableSimulation=1;
    onUnLoad="['Vehicle'] call DT_fnc_closeShop";
    onMouseButtonDown = "['Vehicle',_this] call DT_fnc_onMouseButtonDown";
    onMouseButtonUp = "['Vehicle',_this] call DT_fnc_onMouseButtonUp";
    class controlsBackground
    {
        
        class DT_background: PS_ctrlStatic {
            idc = 1100;
            style = 16;
            onMouseMoving = "['Vehicle',_this] call DT_fnc_handleMouse";
            onMouseHolding = "['Vehicle',_this] call DT_fnc_handleMouse";
            onMouseZChanged = "['Vehicle',_this] call DT_fnc_handleScroll";
            x = safezoneX;
            y = safezoneY;
            w = safezoneW;
            h = safezoneH;
        };
    };
    class controls
    {
        class vehList: PS_RscListbox
        {
            idc = 1500;
            onLBSelChanged="_this call DT_fnc_vehicleShopLBChange";
            x = 0.0153125 * safezoneW + safezoneX;
            y = 0.071 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.594 * safezoneH;
        };
        class name: PS_RscText
        {
            idc = 1000;
            text = "Shop_Name"; //--- ToDo: Localize;
            x = 0.0153125 * safezoneW + safezoneX;
            y = 0.049 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class vehInfo: PS_RscStructuredText
        {
            idc = 1200;
            text = "Vehicle Info"; //--- ToDo: Localize;
            x = 0.0153125 * safezoneW + safezoneX;
            y = 0.665 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.132 * safezoneH;
        };
        class buy: PS_RscButtonMenu
        {
            idc = 2400;
            text = "Buy"; //--- ToDo: Localize;
            onButtonClick="call DT_fnc_vehicleShopBuy";
            x = 0.0153125 * safezoneW + safezoneX;
            y = 0.797 * safezoneH + safezoneY;
            w = 0.0515625 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class colourList: PS_RscCombo
        {
            idc = 2100;
            onLBSelChanged="[client_preview,lbValue[2100,(lbCurSel 2100)]] call DT_fnc_setTexture";
            x = 0.0668745 * safezoneW + safezoneX;
            y = 0.797 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};
class DT_Progress
{
	idd=1008;
	name="DT_Progress";
	movingEnable=0;
	duration=9.9999998e+010;
	onLoad="uiNamespace setVariable ['Progress_Bar',_this select 0]";
	class controls
	{
		class Bar: PS_RscProgress
		{
			idc=1000;
			text="";
			x="0.185469 * safezoneW + safezoneX";
			y="0.874 * safezoneH + safezoneY";
			w="0.623906 * safezoneW";
			h="0.022 * safezoneH";
		};
		class Title: PS_RscStructuredText
		{
			idc=1001;
			text="Title";
			x="0.443281 * safezoneW + safezoneX";
			y="0.874 * safezoneH + safezoneY";
			w="0.0979687 * safezoneW";
			h="0.022 * safezoneH";
			sizeEx=1;
			class Attributes
			{
				align="middle";
				valign="middle";
				size=1;
			};
		};
	};
};

class DT_arrestMenu {
	idd=1009;
	name="DT_arrestMenu";
	movingEnable=0;
	duration=9.9999998e+010;
	class controls
	{
		class DT_name: PS_RscText
		{
			idc = 1000;
			text = ""; //--- ToDo: Localize;
            style = ST_CENTER;
			x = 0.375 * safezoneW + safezoneX;
			y = 0.44 * safezoneH + safezoneY;
			w = 0.225 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class DT_arrestButton: PS_RscButtonMenu
		{
			idc = 2400;
			text = "Arrest"; //--- ToDo: Localize;
			x = 0.475 * safezoneW + safezoneX;
			y = 0.6 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.02 * safezoneH;
			action="[MB_Interaction_Target] call DT_fnc_arrestPlayer";
		};
		class DT_hours: PS_RscEdit
		{
			idc = 1400;
			text = ""; //--- ToDo: Localize;
			x = 0.425 * safezoneW + safezoneX;
			y = 0.48 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class DT_minutes: PS_RscEdit
		{
			idc = 1401;
			text = ""; //--- ToDo: Localize;
			x = 0.4875 * safezoneW + safezoneX;
			y = 0.48 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class DT_seconds: PS_RscEdit
		{
			idc = 1402;
			text = ""; //--- ToDo: Localize;
			x = 0.55 * safezoneW + safezoneX;
			y = 0.48 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class DT_time: PS_RscText
		{
			idc = 1001;
			text = "Time:"; //--- ToDo: Localize;
			x = 0.375 * safezoneW + safezoneX;
			y = 0.48 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class DT_reasons: PS_RscEdit
		{
			idc = 1403;
			text = ""; //--- ToDo: Localize;
			x = 0.375 * safezoneW + safezoneX;
			y = 0.52 * safezoneH + safezoneY;
			w = 0.225 * safezoneW;
			h = 0.08 * safezoneH;
		};
	};
};

class DT_jailMenu {
	idd=1010;
	name="DT_jailMenu";
	movingEnable=0;
	duration=9.9999998e+010;
	class controls
	{
		class DT_name: PS_RscText
		{
			idc = 1000;
            style = ST_CENTER;
			x = 0.39 * safezoneW + safezoneX;
			y = 0.43598 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class DT_updateButton: PS_RscButtonMenu
		{
			idc = 2400;
			action = "[MB_Interaction_Target] call DT_fnc_updateJailTime";

			text = "Update"; //--- ToDo: Localize;
			x = 0.469887 * safezoneW + safezoneX;
			y = 0.59812 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class DT_hours: PS_RscEdit
		{
			idc = 1400;

			x = 0.425028 * safezoneW + safezoneX;
			y = 0.47998 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class DT_minutes: PS_RscEdit
		{
			idc = 1401;

			x = 0.487522 * safezoneW + safezoneX;
			y = 0.47998 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class DT_seconds: PS_RscEdit
		{
			idc = 1402;

			x = 0.550016 * safezoneW + safezoneX;
			y = 0.47998 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class DT_time: PS_RscText
		{
			idc = 1001;

			text = "Time:"; //--- ToDo: Localize;
			x = 0.39 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class DT_reasons: PS_RscEdit
		{
			idc = 1403;
			x = 0.39 * safezoneW + safezoneX;
			y = 0.5231 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class DT_cuffButton: PS_RscButtonMenu
		{
			idc = 2400;
			action = "[player] remoteExecCall ['DT_fnc_switchLegCuff',MB_Interaction_Target]";

			text = "Cuff legs"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class DT_pickaxeButton: PS_RscButtonMenu
		{
			idc = 2400;
			action = "[player] remoteExecCall ['DT_fnc_switchPickaxe',MB_Interaction_Target]";

			text = "Pickaxe"; //--- ToDo: Localize;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

class DT_garage {
	idd=1011;
	name="DT_garage";
	movingEnable=0;
	duration=9.9999998e+010;
	class controls
	{
		class DT_vehicleList: PS_RscListbox
		{
			idc = 1500;
			x = 0.325 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.175 * safezoneW;
			h = 0.44 * safezoneH;
			style = 32;
			lineSpacing = 1;
		};
		class DT_vehicleInfo: PS_RscStructuredText
		{
			idc = 1100;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.42 * safezoneH;
		};
		class DT_retrieveButton: PS_RscButtonMenu
		{
			idc = 2400;
			text = "Retrieve"; //--- ToDo: Localize;
			action = "call DT_fnc_getVehicle";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class DT_destroyButton: PS_RscButtonMenu
		{
			idc = 2401;
			text = "Destroy"; //--- ToDo: Localize;
			action = "call DT_fnc_destroyVehicle";
			x = 0.575 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.02 * safezoneH;
		};
	};
};

class DT_giveMoney {
	idd = 1012;
	name = "DT_giveMoney";
	movingEnable = 0;
	class controls {
		class DT_name: PS_RscStructuredText {
			idc = 1100;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class DT_amount: PS_RscEdit {
			idc = 1501;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class DT_give: PS_RscButtonMenu {
			idc = 2400;
			text = "Give"; //--- ToDo: Localize;
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "[MB_Interaction_Target] call DT_fnc_giveMoney";	
		};
	};
};

class DT_clothingShop {
    idd = 1013;
    name = "DT_clothingShop";
    onUnload = "['Clothing'] call DT_fnc_closeShop";
    onMouseButtonDown = "['Clothing',_this] call DT_fnc_onMouseButtonDown";
    onMouseButtonUp = "['Clothing',_this] call DT_fnc_onMouseButtonUp";
    movingEnable = 0;
    class controlsBackground {
        class DT_background: PS_ctrlStatic {
            idc = 1100;
            style = 16;
            onMouseMoving = "['Clothing',_this] call DT_fnc_handleMouse";
            onMouseHolding = "['Clothing',_this] call DT_fnc_handleMouse";
            onMouseZChanged = "['Clothing',_this] call DT_fnc_handleScroll";
            x = safezoneX;
            y = safezoneY;
            w = safezoneW;
            h = safezoneH;
        };
    };

    class controls {
        class DT_tree: PS_RscTree
        {
            idc = 1500;
            onTreeSelChanged = "_this call DT_fnc_previewClothing";
            x = 0.005 * safezoneW + safezoneX;
            y = 0.082 * safezoneH + safezoneY;
            w = 0.170156 * safezoneW;
            h = 0.715 * safezoneH;
        };
        class DT_itemPrice: PS_RscStructuredText
        {
            idc = 1100;
            x = 0.005 * safezoneW + safezoneX;
            y = 0.797 * safezoneH + safezoneY;
            w = 0.170156 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class DT_totalPrice: PS_RscStructuredText
        {
            idc = 1101;
            x = 0.005 * safezoneW + safezoneX;
            y = 0.819 * safezoneH + safezoneY;
            w = 0.170156 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class DT_buy: PS_RscButtonMenu
        {
            idc = 1200;
            text = "Buy"; //--- ToDo: Localize;
            onButtonClick="call DT_fnc_buyClothing";
            x = 0.005 * safezoneW + safezoneX;
            y = 0.841 * safezoneH + safezoneY;
            w = 0.170156 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};

class DT_keyMenu {
	idd = 1014;
	name = "DT_keyMenu";
	movingEnable = 0;
    class controls {
        class DT_vehList: PS_RscListbox
        {
            idc = 1500;
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.242 * safezoneH;
        };
        class DT_nameBox: PS_RscText
        {
            idc = 1001;
            text = "Give key to: Unknown"; //--- ToDo: Localize;
            style = ST_CENTER;
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.055 * safezoneH;
        };
        class DT_give: PS_RscButtonMenu
        {
            idc = -1;
            text = "Give"; //--- ToDo: Localize;
            onButtonClick="[MB_Interaction_Target] call DT_fnc_giveKey";
            x = 0.469063 * safezoneW + safezoneX;
            y = 0.621 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};

class RscTitles
{
	class DT_Notifications
	{
		idd=-1;
		duration = 1e+012;
		onLoad="uiNamespace setVariable [""DT_Notif_Display"", _this select 0]";
		class controls
		{
			class Message: PS_RscStructuredText
			{
				idc=6591;
				x="-0.000156274 * safezoneW + safezoneX";
				y="-0.00199999 * safezoneH + safezoneY";
				w="0.311406 * safezoneW";
				h="0.55 * safezoneH";
				colorBackground[]={0,0,0,0};
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
    class DT_HUD {
        idd = -1;
        movingEnable = 0;
        duration = 1e+012;
        name= "DT_HUD";
        onLoad="uiNamespace setVariable ['DT_HUD',_this select 0]";

        class controls {
            class food: PS_RscPicture
            {
                idc = 1500;
                text = "";
                x = 0.95375 * safezoneW + safezoneX;
                y = 0.544 * safezoneH + safezoneY;
                w = 0.0257812 * safezoneW;
                h = 0.044 * safezoneH;
            };
            class drink: PS_RscPicture
            {
                idc = 1501;
                text = "";
                x = 0.95375 * safezoneW + safezoneX;
                y = 0.599 * safezoneH + safezoneY;
                w = 0.0257812 * safezoneW;
                h = 0.044 * safezoneH;
            };
            class health: PS_RscPicture
            {
                idc = 1502;
                text = "";
                x = 0.95375 * safezoneW + safezoneX;
                y = 0.489 * safezoneH + safezoneY;
                w = 0.0257812 * safezoneW;
                h = 0.044 * safezoneH;
            };
            class seatbelt: PS_RscPicture
            {
                idc = 1503;
                text = "";
                x = 0.95375 * safezoneW + safezoneX;
                y = 0.775 * safezoneH + safezoneY;
                w = 0.0257812 * safezoneW;
                h = 0.044 * safezoneH;
            };
            class camera: PS_RscPicture
            {
                idc = 1504;
                text = "";
                x = 0.95375 * safezoneW + safezoneX;
                y = 0.709 * safezoneH + safezoneY;
                w = 0.0257812 * safezoneW;
                h = 0.044 * safezoneH;
            };
            class extraPicture: PS_RscPicture
            {
                idc = 1505;
                text = "";
                x = 0.95375 * safezoneW + safezoneX;
                y = 0.654 * safezoneH + safezoneY;
                w = 0.0257812 * safezoneW;
                h = 0.044 * safezoneH;
            };
            class name: PS_RscStructuredText
            {
                idc = 1506;
                text = ""; //--- ToDo: Localize;
                x = 0.809375 * safezoneW + safezoneX;
                y = 0.962 * safezoneH + safezoneY;
                w = 0.185625 * safezoneW;
                h = 0.027 * safezoneH;
                colorBackground[] = {0,0,0,0};
            };
            class gun: PS_RscPicture
            {
                idc = 1507;
                text = "";
                x = 0.89 * safezoneW + safezoneX;
                y = 0.00500001 * safezoneH + safezoneY;
                w = 0.109 * safezoneW;
                h = 0.088 * safezoneH;
            };
            class firemode: PS_RscStructuredText
            {
                idc = 1508;
                text = ""; //--- ToDo: Localize;
                x = 0.9175 * safezoneW + safezoneX;
                y = 0.104 * safezoneH + safezoneY;
                w = 0.05125 * safezoneW;
                h = 0.022 * safezoneH;
                colorBackground[] = {0,0,0,0};
            };
            class gunName: PS_RscStructuredText
            {
                idc = 1509;
                text = ""; //--- ToDo: Localize;
                x = 0.720469 * safezoneW + safezoneX;
                y = 0.00500001 * safezoneH + safezoneY;
                w = 0.170156 * safezoneW;
                h = 0.022 * safezoneH;
                colorBackground[] = {0,0,0,0};
            };
            class magazines: PS_RscStructuredText
            {
                idc = 1510;
                text = ""; //--- ToDo: Localize;
                x = 0.720469 * safezoneW + safezoneX;
                y = 0.038 * safezoneH + safezoneY;
                w = 0.170156 * safezoneW;
                h = 0.022 * safezoneH;
                colorBackground[] = {0,0,0,0};
            };
            class ammo: PS_RscStructuredText
            {
                idc = 1511;
                text = ""; //--- ToDo: Localize;
                x = 0.720469 * safezoneW + safezoneX;
                y = 0.071 * safezoneH + safezoneY;
                w = 0.170156 * safezoneW;
                h = 0.022 * safezoneH;
                colorBackground[] = {0,0,0,0};
            };
            class charging: PS_RscStructuredText
            {
                idc = 1512;
                x = 0.29375 * safezoneW + safezoneX;
                y = 0.00500001 * safezoneH + safezoneY;
                w = 0.4125 * safezoneW;
                h = 0.022 * safezoneH;
            };
        };
    };
};
class cfgMods
{
	author="Happy Panda";
	timepacked="1529175645";
};
