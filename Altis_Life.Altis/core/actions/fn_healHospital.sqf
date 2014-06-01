/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Doesn't matter, will be revised later.
*/
if(life_cash < 100) exitWith {hint format[localize "STR_NOTF_HS_NoCash",100];};
titleText[localize "STR_NOTF_HS_Healing","PLAIN"];
sleep 8;
if(player distance (_this select 0) > 5) exitWith {titleText[localize "STR_NOTF_HS_ToFar","PLAIN"]};
titleText[localize "STR_NOTF_HS_Healed","PLAIN"];
player setdamage 0;
life_cash = life_cash - 100;

player setVariable ["CUP_bloodLevel", 5500, true];
player setVariable ["CUP_bleedRate", 0, true];
player setVariable ["CUP_regenRate", 1, true];
player setVariable ["CUP_canAct", 1, true];
player setVariable ["CUP_lifeState", 0, true];
player setVariable ["CUP_armDamage", 0, true];
