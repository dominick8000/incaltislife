/*
	File: fn_removeGangPlayers.sqf
	Author: msc
	
	Description:
	removes player from gang
*/
private["_uid","_newleader","_query","_sql","_gangPlayer"];
_newleader = [_this,0,"",[""]] call BIS_fnc_param;
_gang = [_this,1,"",[""]] call BIS_fnc_param;


// Stop bad data...
if(_newleader == "" OR _gang == "") exitWith{};

_query = format["UPDATE gang_players SET rank='1' WHERE gangid=(SELECT id FROM gangs WHERE gangname='%1')", _gang];
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];

_query2 = format["UPDATE gang_players SET rank='7' WHERE playerid='%1' ",_newleader];
_sql2 = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query2,(call LIFE_SCHEMA_NAME)];

diag_log format ["query : %1", _query];