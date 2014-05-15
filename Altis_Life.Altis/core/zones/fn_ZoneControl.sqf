/*
	File: fn_ZoneControl.sqf
	Author: msc
	
	Description:
	Gathers Zone Control
*/
private["_vault","_unit","_marker","_arguments","_group"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_caller = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_marker = [_this,3] call BIS_fnc_param;
_group =  group _caller;
_index = [_group,life_gang_list] call fnc_index;
if(_index == -1) exitWith {hint "You don't seem to be in a Gang."};
_gang = life_gang_list select _index;
_groupgl = _gang select 1;
_gangname = _gang select 0;
if (_groupgl != _group) exitWith {hint "Strange Error..."};

if(isNull _target) then {hint "No Target!"};
if(isNull _caller) exitWith {hint "No Caller!"};
if(isNil "_marker") exitWith {hint "No Marker!"}; //Bad data passed

[[_caller,_marker,_gangname],"MSC_fnc_gatherZoneControl",false,false] spawn life_fnc_MP;