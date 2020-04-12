/*
	File: fn_buyMods.sqf
	Author: Dom
	Description: Buys selected mods
*/
private _purchase = uiNamespace getVariable ["purchase",[]];
private _totalPrice = 0;
{
	_x params ["_index","_price"];
	if !(_index isEqualTo -1) then {
		_totalPrice = _totalPrice + _price;
		[MB_Interaction_Target,_index,false,_forEachIndex] call DT_fnc_setCustomisation
	};
} forEach _purchase;
MB_Interaction_Target = objNull;
closeDialog 0;
["cash",-_totalPrice] call DT_fnc_handleMoney;
[MB_Interaction_Target] remoteExecCall ["DB_fnc_updateVehicle",2];