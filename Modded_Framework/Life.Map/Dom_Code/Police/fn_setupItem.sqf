/*
	File: fn_setupItem.sqf
	Author: Dom
	Description: Sets up an item ready to place it
*/
params [
	["_item","",[""]]
];

if !(isNull client_carrying) exitWith {["Your already holding something."] call DT_fnc_notify};

switch _item do {
	case "Spikestrip_Boxed": {
		private _spikeStrip = "MW_spikeStrip" createVehicle [0,0,0];
		_spikeStrip attachTo[player,[0,5.5,0]];
		//_spikeStrip setDir 90;
		client_carrying = _spikeStrip;
	};
	case "Roadcone_Boxed": {
		private _cone1 = "RoadCone_L_F" createVehicle [0,0,0];
		private _cone2 = "RoadCone_L_F" createVehicle [0,0,0];
		private _cone3 = "RoadCone_L_F" createVehicle [0,0,0];
		private _cone4 = "RoadCone_L_F" createVehicle [0,0,0];
		private _cone5 = "RoadCone_L_F" createVehicle [0,0,0];

		_cone1 setVariable ["components",[_cone1,_cone2,_cone3,_cone4,_cone5],true];
		client_carrying = _cone1;

		_cone1 attachTo [player,[0,2,.35]];
		_cone2 attachTo [player,[0,3,.35]];
		_cone3 attachTo [player,[0,4,.35]];
		_cone4 attachTo [player,[0,5,.35]];
		_cone5 attachTo [player,[0,6,.35]];
		{
			_x setDir 90
		} forEach (_cone1 getVariable ["components",[]]);

	};
	case "Wood_Barrier_Boxed": {
		private _cone1 = "RoadCone_L_F" createVehicle [0,0,0];
		private _cone2 = "RoadCone_L_F" createVehicle [0,0,0];
		private _barrier1 = "RoadBarrier_F" createVehicle [0,0,0];
		private _barrier2 = "RoadBarrier_F" createVehicle [0,0,0];

		_cone1 setVariable ["components",[_barrier1,_barrier2,_cone1,_cone2],true];
		client_carrying = _cone1;

		_barrier1 attachTo [player,[0,4,.6]];
		_barrier2 attachTo [player,[0,7.5,.6]];
		_cone1 attachTo [player,[0,2.4,.35]];
		_cone2 attachTo [player,[0,9.1,.35]];
		{
			_x setDir 90
		} forEach (_cone1 getVariable ["components",[]]);
	};
	case "Concrete_Barrier_Boxed": {
		private _barrier1 = "Land_CncBarrier_F" createVehicle [0,0,0];
		private _barrier2 = "Land_CncBarrier_F" createVehicle [0,0,0];
		private _barrier3 = "Land_CncBarrier_F" createVehicle [0,0,0];
		private _barrier4 = "Land_CncBarrier_F" createVehicle [0,0,0];
		private _cone1 = "RoadCone_L_F" createVehicle [0,0,0];
		private _cone2 = "RoadCone_L_F" createVehicle [0,0,0];
		private _lamp1 = "Land_Portablelight_Single_F" createVehicle [0,0,0];
		private _lamp2 = "Land_Portablelight_Single_F" createVehicle [0,0,0];
		_cone1 setVariable ["components",[_barrier1,_barrier2,_barrier3,_barrier4,_cone1,_cone2,_lamp1,_lamp2],true];
		client_carrying = _cone1;

		_barrier1 attachTo [player,[0,4,.3]];
		_barrier2 attachTo [player,[0,7.5,.3]];
		_barrier3 attachTo [player,[0,4,1]];
		_barrier4 attachTo [player,[0,7.5,1]];
		_cone1 attachTo [player,[0,9.1,.35]];
		_cone2 attachTo [player,[0,2.4,.35]];
		_lamp1 attachTo [player,[1.5,1,1.12]];
		_lamp2 attachTo [player,[-1.5,9.5,1.12]];
		{
			_x setDir 90
		} foreach (_cone1 getVariable ["components",[]]);
		_lamp1 setDir 150;
		_lamp2 setDir -30;
	};
	case "Bargate_Boxed": {
		private _cone1 = "RoadCone_L_F" createVehicle [0,0,0];
		private _cone2 = "RoadCone_L_F" createVehicle [0,0,0];
		private _bargate = "Land_BarGate_F" createVehicle [0,0,0];

		_cone1 setVariable ["components",[_cone1,_bargate,_cone2],true];
		client_carrying = _cone1;

		_bargate attachTo [player,[0,6.4,4.4]];
		_cone1 attachTo [player,[0,1.6,.35]];
		_cone2 attachTo [player,[0,10.5,.35]];
		{
			_x setDir 270
		} forEach (_cone1 getVariable ["components",[]]);
	};
};