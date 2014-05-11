/*
	File: fn_removeGang.sqf
	Author: msc
	
	Description:
	removes gang
*/
private["_uid","_name","_query","_sql","_gangPlayer"];
_name = [_this,0,"",[""]] call BIS_fnc_param;


// Stop bad data...
if(_name == "") exitWith{};

_query = format["DELETE FROM gangs WHERE name = '%1'",_name];
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];
diag_log format ["query : %1", _query];
_query = format["DELETE FROM gang_players WHERE gangname = '%1'",_name];
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];
diag_log format ["query : %1", _query];