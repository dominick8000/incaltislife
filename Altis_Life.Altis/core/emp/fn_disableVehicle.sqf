/*

	Author: InC_K3ating
	
*/
private["_index","_vehicle"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	if(life_empInUse) exitWith{ hint "Das EMP warnt grade schon ein Fahrzeug oder die Batterie muss sich erst wieder aufladen"; };
	life_empInUse = true;
	_index = lbCurSel (2902);
	_vehicle = life_lastVehicles select _index;
	if (isNull _vehicle) exitWith{};
	(vehicle player) say3D "empacsound";
	[[_vehicle], "life_fnc_vehicleDisabled",crew _vehicle,false}] spawn life_fnc_MP;
	sleep (3 + 60);
	life_empInUse = false;
};