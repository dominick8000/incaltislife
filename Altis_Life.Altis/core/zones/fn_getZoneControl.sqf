/*
	File: fn_robReserve.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for robbing the federal reserve.
	[[_marker,_currentcontrol,_zonename,_gangname],"msc_fnc_getZoneControl",_unit,false] spawn life_fnc_MP;
*/
private["_marker","_funds","_timer","_toFar"];
_marker = [_this,0] call BIS_fnc_param;
_currentcontrol = [_this,1] call BIS_fnc_param;
_zonename = [_this,2] call BIS_fnc_param;
_gangname = [_this,3] call BIS_fnc_param;

_toFar = false;
diag_log format ["New Zone Control Request from Server %1 - %2 - %3 - %4 ",_marker,_currentcontrol,_zonename,_gangname];

if(isNil "_marker") exitWith {diag_log "Nil Marker"}; //Bad data
_markerpos = getMarkerPos _marker;
if(player distance _markerpos > 10) exitWith {[[_marker,2,""],"MSC_fnc_updateZoneState",false,false] spawn life_fnc_MP; hint "You were to stay within 50m of the Zone!"};
_timer = time + (1 * 60); //Default timer is 10 minutes to rob.

while {true} do
{
	//Timer display (TO BE REPLACED WITH A NICE GUI LAYER)
	_countDown = if(round(_timer - time) > 60) then {format["%1 minute(s)",round(round(_timer - time) / 60)]} else {format["%1 second(s)",round(_timer - time)]};
	hintSilent format["You need to stay within 10m!\n\nTime Remaining:\n %1\n\nDistance: %2m",_countDown,round(player distance _markerpos)];

	if(player distance _markerpos > 10) exitWith {_toFar = true;};
	if((round(_timer - time)) < 1) exitWith {};
	if(!alive player) exitWith {};
	if(life_istazed) exitWith {};
};

switch(true) do
{
	case (_toFar):
	{
		hint "You went to far from the zone!";
		[[_marker,2,_gangname],"MSC_fnc_updateZoneState",false,false] spawn life_fnc_MP;
	};
	
	case (!alive player):
	{
		hint "Because you died the overtake failed.";
		[[_marker,2,_gangname],"MSC_fnc_updateZoneState",false,false] spawn life_fnc_MP;
	};
	
	case (life_istazed):
	{
		hint "You were tazed, the overtake has failed!";
		[[_marker,2,_gangname],"MSC_fnc_updateZoneState",false,false] spawn life_fnc_MP;
	};
	
	case ((round(_timer - time)) < 1):
	{
		[[_marker,3,_gangname],"MSC_fnc_updateZoneState",false,false] spawn life_fnc_MP;
	};
};