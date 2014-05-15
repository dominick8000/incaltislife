/* Refreshes Trigger Statements
*/
life_zone_list = missionNamespace getVariable "life_zone_list";
diag_log "Refreshing Zones";
{
	_marker = _x select 0;
	_gangname = _x select 1;
	_status = _x select 2;
	_zonename = _x select 3;
	_zonetrigger = _x select 4;
	_zonehinttrigger = _x select 5;
	_text = format["Controlled by %1",_gangname];
	_marker setMarkerText _text;
	if(_status == 1) then {
		_marker setMarkerColor "ColorRed";
	};
	if(_status == 2) then {
		_marker setMarkerColor "ColorBlue";
	};
	if(_status == 3) then {
		_marker setMarkerColor "ColorBlue";
	};
	if(_status == 0) then {
		_marker setMarkerColor "ColorBlack";
	};
	_statement = format["MSC_Action_Zone = player addAction['Gather Zone Control',life_fnc_ZoneControl,'%1',0,false,false,'','!life_action_inUse'];",_x select 0];
	_zonetrigger setTriggerStatements["player in thislist",_statement,"player removeAction MSC_Action_Zone;"];		
	_zonetrigger setTriggerArea[10,10,0,false];
	_zonetrigger setTriggerActivation["CIV","PRESENT",true];
	_statementhint = format["hint 'This area is currently controlled by: %1'",_gangname];
	_zonehinttrigger setTriggerStatements["player in thislist",_statementhint,""];	
	_zonehinttrigger setTriggerArea[100,100,0,false];
	_zonehinttrigger setTriggerActivation["CIV","PRESENT",true];
	diag_log format ["Refreshing Zone: %1 - %2 - %3 - %4 - %5 - %6",_marker,_gangname,_status,_zonename,_zonetrigger,_zonehinttrigger];
} forEach life_zone_list;
diag_log "Zones refreshed!";