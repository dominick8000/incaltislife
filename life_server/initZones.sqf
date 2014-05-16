/*
	File: initZones.sqf
	Author: msc
	
	Description:
	init
*/
private["_allGangs","_name","_gangPlayers","_atmCash","_leaderid","_locked","_groupid","_group"];
diag_log "INIT Zones";
life_zone_list = [];
//* Get gangZones from MYSQL!
_query = "SELECT * FROM areas";
private["_handler","_queryResult","_thread"];
_handler = {
	private["_thread"];
	_thread = [_this select 0,true,_this select 1] spawn DB_fnc_asyncCall;
	waitUntil {scriptDone _thread};
};
waitUntil{!DB_Async_Active};
while {true} do {
	_thread = [_query,"ZONES"] spawn _handler;
	waitUntil {scriptDone _thread};
	sleep 0.2;
	_queryResult = missionNamespace getVariable "QUERY_ZONES";
	if(!isNil "_queryResult") exitWith {};
};		
missionNamespace setVariable ["QUERY_ZONES",nil]; //Unset the variable.
{
		_marker = _x select 0;
		_owner = _x select 1;
		_zonename = _x select 2;		
		_zone = createTrigger ["EmptyDetector",(getMarkerPos _marker)];	
		_zonehint = createTrigger ["EmptyDetector",(getMarkerPos _marker)];
		diag_log format ["New life_zone_list Entry: %1 - %2 - %3",_marker,_zonename,_owner];
		life_zone_list set [count life_zone_list,[_marker,_owner,0,_zonename,_zone,_zonehint]];	
} forEach _queryResult;
diag_log format ["life_zone_list: %1",life_zone_list];
publicVariable "life_zone_list";
[[],"life_fnc_refreshZones",true,false] spawn life_fnc_MP;
diag_log "ZONES INITIATED";

