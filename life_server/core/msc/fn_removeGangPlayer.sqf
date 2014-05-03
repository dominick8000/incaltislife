/*
	File: fn_removeGangPlayers.sqf
	Author: msc
	
	Description:
	removes player from gang
*/
private["_uid","_name","_query","_sql","_gangPlayer"];
_gangPlayer = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;


// Stop bad data...
if(_name == "" OR _gangPlayer == "") exitWith{};

_query = format["DELETE FROM gangs WHERE playerid = '%1' AND gangname = '%2'",_gangPlayer, _name];
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];
diag_log format ["query : %1", _query];