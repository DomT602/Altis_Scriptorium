
class CfgVehicles
{
	class Civilian_F;
	class D_Base_Man: Civilian_F
	{
		author = "Dom";
		editorPreview = "\A3\EditorPreviews_F\Data\CfgVehicles\B_RangeMaster_F.jpg";
		editorCategory = "DomRP";
		scope = 0;
		displayName = "Base Man";
		hiddenSelections[] = {"Camo","insignia"};
		uniformClass = "U_C_Poloshirt_stripped";
		hiddenSelectionsTextures[] = {"\A3\characters_f\civil\data\c_poloshirt_3_co.paa"};
		extCameraPosition[] = {0.15,0,-2};
		class Wounds
		{
			tex[] = {};
			mat[] = {"A3\Characters_F\BLUFOR\Data\clothing1.rvmat","A3\Characters_F\BLUFOR\Data\clothing1_injury.rvmat","A3\Characters_F\BLUFOR\Data\clothing1_injury.rvmat","A3\Characters_F\Common\Data\basicbody.rvmat","A3\Characters_F\Common\Data\basicbody_injury.rvmat","A3\Characters_F\Common\Data\basicbody_injury.rvmat","A3\characters_f\common\data\coveralls.rvmat","A3\Characters_F\Common\Data\coveralls_injury.rvmat","A3\Characters_F\Common\Data\coveralls_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_bald_muscular.rvmat","A3\Characters_F\Heads\Data\hl_white_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_black_bald_muscular.rvmat","A3\Characters_F\Heads\Data\hl_black_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_black_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_hairy_muscular.rvmat","A3\Characters_F\Heads\Data\hl_white_hairy_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_hairy_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_old.rvmat","A3\Characters_F\Heads\Data\hl_white_old_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_old_injury.rvmat","A3\Characters_F\Heads\Data\hl_asian_bald_muscular.rvmat","A3\Characters_F\Heads\Data\hl_asian_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_asian_bald_muscular_injury.rvmat"};
		};
		class HitPoints
		{
			class HitFace
			{
				armor = 1;
				material = -1;
				name = "face_hub";
				passThrough = 0.8;
				radius = 0.08;
				explosionShielding = 0.1;
				minimalHit = 0.01;
			};
			class HitNeck: HitFace
			{
				armor = 1;
				material = -1;
				name = "neck";
				passThrough = 0.8;
				radius = 0.1;
				explosionShielding = 0.5;
				minimalHit = 0.01;
			};
			class HitHead: HitNeck
			{
				armor = 1;
				material = -1;
				name = "head";
				passThrough = 0.8;
				radius = 0.2;
				explosionShielding = 0.5;
				visual = "camo_head";
				minimalHit = 0.01;
				depends = "HitFace max HitNeck";
			};
			class HitPelvis: HitHead
			{
				armor = 6;
				material = -1;
				name = "pelvis";
				passThrough = 0.8;
				radius = 0.24;
				explosionShielding = 6;
				visual = "injury_body";
				minimalHit = 0.01;
				depends = "0";
			};
			class HitAbdomen: HitPelvis
			{
				armor = 1;
				material = -1;
				name = "spine1";
				passThrough = 0.8;
				radius = 0.16;
				explosionShielding = 1;
				visual = "injury_body";
				minimalHit = 0.01;
			};
			class HitDiaphragm: HitAbdomen
			{
				armor = 1;
				material = -1;
				name = "spine2";
				passThrough = 0.8;
				radius = 0.18;
				explosionShielding = 6;
				visual = "injury_body";
				minimalHit = 0.01;
			};
			class HitChest: HitDiaphragm
			{
				armor = 1;
				material = -1;
				name = "spine3";
				passThrough = 0.8;
				radius = 0.18;
				explosionShielding = 6;
				visual = "injury_body";
				minimalHit = 0.01;
			};
			/*class HitBody: HitChest
			{
				armor = 1000;
				material = -1;
				name = "body";
				passThrough = 1;
				radius = 0;
				explosionShielding = 6;
				visual = "camo_body";
				minimalHit = 0.01;
				depends = "HitPelvis max HitAbdomen max HitDiaphragm max HitChest";
			};
			class hand_l: HitBody//8
			{
				armor = 1;
				material = -1;
				name = "hand_l";
				passThrough = 1;
				radius = 0.1;
				explosionShielding = 1;
				visual = "Camo_arm_left";
				minimalHit = 0.01;
				depends = "0";
			};
			class hand_r: hand_l
			{
				armor = 1;
				material = -1;
				name = "hand_r";
				passThrough = 1;
				radius = 0.1;
				explosionShielding = 1;
				visual = "Camo_arm_right";
				minimalHit = 0.01;
			};*/
			class HitLeftArm
			{
				armor = 1;
				material = -1;
				name = "hand_l";
				passThrough = 1;
				radius = 0.1;
				explosionShielding = 1;
				visual = "injury_hands";
				minimalHit = 0.01;
			};
			class HitRightArm: HitLeftArm
			{
				name = "hand_r";
			};
			class HitLeftLeg: HitLeftArm
			{
				armor = 1;
				material = -1;
				name = "leg_l";
				passThrough = 1;
				radius = 0.1;
				explosionShielding = 1;
				visual = "injury_legs";
				minimalHit = 0.01;
			};
			class HitRightLeg: HitLeftLeg
			{
				name = "leg_r";
			};
			class DT_lastHitPoint {
				armor = 1;
				material = -1;
				name = "head";
				passThrough = 0;
				radius = 1;
				explosionShielding = 1;
				visual = "";
				minimalHit = 0;
				depends = "HitHead";
			};
		};
	};
	class D_Base_Civ_1: D_Base_Man
	{
		model = "\A3\Characters_F\Civil\c_poloshirtpants.p3d";
		modelSides[] = {3};
		picture = "\D_C\data\Placeholder.paa";
		displayName = "Base Civ (Rangemaster)";
		hiddenSelections[] = {"Camo"};
	};
	class D_Base_Civ_2: D_Base_Man
	{
		model = "\A3\Characters_F\Civil\c_poloshirt";
		modelSides[] = {3};
		scope = 2;
		picture = "\D_C\data\Placeholder.paa";
		displayName = "Base Civ (T-shirt & Shorts)";
		hiddenSelections[] = {"Camo"};
	};
	class D_Base_Civ_3: D_Base_Man
	{
		model = "\A3\Characters_F_EPA\BLUFOR\b_soldier_survival_01.p3d";
		modelSides[] = {3};
		picture = "\D_C\data\Placeholder.paa";
		displayName = "Base Civ (Survival Fatigues)";
		uniformClass = "U_B_survival_uniform";
		hiddenSelections[] = {"camo","camo2"};
		hiddenUnderwaterSelections[] = {"hide"};
		shownUnderwaterSelections[] = {"unhide","unhide2"};
		hiddenUnderwaterSelectionsTextures[] = {"\A3\characters_f\common\data\diver_equip_nato_co.paa","\A3\characters_f\common\data\diver_equip_nato_co.paa","\A3\characters_f\data\visors_ca.paa"};
	};
	class D_Base_Cop: D_Base_Man
	{
		model = "\A3\Characters_F\Civil\c_poloshirtpants.p3d";
		modelSides[] = {3};
		picture = "\D_C\data\icon_Police_ca.paa";
		displayName = "Base Cop";
		hiddenSelections[] = {"Camo"};
	};
	class D_Base_Medic: D_Base_Man
	{
		model = "\A3\characters_F\BLUFOR\b_soldier_01.p3d";
		modelSides[] = {3};
		picture = "\D_C\data\icon_Police_ca.paa";
		displayName = "Base Medic";
		hiddenSelections[] = {"Camo"};
	};
};