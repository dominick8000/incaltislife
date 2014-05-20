/*

	Author: InC_K3ating
	
*/
private["_vehicle"];
_vehicle =  [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
_vehicle setVariable["warned",true,true];
_vehicle say3D "empwarn";
sleep 3.35;
_vehicle say3D "empwarn";
sleep 3.35;
_vehicle say3D "empwarn";
sleep 3.35;
_vehicle setVariable["warned",false,true];