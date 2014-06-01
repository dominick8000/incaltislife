/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle weight.
*/
private["_className"];
_className = [_this,0,"",[""]] call BIS_fnc_param;

switch (_className) do
{
	case "C_Offroad_01_F": {200};  //* Offroad
	case "B_G_Offroad_01_F": {201}; //* Offroad
	case "B_Quadbike_01_F": {29};  //* Rebellen Quad
	case "I_Truck_02_covered_F": {1250};  //* LKW groß
	case "I_Truck_02_transport_F": {750};  //* LKW mittel
	case "C_Hatchback_01_F": {100};  //* Limousine
	case "C_Hatchback_01_sport_F": {101}; //* Limousine donator
	case "C_SUV_01_F": {140}; //* SUV
	case "C_Van_01_transport_F": {250}; //* großer PKW
	case "I_G_Van_01_transport_F": {250}; //* großer PKW 2
	case "C_Van_01_box_F": {400};  //* LKW Klein
	case "C_Boat_Civil_01_F": {85};  //* Boot 1
	case "C_Boat_Civil_01_police_F": {85}; //* Boot 2 (Police)
	case "C_Boat_Civil_01_rescue_F": {85}; //* Boot 3 (Rettung)
	case "B_Truck_01_box_F": {3500};  //* LKW Donator
	case "B_Truck_01_transport_F": {2500}; //* LKW ganz groß
	case "B_MRAP_01_F": {150};
	case "O_MRAP_02_F": {140};
	case "I_MRAP_03_F": {130};
	case "B_Heli_Light_01_F": {80}; //* Heli klein
	case "O_Heli_Light_02_unarmed_F": {300}; //* Orca
	case "I_Heli_Transport_02_F": {650}; //* Transport Heli
	case "C_Rubberboat": {45};
	case "O_Boat_Armed_01_hmg_F": {175};
	case "B_Boat_Armed_01_minigun_F": {175};
	case "I_Boat_Armed_01_minigun_F": {175};
	case "B_G_Boat_Transport_01_F": {45};
	case "B_Boat_Transport_01_F": {45};
	case "C_Quadbike_01_F": {50};  //* Quad
	case "B_G_Offroad_01_armed_F": {100}; //* Offroad mit Kanone
	case "Land_Box_AmmoOld_F": {700};
    case "B_supplyCrate_F": {1000};
};