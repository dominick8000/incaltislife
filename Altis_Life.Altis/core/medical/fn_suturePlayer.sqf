/*
	Author: super msc

*/
private["_curTarget"];
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_bleeding = _curTarget getVariable "bleeding";
if([false,"sew_kit",1] call life_fnc_handleInv) then {
	if (_bleeding > 5) then {
		_curTarget setVariable["bleeding",0,true];
		hint format["You bandaged %1 successfully", str(_curTarget)];
	} else {
		_Damage = getDammage _curTarget;
		_Damage = _Damage+0.1;
		_curTarget setDamage _Damage;
	};
} else {
	hint "You don't have a sew Kit";
};

