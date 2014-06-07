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

// BLEEEDD!!!
if (!(_projectile in ["B_9x21_Ball","B_556x45_dual"] && _curWep in ["hgun_P07_snds_F","arifle_SDAR_F"])) then {
	if (_part == "") then // General damage
	{
		// Bleeding
		_addBleed = _damage*CUP_bleedCoeff;
		_bleedRate = player getVariable "CUP_bleedRate";
		_newBleedRate = _bleedRate + _addBleed;
		player setVariable ["CUP_bleedRate", _newBleedRate, true];
		// Instantaneous blood loss
		_instantBleed = _damage*CUP_instantBleedCoeff;
		_bloodLevel = player getVariable "CUP_bloodLevel";
		_newBloodLevel = _bloodLevel - _instantBleed;
		if (_newBloodLevel < 0) then {player setDamage 1;};
		player setVariable ["CUP_bloodLevel", _newBloodLevel, true];
		// Knockout chance
		_lifeState = player getVariable "CUP_lifeState";
		_unconcsChance = ((1 - _newBloodLevel/5500)*((_damage + _newBleedRate)/100))*CUP_instantUnconcsCoeff;
		_unconcsRoll = random 1;
		if ((_unconcsRoll > (1 - _unconcsChance)) && (_lifeState == 0)) then
		{
			"instant" spawn CUP_knockout;
		};
	};
	if (_part == "hands") then // Arm damage
	{
		_armDamage = player getVariable "CUP_armDamage";
		// Involuntary weapon discharge
		/*_involFireRoll = random 1;
		if (_involFireRoll < CUP_involuntaryFireChance) then
		{
		player fire currentWeapon player;
		};*/
		// Add damage to arm damage
		_newArmDamage = _armDamage + (_damage*CUP_armDamageCoeff);
		player setVariable ["CUP_armDamage", _newArmDamage, true];
	};
};
//* diag_log format["PART: %1 || DAMAGE: %2 || SOURCE: %3 || PROJECTILE: %4 || FRAME: %5",_part,_damage,_source,_projectile,diag_frameno];
[] call life_fnc_hudUpdate;
_damage;