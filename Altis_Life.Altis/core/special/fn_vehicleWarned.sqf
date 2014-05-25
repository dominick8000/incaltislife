/*
    File: vehicleWarned.sqf
    Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_vehicle"];
_vehicle =  [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
if((_vehicle getVariable ["nano_warned", false])) exitWith {};
_vehicle setVariable["nano_warned",true,true];
sleep 3.35;
sleep 3.35;
sleep 3.35;
_vehicle setVariable["nano_warned",false,true];