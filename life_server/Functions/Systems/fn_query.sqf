/*
	File: fn_query.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	This is a gateway to the SQF->MySQL Query function.
*/
private["_uid","_unit","_side","_ret","_ownerID"];
_unit = [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;
_side = [_this,1,civilian,[sideUnknown]] call BIS_fnc_param;
_uid = [_this,2,"",[""]] call BIS_fnc_param;

//Error checks
if(isNull _unit OR _uid == "") exitWith 
{
	if(!isNull _unit) then
	{
		_ownerID = owner _unit;
		["Either your player was null or your PlayerID sent was invalid. Try re-logging in.","life_fnc_sessionReceive",_ownerID,false] spawn life_fnc_MP;
	};
};

_ownerID = owner _unit;

//Is the headless client active? If so let him take over.
if(!isNil "hc_1" && {life_HC_isActive}) exitWith {
	private["_packet"];
	_packet = [_unit,_side,_uid,_ownerID];
	[_packet,"HC_fnc_query",(owner hc_1),FALSE] spawn BIS_fnc_MP;
};

_ret = [_uid,_side] call DB_fnc_query;

if(count _ret > 0) then {
	//diag_log format["LIFE-HOUSES: %1", format ["%1", life_houses]];
	_retHouses = [_uid,_side] call BRUUUDIS_fnc_queryPlayerHouses;
	//diag_log format["_retHouses: %1 (%2)", _retHouses, typeName _retHouses];
	waitUntil {typeName _retHouses == "ARRAY" OR typeName _retHouses == "STRING" OR isNil "_retHouses"};

	_ret set [count _ret, _retHouses];

	_retGang = [_uid,_side] call MSC_fnc_queryPlayerGang;
	waitUntil {typeName _retGang == "ARRAY" OR typeName _retGang == "STRING" OR isNil "_retGang"};
	_ret set [count _ret, _retGang];

	
	diag_log "--------------SESSION--------------";
	diag_log format["_ret 1: %1 (%2)", (_ret select 0), typeName (_ret select 0)];
	diag_log format["_ret 1: %1 (%2)", (_ret select 1), typeName (_ret select 1)];
	diag_log format["_ret 2: %1 (%2)", (_ret select 2), typeName (_ret select 2)];
	diag_log format["_ret 3: %1 (%2)", (_ret select 3), typeName (_ret select 3)];
	diag_log format["_ret 4: %1 (%2)", (_ret select 4), typeName (_ret select 4)];
	diag_log format["_ret 5: %1 (%2)", (_ret select 5), typeName (_ret select 5)];
	diag_log format["_ret 6: %1 (%2)", (_ret select 6), typeName (_ret select 6)];
	diag_log format["_ret 7: %1 (%2)", (_ret select 7), typeName (_ret select 7)];
	diag_log format["_ret 8: %1 (%2)", (_ret select 8), typeName (_ret select 8)];
	diag_log format["_ret 9: %1 (%2)", (_ret select 9), typeName (_ret select 9)];
	diag_log format["_ret 10: %1 (%2)", (_ret select 10), typeName (_ret select 10)];
	diag_log "------------SESSION END------------";
};

if(!isNil "_ret") then
{
	[_ret,"life_fnc_sessionReceive",_ownerID,false] spawn life_fnc_MP;
}
	else
{
	[nil,"life_fnc_sessionReceive",_ownerID,false] spawn life_fnc_MP;
};