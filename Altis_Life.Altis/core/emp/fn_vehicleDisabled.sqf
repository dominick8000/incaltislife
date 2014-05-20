/*

	Author: InC_K3ating
	
*/
private[_vehicle];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith{};
_vehicle setVariable["disabled",true,true];
if(_vehicle isKindOf "Car") then {
	_vehicle say3D "empwarn";
	sleep 3;
	if (local _vehicle) then {
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 1];
		sleep (3 * 60);
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 0];
	};
};
if(_vehicle isKindOf "Air") then {
	_vehicle say3D "empwarn";
	sleep 3.35;
	_vehicle say3D "empwarn";
	sleep 3.35;
	_vehicle say3D "empwarn";
	sleep 3.35;
	if(local _vehicle) then {
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 1];
		sleep (3 * 60);
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 0];
	}
};
if(_vehicle isKindOf "Ship") then {
	_vehicle say3D "empwarn";
	sleep 3.35;
	if(local _vehicle) then {
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 1];
		sleep (3 * 60);
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 0];
	}
};
_vehicle setVariable["disabled",false,true];