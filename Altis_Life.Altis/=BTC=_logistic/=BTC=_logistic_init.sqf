/*
Created by =BTC= Giallustio
Version: 0.14 rc 1
Date: 20/03/2013
Visit us at: http://www.blacktemplars.altervista.org/
*/
if (isServer) then 
{
	BTC_id_repo = 10;publicVariable "BTC_id_repo";
	BTC_cargo_repo = "Land_HBarrierBig_F" createVehicle [- 5000,- 5000,0];publicVariable "BTC_cargo_repo";
};
if (isDedicated) exitwith {};
BTC_active_lift      = 1;
BTC_active_fast_rope = 1;
BTC_active_cargo     = 0;
//Common
BTC_dir_action = "=BTC=_logistic\=BTC=_addAction.sqf";
BTC_l_placement_area = 20;
if (BTC_active_lift == 1) then
{
	//Lift
	BTC_lift_pilot    = [];
	BTC_lift          = 1;
	BTC_lifted        = 0;
	BTC_lift_min_h    = 7;
	BTC_lift_max_h    = 12;
	BTC_lift_radius   = 3;
	BTC_def_hud       = 1;
	BTC_def_pip       = 1;
	BTC_l_def_veh_pip = ["B_Heli_Light_01_F","O_Heli_Light_02_unarmed_F","B_Heli_Transport_01_F","I_Heli_Transport_02_F"];
	BTC_l_pip_cond    = false;
	BTC_cargo_lifted  = objNull;
	BTC_Hud_Cond      = false;
	BTC_HUD_x         = (SafeZoneW+2*SafeZoneX) - 0.155;//+ 0.045;
	BTC_HUD_y         = (SafeZoneH+2*SafeZoneY) + 0.045;
	_lift = [] execVM "=BTC=_logistic\=BTC=_lift\=BTC=_lift_init.sqf";
	BTC_get_liftable_array =
	{
		_chopper = _this select 0;
		_array   = [];
		switch (typeOf _chopper) do
		{
			//MH9
			case "B_Heli_Light_01_F"     : {_array = ["C_Quadbike_01_F"];};
			//PO-30 Orca
			case "O_Heli_Light_02_unarmed_F"     : {_array = ["C_Quadbike_01_F","C_Offroad_01_F","C_Hatchback_01_F","C_SUV_01_F"];};
			//UH80
			case "B_Heli_Transport_01_F" : {_array = ["C_Quadbike_01_F","C_Offroad_01_F","C_Hatchback_01_F","C_SUV_01_F","B_MRAP_01_F","O_MRAP_02_F","O_MRAP_02_hmg_F"];};
			//CH49
			case "I_Heli_Transport_02_F" : {_array = ["C_Quadbike_01_F","C_Offroad_01_F","C_Hatchback_01_F","C_SUV_01_F","C_Van_01_transport_F","C_Van_01_box_F","I_Truck_02_transport_F","I_Truck_02_covered_F","B_Truck_01_transport_F","O_Truck_03_device_F"];};

		};
		_array
	};
};
if (BTC_active_fast_rope == 1) then
{
	//Fast roping
	BTC_fast_rope_h = 35;
	BTC_fast_rope_h_min = 5;
	BTC_roping_chopper = ["B_Heli_Light_01_F","O_Heli_Light_02_unarmed_F","B_Heli_Transport_01_F","I_Heli_Transport_02_F"];
	_rope = [] execVM "=BTC=_logistic\=BTC=_fast_roping\=BTC=_fast_roping_init.sqf";
};
if (BTC_active_cargo == 1) then
{
	//Cargo System
	_cargo = [] execVM "=BTC=_logistic\=BTC=_cargo_system\=BTC=_cargo_system_init.sqf";
	BTC_def_vehicles     = ["Tank","Wheeled_APC","Truck","Car","Helicopter"];
	BTC_def_cargo        = ["Motorcycle","ReammoBox","ReammoBox_F","Strategic"];
	BTC_def_drag         = ["ReammoBox","ReammoBox_F","Strategic"];
	BTC_def_placement    = ["ReammoBox","ReammoBox_F","Strategic"];
	BTC_cargo_selected   = objNull;
	BTC_def_cc =
	[
		"B_Quadbike_01_F",2,
		//Trucks
		"B_Truck_01_transport_F",10,
		"B_Truck_01_covered_F",10,
		"I_Truck_02_covered_F",10,
		"O_Truck_02_covered_F",10,
		"I_Truck_02_transport_F",10,
		"O_Truck_02_transport_F",10,
		"O_Truck_02_transport_F",10
	];
	BTC_def_rc =
	[
		"Land_BagBunker_Small_F",4
	];
};
//Functions
BTC_l_paradrop =
{
	_veh          = _this select 0;
	_dropped      = _this select 1;
	_chute_type   = _this select 2;
	private ["_chute"];
	_dropped_type = typeOf _dropped;
	_dropped attachTo [_veh,[0,2,-5]];
	sleep 0.1;
	detach _dropped;
	_dropped setvariable ["BTC_cannot_lift",1,false];
	waitUntil {_dropped distance _veh > 50};
	_dropped setvariable ["BTC_cannot_lift",0,false];
	_chute = createVehicle [_chute_type, getposatl _dropped, [], 0, "FLY"];
	_smoke        = "SmokeshellGreen" createVehicle position _dropped;
	_chem         = "Chemlight_green" createVehicle position _dropped;
    _smoke attachto [_dropped,[0,0,0]];
	_chem attachto [_dropped,[0,0,0]]; 
	_dropped attachTo [_chute,[0,0,0]];
	_heigh = 0;
	while {((getPos _chute) select 2) > 0.3} do {sleep 1;_heigh = (getPos _chute) select 2;};
	detach _dropped;

};
BTC_l_obj_fall =
{
	_obj    = _this select 0;
	_height = (getPos _obj) select 2;
	_fall   = 0.09;
	while {((getPos _obj) select 2) > 0.1} do 
	{

		_fall = (_fall * 1.1);
		_obj setPos [getPos _obj select 0, getPos _obj select 1, _height];
		_height = _height - _fall;
		//hint format ["%1 - %2", (getPos _obj) select 2,_height];
		sleep 0.01;
	};
	//if (((getPos _obj) select 2) < 0.3) then {_obj setPos [getPos _obj select 0, getPos _obj select 1, 0.2];};
};