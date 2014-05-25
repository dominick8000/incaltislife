/*

	Author: inC_K3ating


*/
private["_curTarget"];
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;


[[_curTarget,"AmovPercMstpSnonWnonDnon_AmovPpneMstpSnonWnonDnon"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
Sleep 10;
[[_curTarget,"AinjPpneMstpSnonWnonDnon_rolltoback"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
sleep 10;
[[player,"Acts_TreatingWounded_in"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
_curTarget setVariable["Medicated",true,true];