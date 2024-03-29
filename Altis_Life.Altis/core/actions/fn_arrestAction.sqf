/*
	File: fn_arrestAction.sqf
	
	Description:
	Arrests the targeted person.
*/
private["_unit","_id","_time"]; // <-- Replace The Original Line With This
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_time = [_this,1,15] call BIS_fnc_param; //Default jail time 15 <-- Add This Line!

if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitWith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(!(_unit getVariable "restrained")) exitWith {}; //He's not restrained.
if(side _unit != civilian) exitWith {}; //Not a civ
if(isNull _unit) exitWith {}; //Not valid
if(_time < 1) exitWith {}; //Not Valid


[[_unit,player,false],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;

if(isNull _unit) exitWith {}; //Not valid
detach _unit;
[[_unit,false,_time],"life_fnc_jail",_unit,false] spawn life_fnc_MP; //  <-- Add This Line!
[[0,format[(localize "STR_NOTF_Arrested_1"), name _unit, name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;