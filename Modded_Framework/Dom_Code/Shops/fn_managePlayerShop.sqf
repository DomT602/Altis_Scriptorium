/*
    File: fn_buyPlayerShop.sqf
    Author: Dom
    Description: Handles managing a player owned shop
*/
params [
    ["_state",0,[0]]
];

private _selected = lbCurSel -1;
private _item = lbData[-1,_selected];
private _items = MB_Interaction_Target getVariable ["shop_inventory",[]];
private _funds = MB_Interaction_Target getVariable ["shop_funds",0];

switch _state do {
    case 0: {
        MB_Interaction_Target setVariable ["shop_funds",0,true];
        [format["You retrieved %1 from the store.",_funds],"green"] call DT_fnc_notify;
        client_cash = client_cash + _funds;
        [0] call DT_fnc_saveStatsPartial;
    };
    case 1: {
        private _selected = lbCurSel -1;
        private _item = lbData[-1,_selected];
        if !(player canAdd _item) exitWith {["You don't have enough room to remove this item.","orange"] call DT_fnc_notify};
        lbDelete [-1,_selected];
        _items deleteAt _selected;
        //MB_Interaction_Target setVariable ["shop_inventory",_items,true];
        player addItem _item;
        [2] call DT_fnc_saveStatsPartial;
    };
    case 2: {
        private _selected = lbCurSel -1;
        private _item = lbData[-1,_selected];
        private _price = ctrlText[-1,-1];
        if ([_price,0] call DT_fnc_checkNumber) exitWith {};
        _price = parseNumber _price;
        player removeItem _item;
        _items pushBack ([_item,_price]);
        //MB_Interaction_Target setVariable ["shop_inventory",_items,true];
        [2] call DT_fnc_saveStatsPartial;
    };
};
//[MB_Interaction_Target] remoteExecCall ["DB_fnc_updateShop",2];