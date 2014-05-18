/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

//Internal Debugging.
if(!isNil "TON_Debug") then {
	systemChat format["PART: %1 || DAMAGE: %2 || SOURCE: %3 || PROJECTILE: %4 || FRAME: %5",_part,_damage,_source,_projectile,diag_frameno];
};

//Handle the tazer first (Top-Priority).
if(!isNull _source) then {
	if(_source != _unit) then {
		_curWep = currentWeapon _source;
		if(_projectile in ["B_9x21_Ball","B_556x45_dual"] && _curWep in ["hgun_P07_snds_F","arifle_SDAR_F"]) then {
			if(side _source == west && playerSide != west) then {
				private["_distance","_isVehicle","_isQuad"];
				_distance = if(_projectile == "B_556x45_dual") then {100} else {35};
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
				
				_damage = false;
				if(_unit distance _source < _distance) then {
					if(!life_istazed && !(_unit getVariable["restrained",false])) then {
						if(_isVehicle && _isQuad) then {
							player action ["Eject",vehicle player];
							[_unit,_source] spawn life_fnc_tazed;
						} else {
							[_unit,_source] spawn life_fnc_tazed;
						};
					};
				};
			};
			
			//Temp fix for super tasers on cops.
			if(playerSide == west && side _source == west) then {
				_damage = false;
			};
		};
	};
};

// Flashbang
if (_projectile in ["mini_Grenade"]) then {
	_damage = 0;
[_projectile] spawn life_fnc_handleFlashbang;
};

//* For Medic System:
_injuries = _unit getVariable "injuries";
_bleeding = _unit getVariable "bleeding";
if (_projectile == "") then {
	if(vehicle _source isKindOf "LandVehicle") then {
		_injuries set [count _injuries,["fraktur"]];
	} else
	{
		_injuries set [count _injuries,["fraktur"]];
	};
} 
else 
{
	//* Player wurde von Projektil getroffen
	if (_part == "head") then {
		_injuries set [count _injuries,["headshot"]];
	};
	if (_part == "body") then {
		_injuries set [count _injuries,["bl_body"]];
		_bleeding = _bleeding+(1-_damage)*5;
	};
	if (_part == "hand_l") then {
		_injuries set [count _injuries,["bl_hand_l"]];
		_bleeding = _bleeding+(1-_damage)*1;
	};
	if (_part == "hand_r") then {
		_injuries set [count _injuries,["bl_hand_r"]];
		_bleeding = _bleeding+(1-_damage)*1;
	};
	if (_part == "leg_l") then {
		_injuries set [count _injuries,["bl_leg_l"]];
		_bleeding = _bleeding+(1-_damage)*2;
	};
	if (_part == "leg_r") then {
		_injuries set [count _injuries,["bl_leg_r"]];
		_bleeding = _bleeding+(1-_damage)*2;
	};
};
diag_log format["HandleDamage: Bleeding: %1 Projectile: %2 Part: %3 Damage: %4",_bleeding, _projectile, _part, _damage];
_unit setVariable["injuries",_injuries,true];
_unit setVariable["bleeding",_bleeding,true];


[] call life_fnc_hudUpdate;
_damage;