/*
	File: fn_query.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles the query request sent from the server and processes it.
	
	Returns:
	Returns the result back to the client.
*/
systemChat format["Query Received: %1",_this];
private["_uid","_unit","_side","_ret","_ownerID","_ret"];
_unit = [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;
_side = [_this,1,civilian,[sideUnknown]] call BIS_fnc_param;
_uid = [_this,2,"",[""]] call BIS_fnc_param;
_ownerID = [_this,3,-1,[0]] call BIS_fnc_param;

_ret = [_uid,_side] call DB_fnc_query;
waitUntil {typeName _ret == "ARRAY" OR typeName _ret == "STRING" OR isNil "_ret"};

if(_ownerID == -1) exitWith {};

if(!isNil "_ret") then {
	[_ret,"life_fnc_sessionReceive",_ownerID,FALSE] spawn life_fnc_MP;
} else {
	[nil,"life_fnc_sessionReceive",_ownerID,FALSE] spawn life_fnc_MP;
};