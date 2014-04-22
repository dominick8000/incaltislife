/*
	File: fn_calVehWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Base configuration for vehicle weight
*/
private["_vehicle","_weight","_used"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};

_weight = -1;
_used = (_vehicle getVariable "Trunk") select 1;

switch ((typeOf _vehicle)) do
{
	case "C_Offroad_01_F": {_weight = 200;};  //* Offroad
	case "B_G_Offroad_01_F": {_weight = 201;}; //* Offroad
	case "B_Quadbike_01_F": {_weight = 29;};  //* Rebellen Quad
	case "I_Truck_02_covered_F": {_weight = 1250;};  //* LKW groﬂ
	case "I_Truck_02_transport_F": {_weight = 750;};  //* LKW mittel
	case "C_Hatchback_01_F": {_weight = 100;};  //* Limousine
	case "C_Hatchback_01_sport_F": {_weight = 101;}; //* Limousine donator
	case "C_SUV_01_F": {_weight = 140;}; //* SUV
	case "C_Van_01_transport_F": {_weight = 250;}; //* groﬂer PKW
	case "I_G_Van_01_transport_F": {_weight = 250;}; //* groﬂer PKW 2
	case "C_Van_01_box_F": {_weight = 400;};  //* LKW Klein
	case "C_Boat_Civil_01_F": {_weight = 85;};  //* Boot 1
	case "C_Boat_Civil_01_police_F": {_weight = 85;}; //* Boot 2 (Police)
	case "C_Boat_Civil_01_rescue_F": {_weight = 85;}; //* Boot 3 (Rettung)
	case "B_Truck_01_box_F": {_weight = 3000;};  //* LKW Donator
	case "B_Truck_01_transport_F": {_weight = 2500;}; //* LKW ganz groﬂ
	case "B_MRAP_01_F": {_weight = 150;};
	case "O_MRAP_02_F": {_weight = 140;};
	case "I_MRAP_03_F": {_weight = 130;};
	case "B_Heli_Light_01_F": {_weight = 80;}; //* Heli klein
	case "O_Heli_Light_02_unarmed_F": {_weight = 300;}; //* Orca
	case "I_Heli_Transport_02_F": {_weight = 650;}; //* Transport Heli
	case "C_Rubberboat": {_weight = 45;};
	case "O_Boat_Armed_01_hmg_F": {_weight = 175;};
	case "B_Boat_Armed_01_minigun_F": {_weight = 175;};
	case "I_Boat_Armed_01_minigun_F": {_weight = 175;};
	case "B_G_Boat_Transport_01_F": {_weight = 45;};
	case "B_Boat_Transport_01_F": {_weight = 45;};
	case "C_Quadbike_01_F": {_weight = 350;};  //* Transport Quad
	case "B_G_Offroad_01_armed_F": {_weight = 100;}; //* Offroad mit Kanone
};

if(isNil "_used") then {_used = 0};
[_weight,_used];