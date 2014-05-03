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

_query = format["UPDATE gangs SET leaderid='%1' WHERE name='%2' ",_newleader, _gang];
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];
diag_log format ["query : %1", _query];