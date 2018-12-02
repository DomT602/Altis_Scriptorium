/*
* I NEED FINISHING
*    type:
*       craftingText = "Text in listbox";
*		productClass = "Classname of Product";
*		requiredMaterials[] = {"item",count}
*		location = ""; (leave as "" if no location)
*		cost = 0; (leave as 0 if no cost)
*/
class Crafting {
	class Basic {
		class Items {
			class Toolkit {
				productClass = "ToolKit";
				requiredMaterials[] = {
					{"ToolKit",2}
				};
				location = "";
				cost = 0;
			};
		};
		class Materials {
			/*class Iron {
				productClass = "iron_ingot";
				requiredMaterials[] = {
					{"Item_1",2},
					{"Item_2",1}
				};
				location = "";
				cost = 0;
			};*/
		};
		class Weapons {

		};
		class Vehicles {

		};
	};
	class Advanced {

	};
};
