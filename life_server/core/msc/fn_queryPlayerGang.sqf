/* 
	File: fn_queryPlayerGangs.sqf
	Author: msc
	
	Description:
	get gang (and leaderstatus) of a player
*/
private["_uid","_side","_sql","_query","_leaderstatus","_ret","_group","_leaderid","_name","_atmCash","_gangPlayers"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,civilian,[civilian]] call BIS_fnc_param;
_ret = [];
if(_uid == "") exitWith {"Invalid UID"};
_leaderstatus = 0;
switch (_side) do
{
	case civilian:
	{
		_query = format["SELECT leaderid, name, atmCash, locked FROM gangs LEFT JOIN gang_players on gang_players.gangname=gangs.name WHERE leaderid = '%1' OR playerid = '%1'",_uid];
		diag_log format ["query player gangs: %1", _query];
		_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];
		_sql = call compile format["%1", _sql];
		waitUntil {typeName _sql == "ARRAY"};
	};
};

if(isNil {((_sql select 0) select 0)}) then
{

}
	else
{
	_ret = [];
	if(count (_sql select 0) == 0) exitWith {_ret = [];};
	switch(_side) do 
	{
		case civilian:
		{
			_i = 0;
			{	
				_leaderid = format["%1", (_x select 0)];
				_name = (_x select 1);
				_atmCash = (_x select 2);
				_locked = (_x select 3);
				diag_log format ["Player Gang : %1 - %2 - %3 - %4", _leaderid, _name, _atmCash, _locked];
				_ret = [_name, _leaderid, _atmCash, _locked];
			} foreach (_sql select 0);
		};
	};
};
_ret;