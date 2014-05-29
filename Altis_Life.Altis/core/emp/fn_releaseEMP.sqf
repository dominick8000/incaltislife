/*
	Author: InC_K3ating

	Description: Scans surrounding vehicles and fires the EMP
*/
if (playerSide == west) then {hint "EMP Effekt wird deaktiviert!"};
_nObjects = nearestObjects [player,["Car","Air"], 50];
{
	_x setHit [getText(configFile >> "cfgVehicles" >> typeOf _x >> "HitPoints" >> "HitEngine" >> "name"), 0];
} foreach _nObjects;