#include <macro.h>
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called by the server saying that we have a response so let's 
	sort through the information, validate it and if all valid 
	set the client up.
*/
private["_lockedbool","_locked","_gangresult","_gangid","_gangname","_rank","_strplayer"];
_lockedbool = true;
life_session_tries = life_session_tries + 1;
if(life_session_tries > 3) exitWith {cutText["There was an error in trying to setup your client.","BLACK FADED"]; 0 cutFadeOut 999999999;};

cutText ["Received request from server... Validating...","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};

//Parse basic player information.
life_cash = parseNumber (_this select 2);
life_atmcash = parseNumber (_this select 3);
__CONST__(life_adminlevel,parseNumber(_this select 4));
__CONST__(life_donator,0);
//Loop through licenses
if(count (_this select 6) > 0) then {
	{
		missionNamespace setVariable [(_x select 0),(_x select 1)];
	} foreach (_this select 6);
};
//Parse side specific information.
switch(playerSide) do {
	case west: {
		__CONST__(life_coplevel,parseNumber(_this select 7));
		cop_gear = _this select 8;
		[] spawn life_fnc_loadGear;
		life_blacklisted = call compile format["%1",_this select 9];
		diag_log format["Blacklisted: %1",life_blacklisted];
	};
	
	case civilian: {
		life_is_arrested = call compile format["%1", _this select 7];
		civ_gear = _this select 8;
		__CONST__(life_coplevel,0);
		[] spawn life_fnc_civLoadGear;
	};
	
	case independent: {
		__CONST__(life_medicLevel,parseNumber(_this select 7));
	};
};
switch (playerSide) do
{
	case west:
	{
		switch(__GETC__(life_coplevel)) do
		{
			case 0: {life_paycheck = life_paycheck + 0;};
			case 1: {life_paycheck = life_paycheck + 0;};
			case 2: {life_paycheck = life_paycheck + 1000;};
			case 3: {life_paycheck = life_paycheck + 2000;};
			case 4: {life_paycheck = life_paycheck + 3000;};
			case 5: {life_paycheck = life_paycheck + 4000;};
			case 6: {life_paycheck = life_paycheck + 5000;};
			case 7: {life_paycheck = life_paycheck + 6000;};
		};
	};
};

switch (playerSide) do
{
	case civilian:
	{
		// Fetch Global Gang list
		life_gang_list = missionNamespace getVariable "life_gang_list";
		// Get Players Gang Result
		_gangresult = _this select 10;
		_leer = [];
		diag_log format["Gangresult: %1",_gangresult];
		if(typeName _gangresult == "STRING") then
		{
			diag_log "No Gangs for player in Database. 1";
		}
		else
		{
			_gangid = (_gangresult select 0); 
			if(isNil "_gangid") then
			{
				diag_log "No Gangs for player in Database. 2";
			}
				else
			{
				_gangname = (_gangresult select 1);
				_locked = (_gangresult select 2);
				_rank = (_gangresult select 3);
				if (_locked == "false") then {
					_lockedbool = false;
				} else {
					_lockedbool = true;
				};
				diag_log format ["Found Gang: %1 - locked: %2 - %3 - %4",_gangname, _locked, typeName _locked, _lockedbool];
				// Join da Group
				diag_log "Get Group id from life_gang_list";
				_index = [_gangname,life_gang_list] call fnc_index;
				if(_index == -1) then {
					diag_log "Gang could not be found in Global Gang list... exit";
				}
				else
				{
					_gang = life_gang_list select _index;
					_group = _gang select 1;
					_strplayer = _gang select 3;
					_leaderid = _gang select 4;
					if (isNull _group) then {
						diag_log "Couldn't find Group for that gang, creating new";
						_group = createGroup civilian;
					};
					diag_log "Joining Group";
					[player] join _group;
					life_my_gang = _group;
					diag_log format["You have joined the gang: %1",_gang select 0];
					if (_rank == "7") then {
						_leaderid = getPlayerUID player;
						group player selectLeader player;
						player setRank "COLONEL";
						_strplayer = str(player);
					};

					life_gang_list = [life_gang_list, _index] call BIS_fnc_removeIndex;
					life_gang_list set[count life_gang_list,[_gangname,_group,_lockedbool,_strplayer,_leaderid]];
					publicVariable "life_gang_list";
				};	
			};
		};
	};
};

switch (playerSide) do
{
    case civilian:
    {
        // Housing initialization
		diag_log format["Housing result: %1",_this select 9];
        life_houses = _this select 9;
        life_houses_markers = [];
    };
};

life_session_completed = true;	