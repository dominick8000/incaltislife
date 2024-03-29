#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end","_rank"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if((str(player) in ["cop_1","cop_2","cop_3","cop_4","cop_5","cop_6","cop_7","cop_8","cop_9","cop_10","cop_11","cop_12","cop_13","cop_14","cop_15","cop_16","cop_17","cop_18","cop_19", "cop_20"])) then {
	if((__GETC__(life_coplevel) < 1) && (__GETC__(life_adminlevel) < 1)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};
_rank = "";
switch (__GETC__(life_coplevel)) do
{
	case 1:
	{
		_rank = "[Rekrut]";
	};
	case 2:
	{
		_rank = "[Advanced Rekrut]";
	};
	case 3:
	{
		_rank = "[Patrol Officer]";
	};
	case 4:
	{
		_rank = "[Officer]";
	};
	case 5:
	{
		_rank = "[Advanced Officer]";
	};
	case 6:
	{
		_rank = "[Seargent]";
	};
	case 7:
	{
		_rank = "[General]";
	};
};
player setVariable["Rank",_rank,true];
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

[] spawn
{
	while {true} do
	{
		waitUntil {uniform player == "U_Rangemaster"};
		player setObjectTextureGlobal [0,"textures\police_shirt.paa"];
		waitUntil {uniform player != "U_Rangemaster"};
	};
};
