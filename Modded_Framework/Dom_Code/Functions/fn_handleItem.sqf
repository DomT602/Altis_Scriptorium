/*
	File: fn_handleItem.sqf
	Author: Dom
	Description: Handles double clicking of items
*/
params [
	["_idc",controlNull,[controlNull]],
	["_index",-1,[0]]
];

private _control = ctrlIDC _idc;
private _item = lbData [_control,_index];

private _fnc_quickCharge = {
	phone_battery = (phone_battery + 50) min 100;
	["You successfully charged your phone.","green"] call DT_fnc_notify;
};
call {
	if (_item isEqualTo "D_GoPro_i") exitWith {call DT_fnc_GoPro; closeDialog 0};
	if (_item isEqualTo "D_Battery_i") exitWith {call _fnc_quickCharge; player removeItem _item; closeDialog 0};
	if (_item isEqualTo "D_WaterBottle_i") exitWith {[_item,100] call DT_fnc_handleDrink; player removeItem _item; closeDialog 0};
	if (_item in ["D_Redgul_i","D_Coffee_i","D_Franta_i","D_Can_SuperstarEnergy_i","D_Can_Pepsi_i","D_Can_Monster_i","D_Can_DrPepper_i","D_Can_7UP_i"]) exitWith {[_item,75] call DT_fnc_handleDrink; player removeItem _item; closeDialog 0};
	if (_item in ["D_TacticalBacon_i","D_Sausages_i","D_FoodCan_DicksSausage_i","D_Sandwich_i","D_Toast_i"]) exitWith {[_item,60] call DT_fnc_handleFood; player removeItem _item; closeDialog 0};
	if (_item in ["D_Banana_i","D_Kiwi_i","D_FoodCan_DogFood_i"]) exitWith {[_item,30] call DT_fnc_handleFood; player removeItem _item; closeDialog 0};
	if (_item isEqualTo "D_Donut_i") exitWith {[_item,50] call DT_fnc_handleFood; player removeItem _item; closeDialog 0};

	if (_item in ['Spikestrip_Boxed','Roadcone_Boxed','Wood_Barrier_Boxed','Concrete_Barrier_Boxed','Bargate_Boxed']) exitWith {[_item] call DT_fnc_setupItem; player removeItem _item; closeDialog 0};
	if (_item in ["Wardrobe"]) exitWith {[_item] call DT_fnc_placeFurniture; player removeItem _item; closeDialog 0}; //furniture line
	if (_item in ["Seed_Types"]) exitWith {active_seed = _item; [format["You have selected %1 as your active seed.",_item]] call DT_fnc_notify; closeDialog 0};
	if (_item isEqualTo "D_Bandage_i") exitWith {call DT_fnc_bandageSelf};
};

true