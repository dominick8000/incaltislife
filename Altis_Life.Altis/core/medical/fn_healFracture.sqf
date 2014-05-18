/*
	Author: super msc

*/
private["_curTarget"];
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_injuries = _curTarget getVariable "injuries";
if([false,"splint",1] call life_fnc_handleInv) then {
	if (_injuries select 0 OR _injuries select 1 OR _injuries select 2 OR _injuries select 3 OR _injuries select 4 OR _injuries select 5) then {
		_injuries set [0,false];
		_injuries set [1,false];
		_injuries set [2,false];
		_injuries set [3,false];
		_injuries set [4,false];
		_injuries set [5,false];
		hint format["You healed the Fracture of  %1", str(_curTarget)];
		player setFatigue 0;
	} else {
		hint "There is nothing to do";
	};
} else {
	hint "You don't have a splint"
};


