/*
	File: fn_removeGangPlayers.sqf
	Author: msc
	
	Description:
	removes player from gang
*/
private["_uid","_lock","_query","_sql","_gangPlayer"];
_lock = [_this,0,"",[""]] call BIS_fnc_param;
_gang = [_this,1,"",[""]] call BIS_fnc_param;



// Stop bad data...
if(_lock == "" OR _gang == "") exitWith{};

_query = format["UPDATE gangs SET locked='%1' WHERE name='%2' ",_lock, _gang];
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];
diag_log format ["query : %1", _query];