/*
	Author: super msc

*/
private["_curTarget"];
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_bleeding = _curTarget getVariable "bleeding";
if([false,"bandage",1] call life_fnc_handleInv) then {
	if (_bleeding > 5) then {
		hint "This didn't help much";
	}
	else {
		_curTarget setVariable["bleeding",0,true];
		hint format["You bandaged %1 successfully", str(_curTarget)];
	};
} else {
	hint "You don't have bandages";
};

