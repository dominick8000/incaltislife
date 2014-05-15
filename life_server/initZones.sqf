/*
	File: initZones.sqf
	Author: msc
	
	Description:
	init
*/
private["_allGangs","_name","_gangPlayers","_atmCash","_leaderid","_locked","_groupid","_group"];
diag_log "INIT Zones";
life_zone_list = [];
_gangZones = [
	["gang_1","Channel 6 News"],
	["gang_2","Syrta"],
	["gang_3","Negades"],
	["gang_4","Kore"],
	["gang_5","Agios Dionysios"],
	["gang_6","Lakka"],
	["gang_7","Alikampos"],
	["gang_8","Poliakko"],
	["gang_9","Katalaki"],
	["gang_10","Therisa"],
	["gang_11","Panochori"],
	["gang_12","Neri"],
	["gang_13","Galati"],
	["gang_14","Frini"],
	["gang_15","Rodopoli"],
	["gang_16","Paros"],
	["gang_17","Kalochori"],
	["gang_18","Telos"]
];
{
		_marker = _x select 0;
		_zonename = _x select 1;
		
		_zone = createTrigger ["EmptyDetector",(getMarkerPos _marker)];
	
		_zonehint = createTrigger ["EmptyDetector",(getMarkerPos _marker)];
		
		diag_log format ["New life_zone_list Entry: %1 - %2",_marker,_zonename];
		life_zone_list set [count life_zone_list,[_marker,"nobody",0,_zonename,_zone,_zonehint]];	
} forEach _gangZones;
diag_log format ["life_zone_list: %1",life_zone_list];
publicVariable "life_zone_list";
diag_log "ZONES INITIATED";

