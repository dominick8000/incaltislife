/*
	Author: super msc

*/
private["_curTarget"];
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_curTarget setVariable["bleeding",0,true];
hint format["You stopped %1 from Bleeding", str(player)];


