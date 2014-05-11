/*
	File: fn_insertGang.sqf
	Author: msc
	
	Description:
	inserts a gang into the database
*/
private["_uid","_name","_query","_sql","_leaderid","_atmcash"];
_name = [_this,0,"",[""]] call BIS_fnc_param;
_leaderid = [_this,1,"",[""]] call BIS_fnc_param;
_locked = false;


_atmcash = 0;
// Stop bad data...
if(_name == "" OR _leaderid == "") exitWith{diag_log format["Some nulls here: %1 %2",_name,_leaderid];};
diag_log "creating new gang in database";
_query = format["INSERT INTO gangs (name, atmcash, locked) VALUES ('%1','0','%2')",_name, _locked];
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];

_query2 = format["INSERT INTO gang_players (gangid, playerid, rank) VALUES ((SELECT id FROM gangs WHERE gangname='%1'),'%2', '7')",_name, _leaderid];
_sql2 = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query2,(call LIFE_SCHEMA_NAME)];



diag_log format ["query : %1", _query];

