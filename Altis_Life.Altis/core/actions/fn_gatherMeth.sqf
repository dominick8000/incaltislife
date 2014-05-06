/*
File: fn_gatherGrapes.sqf

Author: Capt. Fitzsimmons
Modified: InC_K3ating

Description:
Meth Picking Function

*/
private["_sum"];
_sum = ["meth",3,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
life_action_inUse = true;
titleText["Picking Meth...","PLAIN"];
titleFadeOut 5;
sleep 5;
if(([true,"meth",_sum] call life_fnc_handleInv)) then
{
playSound "bag.ogg"; // this only if you want the sound for the bag when you gather it 
titleText["You have gathered some Meth.","PLAIN"];
};
};

life_action_inUse = false;