/*
	File: fn_ZoneState.sqf
	Author: msc
	
	Description:
*/
private["_marker","_state","_gangname"];
_marker = [_this,0] call BIS_fnc_param;
_state = [_this,1] call BIS_fnc_param;
_gangname = [_this,2] call BIS_fnc_param;
diag_log format ["Zone State change: %1 - %2 - %3",_marker,_state,_gangname];
if(isNil "_marker") exitWith {}; //Bad data passed?
if(isNil "_state") exitWith {}; //Bad data passed?

_index = [_marker,life_zone_list] call fnc_index;
if(_index == -1) exitWith {diag_log "Zone does not exist in zone list."};
_zone = life_zone_list select _index;
_markerzl = _zone select 0;
_currentcontrol = _zone select 1;
_zonename = _zone select 3;
_zonetrigger = _zone select 4;
_zonehinttrigger = _zone select 5;

switch(_state) do
{
	case 1:
	{
		_message = format["%2 is trying to get control of Zone %1",_zonename,_gangname];
		[[1,_message],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		life_zone_list set [_index,[_markerzl,_currentcontrol,1,_zonename, _zonetrigger, _zonehinttrigger]];	
		publicVariable "life_zone_list";
		[[],"life_fnc_refreshZones",true,false] spawn life_fnc_MP;
	};
	case 2:
	{	
		_message = format["%2 failed to take control of Zone %1",_zonename,_gangname];
		[[1,_message],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		life_zone_list set [_index,[_markerzl,_currentcontrol,2,_zonename, _zonetrigger, _zonehinttrigger]];	
		publicVariable "life_zone_list";
		[[],"life_fnc_refreshZones",true,false] spawn life_fnc_MP;
		sleep (10 * 60); //Wait 10 minutes
		life_zone_list set [_index,[_markerzl,_currentcontrol,0,_zonename, _zonetrigger, _zonehinttrigger]];
		publicVariable "life_zone_list";
		[[],"life_fnc_refreshZones",true,false] spawn life_fnc_MP;	
		
	};
	case 3:
	{
		_message = format["%2 successfully gained control of Zone %1",_zonename,_gangname];
		[[1,_message],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		[[],"life_fnc_refreshZones",true,false] spawn life_fnc_MP;
		life_zone_list set [_index,[_markerzl,_gangname,3,_zonename, _zonetrigger, _zonehinttrigger]];
		publicVariable "life_zone_list";
		[[],"life_fnc_refreshZones",true,false] spawn life_fnc_MP;		
		sleep (10 * 60); //Wait 10 minutes
		life_zone_list set [_index,[_markerzl,_gangname,0,_zonename, _zonetrigger, _zonehinttrigger]];
		publicVariable "life_zone_list";
		[[],"life_fnc_refreshZones",true,false] spawn life_fnc_MP;	
	};
};
publicVariable "life_zone_list";
[[],"life_fnc_refreshZones",true,false] spawn life_fnc_MP;