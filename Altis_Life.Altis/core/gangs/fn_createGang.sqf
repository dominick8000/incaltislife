/*
	File: fn_createGang.sqf
	Author: Bryan "Tonic" Boardwine
	edited by: msc
	
	Description:
	Functionality meant for creating gangs.
*/
private["_value","_len","_group","_groupid","_uid","_gangplayers","_execute"];
_value = ctrlText 2522;
_len = [_value] call KRON_StrLen;

if(_len > 25) exitWith {hint "The maximum character limit for a gang name is 25."};
if(life_cash < 10000) exitWith {hint "You don't have $10,000 to create a gang!"};
if(isNil {life_gang_list}) exitWith {hint "Server not authorized for feature."};
if(([_value,life_gang_list] call fnc_index) != -1) exitWith {hint "That gang name is already taken!"};

_group = createGroup civilian;
_locked = false;
//Set Array
life_gang_list set[count life_gang_list,[_value,_group,false,str(player),getPlayerUID player]];
diag_log format ["create new group %1,%2,%3,%4,%5,%6",count life_gang_list,_value,_group,_locked,str(player),getPlayerUID player];
publicVariable "life_gang_list";
[player] joinSilent _group;
player setRank "COLONEL";
life_my_gang = _group;
if(!isNull life_my_gang) then
{
	life_cash = life_cash - 10000;
	closeDialog 0;
	createDialog "Life_My_Gang_Diag";
	publicVariable "life_gang_list";
};
//* Create the gang in the Database:
_uid = getPlayerUID player;
diag_log format ["creating new gang %1 in database..", _value];
[[_value, _uid],"MSC_fnc_insertGang",false,false] spawn life_fnc_MP;