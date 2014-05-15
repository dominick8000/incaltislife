/*
	File: fn_gatherZoneControl.sqf
	Author: mSc
	
	Description:
	Server-side part of the gather Zone Control Process, runs checks and makes sure that
	two people aren't trying to ....
	[[_target,_caller,_marker,_groupname],"MSC_fnc_gatherZoneControl",false,false] spawn life_fnc_MP;
*/
private["_target","_caller","_marker","_gangname","_index"];
_caller = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_marker = [_this,1] call BIS_fnc_param;
_gangname = [_this,2] call BIS_fnc_param;
_unit = owner _caller;

if(isNil "_caller") exitWith {diag_log "No caller"};
if(isNil "_unit") exitWith {diag_log "No unit."};
if(isNil "_marker") exitWith {diag_log "No marker."};
if(isNil "_gangname") exitWith {diag_log "No gangname."}; //Bad data was passed.
diag_log format ["Zone Request Caller: %1 - Unit: %2 - Marker: %3 - Groupname: %4",_caller,_unit,_marker,_gangname];
if(!alive _caller) exitWith {diag_log "Dead unit."}; //He's dead?


_index = [_marker,life_zone_list] call fnc_index;
if(_index == -1) exitWith {diag_log "Zone does not exist in zone list."};
_zone = life_zone_list select _index;
_markerzl = _zone select 0;
_currentcontrol = _zone select 1;
_status = _zone select 2;
_zonename = _zone select 3;
_zonehinttrigger = _zone select 4;
_zonetrigger = _zone select 5;

if(_status == 1) exitWith
{
	[[1,"This Zone is already being taken over by someone else."],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
};
if(_status == 2) exitWith
{
	[[1,"Someone else tried to take control over this zone shortly."],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
};
if(_status == 3) exitWith
{
	[[1,"Someone else took control over this zone shortly."],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
};
if(_unit < 1) exitWith {}; //Bad unit number passed?!
if(_status == 0) then {
	[_marker,1,_gangname] spawn msc_fnc_updateZoneState;
	[[_marker,_currentcontrol,_zonename,_gangname],"life_fnc_getZoneControl",_unit,false] spawn life_fnc_MP;
};