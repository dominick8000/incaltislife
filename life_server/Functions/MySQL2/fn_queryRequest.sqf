/*
	File: fn_queryRequest.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles the incoming request and sends an asynchronous query 
	request to the database.
	
	Return:
	ARRAY - If array has 0 elements it should be handled as an error in client-side files.
	STRING - The request had invalid handles or an unknown error and is logged to the RPT.
*/
private["_uid","_side","_query","_return","_queryResult","_qResult","_handler","_thread","_threadGang","_handlerGang","_handlerHousing","_queryGang","_queryHousing","_queryGangResult","_queryHousingResult","_Gangqhandle","_Housingqhandle"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
_ownerID = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _ownerID) exitWith {};
_ownerID = owner _ownerID;
//if(_uid == "" || _side == sideUnknown) exitWith {"The UID or side passed had invalid inputs."};

_handler = {
	private["_thread"];
	_thread = [_this select 0,true,_this select 1] spawn DB_fnc_asyncCall;
	waitUntil {scriptDone _thread};
};

//compile our query request
_query = switch(_side) do {
	case west: {format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, cop_licenses, coplevel, cop_gear, blacklist FROM players WHERE playerid='%1'",_uid];};
	case civilian: {format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, civ_licenses, arrested, civ_gear FROM players WHERE playerid='%1'",_uid];};
	case independent: {format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, med_licenses, mediclevel FROM players WHERE playerid='%1'",_uid];};
};
diag_log format["get Player Information: Query: %1",_query];
waitUntil{!DB_Async_Active};

while {true} do {
	_thread = [_query,_uid] spawn _handler;
	waitUntil {scriptDone _thread};
	sleep 0.2;
	_queryResult = (missionNamespace getVariable format["QUERY_%1",_uid]) select 0;
	diag_log format["got mission namespace variable: %1 Result: %2",format["QUERY_%1",_uid],_queryResult];
	if(!isNil "_queryResult") exitWith {};
};

missionNamespace setVariable[format["QUERY_%1",_uid],nil]; //Unset the variable.

if(typeName _queryResult == "STRING") exitWith {
	[[],"SOCK_fnc_insertPlayerInfo",_ownerID,false,true] spawn life_fnc_MP;
};

//Parse licenses (Always index 6)
_new = [(_queryResult select 6)] call DB_fnc_mresToArray;
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
_queryResult set[6,_new];

//Convert tinyint to boolean
_old = _queryResult select 6;
for "_i" from 0 to (count _old)-1 do
{
	_data = _old select _i;
	_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
};
_queryResult set[6,_old];

//Parse data for specific side.
switch (_side) do {
	case west: {
		_new = [(_queryResult select 8)] call DB_fnc_mresToArray;
		if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
		_queryResult set[8,_new];
	};
	case civilian: {
		_new = [(_queryResult select 8)] call DB_fnc_mresToArray;
		if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
		_queryResult set[8,_new];
	};
};
diag_log format["Got Player Information: Return: %1",_queryResult];

switch(_side) do
{
	case civilian: 
	{
		//compile our query request
		_queryGang = format["SELECT gangs.id, gangs.gangname, gangs.locked, gang_players.rank FROM gangs LEFT JOIN gang_players on gang_players.gangid=gangs.id WHERE gang_players.playerid='%1'",_uid];
		diag_log format["get Player Gang Information: Query: %1",_queryGang];
		waitUntil{!DB_Async_Active};
		_Gangqhandle = format["%1_GANG",_uid];
		diag_log format["Handle: %1",_Gangqhandle];
		while {true} do {
			_threadGang = [_queryGang,_Gangqhandle] spawn _handler;
			waitUntil {scriptDone _threadGang};
			sleep 0.2;
			_queryGangResult = (missionNamespace getVariable format["QUERY_%1",_Gangqhandle]) select 0;
			diag_log format["got mission namespace variable: %1 Result: %2",format["QUERY_%1",_Gangqhandle],_queryGangResult];
			if(!isNil "_queryGangResult") exitWith {};
		};
		missionNamespace setVariable[format["QUERY_%1",_Gangqhandle],nil]; //Unset the variable.
		_queryResult set[count _queryResult,[_queryGangResult]];
		
		diag_log format["got Player Gang Information: Return: %1",_queryGangResult];
		

		//compile our query request
		_queryHousing = format["SELECT houses.position, houses.storage, houses.weapon_storage FROM houses WHERE pid='%1'",_uid];
		
		diag_log format["get Player Housing Information: Query: %1",_queryHousing];
		waitUntil{!DB_Async_Active};
		
		_Housingqhandle = format["%1_HOUSING",_uid];
		while {true} do {
			_threadHousing = [_queryHousing,_Housingqhandle] spawn _handler;
			waitUntil {scriptDone _threadHousing};
			sleep 0.2;
			_queryHousingResult = missionNamespace getVariable format["QUERY_%1", _Housingqhandle];
			diag_log format["got mission namespace variable: %1",_queryHousingResult];
			if(!isNil "_queryHousingResult") exitWith {};
		};
	
		// Parse Housing Data:
		_ret = [];
		_i = 0;
		{	
			_new = [(_x select 0)] call DB_fnc_mresToArray;
			if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
			//diag_log format ["pos : %1 (%2)", _new, typeName _new];
			
			_storage = [(_x select 1)] call DB_fnc_mresToArray;
			if(typeName _storage == "STRING") then {_storage = call compile format["%1", _storage];};
			//diag_log format ["storage : %1 (%2)", _storage, typeName _storage];
			
			_weaponStorage = [(_x select 2)] call DB_fnc_mresToArray;
			if(typeName _weaponStorage == "STRING") then {_weaponStorage = call compile format["%1", _weaponStorage];};
			//diag_log format ["_weaponStorage : %1 (%2)", _weaponStorage, typeName _weaponStorage];
				
			_ret set[_i, [_new,_storage, _weaponStorage]];
			//_ret set[_i, _new];
			_i = _i + 1;
		}forEach (_queryHousingResult);
	};	
};
missionNamespace setVariable[format["QUERY_%1",_uid],nil]; //Unset the variable.
_queryResult set[count _queryResult,[_ret]];

diag_log format["got Player Housing Information: Return: %1",_ret];
diag_log format["Returning Player Information: %1", _queryResult];
[_queryResult,"SOCK_fnc_requestReceived",_ownerID,false] spawn life_fnc_MP;