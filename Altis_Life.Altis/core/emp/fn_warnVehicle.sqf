/*

	Author: InC_K3ating
	

*/
private["_index","_vehicle"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	if(life_empInUse) exitWith { hint "Das EMP warnt grade schon ein Fahrzeug"; };
	life_empInUse = true;
	_index = lbCurSel (2902);
	_vehicle = life_lastvehicles select _index;
	if(isNull _vehicle) exitWith {};
	[[_vehicle], "life_fnc_vehicleWarned",crew _vehicle,false] spawn life_fnc_MP;
	sleep 10;
	life_empInUse = false;
};