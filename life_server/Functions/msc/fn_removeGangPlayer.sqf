/*
	File: fn_removeGangPlayers.sqf
	Author: msc
	
	Description:
	removes player from gang
*/
private["_uid","_query","_sql","_gangPlayer"];
_gangPlayer = [_this,0,"",[""]] call BIS_fnc_param;

// Stop bad data...
if(_gangPlayer == "") exitWith{};

_query = format["DELETE FROM gang_players WHERE playerid = '%1'",_gangPlayer];
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];
diag_log format ["query : %1", _query];