/*
	Author: InC_K3ating
	
	Description: Scans surrounding vehicles and fires the EMP
*/
private["_nObjects"];
if (playerSide == west) then {hint "Alle Farhzeuge innerhalb von 50 Metern \nwerden in 10 Sekunden ausser Gefecht gesetzt!"};
sleep 10;
if (playerSide == west) then {hint "EMP wird aktiviert!"};
vehicle player say3D "empactivate";
_nObjects = nearestObjects [player,["Car","Air"], 50];
{
	_x setHit [getText(configFile >> "cfgVehicles" >> typeOf _x >> "HitPoints" >> "HitEngine" >> "name"), 1];
} foreach _nObjects;