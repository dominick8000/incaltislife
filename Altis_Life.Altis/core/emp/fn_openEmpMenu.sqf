/*

	Author: InC_K3ating
	
*/
if(!alive player) exitWith {};
createDialog "EMPMenu";
disableSerialization;
waitUntil {!isNull (findDisplay 3494)};
[] spawn life_fnc_scanVehicles;