#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "civ_car_1":
	{
		_return = 
		[
			["C_Hatchback_01_F",9600],
			["C_Offroad_01_F",28000],
			["C_SUV_01_F",40800],
			["C_Van_01_transport_F",56000],
			["C_Quadbike_01_F",2000]
		];
	}; 
	
	case "civ_car_2":
	{
		_return = 
		[
			["C_Hatchback_01_F",9600],
			["C_Offroad_01_F",28000],
			["C_SUV_01_F",40800],
			["C_Van_01_transport_F",56000],
			["C_Quadbike_01_F",2000]
		];
	};
	
	case "civ_car_3":
	{
		_return = 
		[
			["C_Hatchback_01_F",9600],
			["C_Offroad_01_F",28000],
			["C_SUV_01_F",40800],
			["C_Van_01_transport_F",56000],
			["C_Quadbike_01_F",2000]
		];
	}; 
	
	case "civ_car_4":
	{
		_return = 
		[
			["C_Hatchback_01_F",9600],
			["C_Offroad_01_F",28000],
			["C_SUV_01_F",40800],
			["C_Van_01_transport_F",56000]
		];
	}; 
				
	case "civ_servt_1":
	{
		_return =
		[
			["C_Offroad_01_F",51000] //Service Truck
		];
	};
	
	case "civ_truck_1":
	{
		_return =
		[
			["C_Van_01_box_F",120000],
			["I_Truck_02_transport_F",280000],
			["I_Truck_02_covered_F",480000],
			["B_Truck_01_transport_F",2000000],
			["B_Truck_01_box_F",3000000],
			["O_Truck_03_device_F",4000000]
		];	
	};
	
	case "civ_truck_2":
	{
		_return =
		[
			["C_Van_01_box_F",120000],
			["I_Truck_02_transport_F",280000],
			["I_Truck_02_covered_F",480000],
			["B_Truck_01_transport_F",2000000],
			["B_Truck_01_box_F",3000000],
			["O_Truck_03_device_F",4000000]
		];	
	};
	
	case "reb_v_1":
	{
		_return =
		[
			["B_Quadbike_01_F",200000],
			["B_G_Offroad_01_F",15000],
			["O_MRAP_02_F",150000],
			["B_Heli_Light_01_F",325000]
		];
		
		if(license_civ_rebel) then
		{
			_return set[count _return,
			["B_G_Offroad_01_armed_F",500000]];
		};
	};
	
	case "reb_v_2":
	{
		_return =
		[
			["B_Quadbike_01_F",200000],
			["B_G_Offroad_01_F",15000],
			["O_MRAP_02_F",150000],
			["B_Heli_Light_01_F",325000]
		];
		
		if(license_civ_rebel) then
		{
			_return set[count _return,
			["B_G_Offroad_01_armed_F",500000]];
		};
	};
			
	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",5000],
			["B_G_Offroad_01_F",45000]
		];
	};
	
	case "reb_car2":
	{
		_return set[count _return,
		["B_Quadbike_01_F",5000]];
		_return set[count _return,
		["C_Offroad_01_F",50000]];
	};
	
	case "reb_air":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",300000]];
		_return set[count _return,
		["O_Heli_Light_02_unarmed_F",1000000]];
	};
	
	case "cop_car_1":
	{
		_return set[count _return,
		["C_Offroad_01_F",5000]];
		_return set[count _return,
		["C_SUV_01_F",20000]];
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["B_MRAP_01_F",30000]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return set[count _return,
			["O_MRAP_02_hmg_F",10000]];
		};
		_return set[count _return,
		["C_Quadbike_01_F",200000]];
	};
	
	case "cop_car_2":
	{
		_return set[count _return,
		["C_Offroad_01_F",5000]];
		_return set[count _return,
		["C_SUV_01_F",20000]];
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["B_MRAP_01_F",30000]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return set[count _return,
			["O_MRAP_02_hmg_F",10000]];
		};
		_return set[count _return,
		["C_Quadbike_01_F",200000]];
	};
	
	case "cop_car_3":
	{
		_return set[count _return,
		["C_Offroad_01_F",5000]];
		_return set[count _return,
		["C_SUV_01_F",20000]];
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["B_MRAP_01_F",30000]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return set[count _return,
			["O_MRAP_02_hmg_F",10000]];
		};
		_return set[count _return,
		["C_Quadbike_01_F",200000]];
	};
	
	case "cop_car_5":
	{
		_return set[count _return,
		["C_Offroad_01_F",5000]];
		_return set[count _return,
		["C_SUV_01_F",20000]];
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["O_MRAP_02_F",40000]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return set[count _return,
			["O_MRAP_02_hmg_F",10000]];
		};
		_return set[count _return,
		["C_Quadbike_01_F",200000]];
	};
	
	case "civ_air_1":
	{
		_return =
		[
			["B_Heli_Light_01_F",252000],
			["O_Heli_Light_02_unarmed_F",1200000],
			["I_Heli_Transport_02_F",3500000]
		];
		
		if(__GETC__(life_adminlevel) > 2) then
		{
			_return set[count _return,["B_MBT_01_arty_F",10000]];
		};
	};
	
	case "civ_air_2":
	{
		_return =
		[
			["B_Heli_Light_01_F",252000],
			["O_Heli_Light_02_unarmed_F",1200000],
			["I_Heli_Transport_02_F",3500000],
			["C_Quadbike_01_F",200000]
		];
		
		if(__GETC__(life_adminlevel) > 2) then
		{
			_return set[count _return,["B_Plane_CAS_01_F",10000]];
			_return set[count _return,["B_MBT_01_mlrs_F",10000]];
		};
	};
	
	case "cop_air_1":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",75000]];
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["B_Heli_Transport_01_F",200000]];
		};
	};
	
	case "cop_air_2":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",75000]];
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["B_Heli_Transport_01_F",200000]];
			_return set[count _return,
			["B_MRAP_01_hmg_F",750000]];
		};
	};

	case "cop_air_3":
	{
		if(__GETC__(life_coplevel) > 5) then
		{
		_return set[count _return,
		["B_Plane_CAS_01_F",500000]];
		};
	}; 
	
	case "civ_ship_1":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000]
		];
	};
	
	case "civ_ship_2":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000]
		];
	};
	
	case "civ_ship_3":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000]
		];
	};
	
	case "cop_ship_1":
	{
		_return =
		[
			["B_Boat_Transport_01_F",3000],
			["C_Boat_Civil_01_police_F",20000],
			["B_Boat_Armed_01_minigun_F",75000],
			["B_SDV_01_F",100000]
		];
	};

	case "kart_shop":
	{
		_return = [
			["C_Kart_01_Blu_F",15000],
			["C_Kart_01_Fuel_F",15000],
			["C_Kart_01_Red_F",15000],
			["C_Kart_01_Vrana_F",15000]
		];
	};	

	case "med_shop":
	{
		_return = 
		[	
			["C_SUV_01_F",5000],
			["C_Offroad_01_F",10000],
			["I_Truck_02_medical_F",25000],
			["O_Truck_03_medical_F",45000],
			["B_Truck_01_medical_F",60000]
		];
	};
	case "med_air_hs":
	{
		_return = 
		[
			["B_Heli_Light_01_F",50000],
			["O_Heli_Light_02_unarmed_F",75000]
		];
	};
};

_return;
