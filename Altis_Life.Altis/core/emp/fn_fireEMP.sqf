/*
	Author: InC_K3ating

	Description: Scans surrounding vehicles and fires the EMP
*/
if (playerSide == west) then {hint "Alle Farhzeuge innerhalb von 50 Metern \nwerden in 10 Sekunden ausser Gefecht gesetzt!"};
sleep 10;
if (playerSide == west) then {hint "EMP wird aktiviert!"};
_nObjects = nearestObjects [player,["Car","Air"], 50];
{
	if (_x == vehicle player) then
	{
		_x setHit [getText(configFile >> "cfgVehicles" >> typeOf _x >> "HitPoints" >> "HitEngine" >> "name"), 0];
	} else {
		_x setHit [getText(configFile >> "cfgVehicles" >> typeOf _x >> "HitPoints" >> "HitEngine" >> "name"), 1];
	};
} foreach _nObjects;