#include <macro.h>
CUP_knockout = 
{
	if (vehicle player != player) exitWith {};
	player playActionNow "agonyStart";
	disableuserinput true;
	player setCaptive true;
	
	if (_this != "overdose") then
	{
		if (_this == "instant") then
		{
			titleText ["", "BLACK OUT", 0];
		};
		if (_this == "bleed") then
		{
		titleText ["", "BLACK OUT", 3];
		};
		player setVariable ["CUP_lifeState", 1, true];
		sleep 6;
		disableuserinput false;
		player enableSimulation false;
		while {(alive player) && (player getVariable "CUP_lifeState" == 1)} do
		{
			_bleedRate = player getVariable "CUP_bleedRate";
			_regenRate = player getVariable "CUP_regenRate";
			_bloodLevel = player getVariable "CUP_bloodLevel";
			_recoverChance = (((_bloodLevel - 1000)/1000)*((_regenRate - _bleedRate)/8))*CUP_unconcsAutorecoverCoeff;
			_recoverRoll = random 1;
			if (((_recoverRoll > (1 - _recoverChance)) || (_recoverRoll > 0.99)) && (_bloodLevel > 1000)) then
			{
				player setVariable ["CUP_lifeState", 0, true];
			};
			sleep 1;
		};
		if (player getVariable "CUP_lifeState" == 2) exitWith {};
	};
	if (_this == "overdose") then
	{
		titleText ["", "BLACK OUT", 1];
		player setVariable ["CUP_lifeState", 2, true];
		sleep 6;
		disableuserinput false;
		player enableSimulation false;
		while {(alive player) && (player getVariable "CUP_lifeState" == 2)} do
		{
			_regenRate = player getVariable "CUP_regenRate";
			if (_regenRate < CUP_maxRegenRate) then
			{
				_recoverRoll = random 1;
				if (_recoverRoll > CUP_overdoseUnconcsRecoverChance) then
				{
					player setVariable ["CUP_lifeState", 0, true];
				};
			};
			_newRegenRate = _regenRate - CUP_regenRateRecoverUnconcs;
			player setVariable ["CUP_regenRate", _newRegenRate, true];
			sleep 1;
		};
	};
	titleText ["", "BLACK IN", 10];
	if (CUP_unconcsRecoverFatigue >= 0) then {player setFatigue CUP_unconcsRecoverFatigue;};
	sleep CUP_recoverControlsDelay;
	player enableSimulation true;
	player playAction "agonyStop";
	player setCaptive false;
};


CUP_checkDrag = 
{
	_return = false;
	_tLifeState = cursorTarget getVariable "CUP_lifeState";
	_lifeState = player getVariable "CUP_lifeState";
	_canAct = player getVariable "CUP_canAct";
	_canTAct = cursorTarget getVariable "CUP_canAct";
	if ((_lifeState == 0) && (_tLifeState != 0) && (alive player) && (alive cursorTarget) && ("Medikit" in items player) && (player distance cursorTarget < 2) && (_canAct == 1) && (_canTAct == 1)) then
	{
		_return = true;
	};
	_return
};

CUP_checkPatchSelf = 
{
	_bleedRate = player getVariable "CUP_bleedRate";
	_canAct = player getVariable "CUP_canAct";
	_lifeState = player getVariable "CUP_lifeState";
	_return = false;
	if ((_lifeState == 0) && (_bleedRate > CUP_checkPatchBleedRate) && ("FirstAidKit" in items player) && (_canAct == 1)) then {_return = true;};
	_return
};

CUP_checkInjectSelf = 
{
	_canAct = player getVariable "CUP_canAct";
	_lifeState = player getVariable "CUP_lifeState";
	_return = false;
	if ((_lifeState == 0) && ("Medikit" in items player) && (__GETC__(life_medicLevel) >= 1) && (_canAct == 1)) then {_return = true;};
	_return
};

CUP_checkBandageSelf = 
{
	_bleedRate = player getVariable "CUP_bleedRate";
	_canAct = player getVariable "CUP_canAct";
	_lifeState = player getVariable "CUP_lifeState";
	_return = false;
	if ((_lifeState == 0) && (_bleedRate > CUP_checkBandageBleedRate) && (__GETC__(life_medicLevel) >= 1) && ("Medikit" in items player) && (_canAct == 1)) then {_return = true;};
	_return
};

CUP_checkBandageTarget = 
{
	_bleedRate = cursorTarget getVariable "CUP_bleedRate";
	_canAct = player getVariable "CUP_canAct";
	_canTAct = cursorTarget getVariable "CUP_canAct";
	_lifeState = player getVariable "CUP_lifeState";
	_return = false;
	if ((_lifeState == 0) && (_bleedRate > CUP_checkBandageBleedRate) && (__GETC__(life_medicLevel) >= 1) && ("Medikit" in items player) && (_canAct == 1) && (_canTAct == 1) && (isPlayer cursorTarget) && ((player distance cursorTarget) < 2)) then {_return = true;};
	_return
};

CUP_checkInjectTarget = 
{
	_canAct = player getVariable "CUP_canAct";
	_canTAct = cursorTarget getVariable "CUP_canAct";
	_lifeState = player getVariable "CUP_lifeState";
	_return = false;
	if ((_lifeState == 0) && ("Medikit" in items player) && (_canAct == 1) && (__GETC__(life_medicLevel) >= 1) && (_canTAct == 1) && (isPlayer cursorTarget) && ((player distance cursorTarget) < 2)) then {_return = true;};
	_return
};

CUP_checkPatchTarget = 
{
	_bleedRate = cursorTarget getVariable "CUP_bleedRate";
	_canAct = player getVariable "CUP_canAct";
	_canTAct = cursorTarget getVariable "CUP_canAct";
	_lifeState = player getVariable "CUP_lifeState";
	_return = false;
	if ((_lifeState == 0) && (_bleedRate > CUP_checkPatchBleedRate) && ("FirstAidKit" in items player) && (_canAct == 1) && (_canTAct == 1) && (isPlayer cursorTarget) && ((player distance cursorTarget) < 2)) then {_return = true;};
	_return
};

CUP_checkCheckOwnVitals = 
{
	_return = false;
	_lifeState = player getVariable "CUP_lifeState";
	if ((_lifestate == 0) && (__GETC__(life_medicLevel) >= 1)) then {_return = true;};
	_return
};

CUP_checkCheckTargetVitals = 
{
	_return = false;
	_lifeState = player getVariable "CUP_lifeState";
	if ((_lifestate == 0) && (__GETC__(life_medicLevel) >= 1) && (cursorTarget isKindOf "Man")) then {_return = true;};
	_return
};

CUP_doDrag = 
{
	player setVariable ["CUP_canAct", 0, true];
	_this setVariable ["CUP_canAct", 0, true];
	player playAction "grabDrag";
	//_this playAction "grabDragged";
	_this attachTo [player, [0, 1, 0]];
	//_this setDir 180;
	sleep 2;
	_id = player addAction ["Drop", {player setVariable ["CUP_canAct", 1, true];}, nil, 39, true, true, "", "true"];
	while {player getVariable "CUP_canAct" == 0} do
	{
		_lifeState = player getVariable "CUP_lifeState";
		_tLifeState = _this getVariable "CUP_lifeState";
		if ((!alive player) || (!alive _target) || (_lifeState != 0) || (_tLifeState == 0)) then
		{
		player setVariable ["CUP_canAct", 1, true];
		};
		sleep 1;
	};
	player playAction "released";
	//_this playAction "released";
	sleep 2;
	detach _this;
	player removeAction _id;
	_this setVariable ["CUP_canAct", 1, true];
};

CUP_doPatchSelf = 
{
	player setVariable ["CUP_canAct", 0, true];
	_bleedRate = player getVariable "CUP_bleedRate";
	player playAction "medic";
	_newBleedRate = _bleedRate/16;
	player setVariable ["CUP_bleedRate", _newBleedRate, true];
	sleep 7;
	player removeItem "FirstAidKit";
	player setVariable ["CUP_canAct", 1, true];
};

CUP_doInjectSelf = 
{
	player setVariable ["CUP_canAct", 0, true];
	_bleedRate = player getVariable "CUP_bleedRate";
	_regenRate = player getVariable "CUP_regenRate";
	player playAction "medic";
	sleep 4;
	_newBleedRate = _bleedRate*4;
	_newRegenRate = _regenRate*2;
	player setVariable ["CUP_bleedRate", _newBleedRate, true];
	player setVariable ["CUP_regenRate", _newRegenRate, true];
	if (CUP_injectFatigue >= 0) then {player setFatigue CUP_injectFatigue;};
	sleep 2;
	player setVariable ["CUP_canAct", 1, true];
};

CUP_doBandageSelf = 
{
	player setVariable ["CUP_canAct", 0, true];
	player playAction "medic";
	player setVariable ["CUP_bleedRate", 0, true];
	sleep 7;
	player removeItem "Medikit";
	player setVariable ["CUP_canAct", 1, true];
};

CUP_doBandageTarget = 
{
	player setVariable ["CUP_canAct", 0, true];
	_this setVariable ["CUP_canAct", 0, true];
	player playAction "medic";
	_this setVariable ["CUP_bleedRate", 0, true];
	sleep 7;
	player removeItem "Medikit";
	player setVariable ["CUP_canAct", 1, true];
	_this setVariable ["CUP_canAct", 1, true];
};

CUP_doPatchTarget = 
{
  player setVariable ["CUP_canAct", 0, true];
  _this setVariable ["CUP_canAct", 0, true];
  _bleedRate = _this getVariable "CUP_bleedRate";
  player playAction "medic";
  _newBleedRate = _bleedRate/16;
  _this setVariable ["CUP_bleedRate", _newBleedRate, true];
  sleep 7;
  player removeItem "FirstAidKit";
  player setVariable ["CUP_canAct", 1, true];
  _this setVariable ["CUP_canAct", 1, true];
};

CUP_doInjectTarget = 
{
  player setVariable ["CUP_canAct", 0, true];
  _this setVariable ["CUP_canAct", 0, true];
  _bleedRate = _this getVariable "CUP_bleedRate";
  _regenRate = _this getVariable "CUP_regenRate";
  player playAction "medic";
  sleep 4;
  _newBleedRate = _bleedRate*4;
  _newRegenRate = _regenRate*2;
  _this setVariable ["CUP_bleedRate", _newBleedRate, true];
  _this setVariable ["CUP_regenRate", _newRegenRate, true];
  if (CUP_injectFatigue >= 0) then {_this setFatigue CUP_injectFatigue;};
  sleep 2;
  player setVariable ["CUP_canAct", 1, true];
  _this setVariable ["CUP_canAct", 1, true];
};

CUP_doCheckOwnVitals = 
{
  _bloodLevel = player getVariable "CUP_bloodLevel";
  _bleedRate = player getVariable "CUP_bleedRate";
  _regenRate = player getVariable "CUP_regenRate"; 
  _armDamage = player getVariable "CUP_armDamage";
  if ("Medikit" in items player) then
  {
    hint format ["Blood level: %1 \n\nBleed rate: %2 \n\nRegen rate: %3 \n\nArm damage: %4", _bloodLevel, _bleedRate, _regenRate, _armDamage];
  }
  else
  {
    _bloodLevelDesc = "Blood level critical.";
    if (_bloodLevel > 1000) then {_bloodLevelDesc = "Blood level is dangerously low."};
    if (_bloodLevel > 2000) then {_bloodLevelDesc = "Blood level is low."};
    if (_bloodLevel > 3000) then {_bloodLevelDesc = "Blood level is moderate."};
    if (_bloodLevel > 4000) then {_bloodLevelDesc = "Blood level is OK."};
    if (_bloodLevel > 5000) then {_bloodLevelDesc = "Blood level is nominal."};
    _bleedRateDesc = "Not bleeding";
    if (_bleedRate > 1) then {_bleedRateDesc = "Minor bleeding"};
    if (_bleedRate > 10) then {_bleedRateDesc = "Bleeding"};
    if (_bleedRate > 20) then {_bleedRateDesc = "Bleeding badly"};
    if (_bleedRate > 40) then {_bleedRateDesc = "Bleeding heavily"};
    if (_bleedRate > 60) then {_bleedRateDesc = "Major bleeding"};
    if (_bleedRate > 80) then {_bleedRateDesc = "Bleed rate critical"};
    _regenRateDesc = "Blood regen normal";
    if (_regenRate > 1) then {_regenRateDesc = "Blood regen mildly accelerated"};
    if (_regenRate > 2.5) then {_regenRateDesc = "Accelerated blood regen"};
    if (_regenRate > 5) then {_regenRateDesc = "Highly accelerated blood regen"};
    if (_regenRate > 7) then {_regenRateDesc = "Dangerously high blood regen rate"};
    if (_regenRate > 10) then {_regenRateDesc = "Extremely high blood regen rate"};
     _armDamageDesc = "Arms uninjured";
    if (_armDamage > 1) then {_armDamageDesc = "Arms slightly injured"};
    if (_armDamage > 20) then {_armDamageDesc = "Arms injured"};
    if (_armDamage > 50) then {_armDamageDesc = "Arms heavily injured"};
    if (_armDamage > 100) then {_armDamageDesc = "Arms critically injured"};
    hint format ["%1\n\n%2\n\n%3\n\n%4", _bloodLevelDesc, _bleedRateDesc, _regenRateDesc, _armDamageDesc];
  };
};

CUP_doCheckTargetVitals = 
{
  if !(isPlayer _this) exitWith {hint format ["Target '%1' is an AI.\nCupMed does not have AI support yet.\n:(", name _this];};
  _bloodLevel = _this getVariable "CUP_bloodLevel";
  _bleedRate = _this getVariable "CUP_bleedRate";
  _regenRate = _this getVariable "CUP_regenRate"; 
  _armDamage = _this getVariable "CUP_armDamage";
  if ("Medikit" in items player) then
  {
    hint format ["Target: %1\n\nBlood level: %2 \n\nBleed rate: %3 \n\nRegen rate: %4 \n\nArm damage: %5", name _this, _bloodLevel, _bleedRate, _regenRate, _armDamage];
  }
  else
  {
    _bloodLevelDesc = "Blood level critical.";
    if (_bloodLevel > 1000) then {_bloodLevelDesc = "Blood level is dangerously low."};
    if (_bloodLevel > 2000) then {_bloodLevelDesc = "Blood level is low."};
    if (_bloodLevel > 3000) then {_bloodLevelDesc = "Blood level is moderate."};
    if (_bloodLevel > 4000) then {_bloodLevelDesc = "Blood level is OK."};
    if (_bloodLevel > 5000) then {_bloodLevelDesc = "Blood level is nominal."};
    _bleedRateDesc = "Not bleeding";
    if (_bleedRate > 1) then {_bleedRateDesc = "Minor bleeding"};
    if (_bleedRate > 10) then {_bleedRateDesc = "Bleeding"};
    if (_bleedRate > 20) then {_bleedRateDesc = "Bleeding badly"};
    if (_bleedRate > 40) then {_bleedRateDesc = "Bleeding heavily"};
    if (_bleedRate > 60) then {_bleedRateDesc = "Major bleeding"};
    if (_bleedRate > 80) then {_bleedRateDesc = "Bleed rate critical"};
    _regenRateDesc = "Blood regen normal";
    if (_regenRate > 1) then {_regenRateDesc = "Blood regen mildly accelerated"};
    if (_regenRate > 2.5) then {_regenRateDesc = "Accelerated blood regen"};
    if (_regenRate > 5) then {_regenRateDesc = "Highly accelerated blood regen"};
    if (_regenRate > 7) then {_regenRateDesc = "Dangerously high blood regen rate"};
    if (_regenRate > 10) then {_regenRateDesc = "Extremely high blood regen rate"};
     _armDamageDesc = "Arms uninjured";
    if (_armDamage > 1) then {_armDamageDesc = "Arms slightly injured"};
    if (_armDamage > 20) then {_armDamageDesc = "Arms injured"};
    if (_armDamage > 50) then {_armDamageDesc = "Arms heavily injured"};
    if (_armDamage > 100) then {_armDamageDesc = "Arms critically injured"};
    hint format ["Target:%1\n\n%2\n\n%3\n\n%4\n\n%5", name _this, _bloodLevelDesc, _bleedRateDesc, _regenRateDesc, _armDamageDesc];
  };
};

CUP_playerInit = {
	//* diag_log "Cupmed Player initiation!";
	// Set variables to starting values
	player setVariable ["CUP_bloodLevel", 5500, true];
	player setVariable ["CUP_bleedRate", 0, true];
	player setVariable ["CUP_regenRate", 1, true];
	player setVariable ["CUP_canAct", 1, true];
	player setVariable ["CUP_lifeState", 0, true];
	player setVariable ["CUP_armDamage", 0, true];
	// Initiate control loop
	[] spawn
	{
		while {alive player} do 
		{
			// Fetching variables
			_bleedRate = player getVariable "CUP_bleedRate";
			_bloodLevel = player getVariable "CUP_bloodLevel";
			_regenRate = player getVariable "CUP_regenRate";
			_lifeState = player getVariable "CUP_lifeState";
			_armDamage = player getVariable "CUP_armDamage";
			// Applying bleed & regen
			_newBloodLevel = _bloodLevel - _bleedRate;
			_newBloodLevel = _newBloodLevel + _regenRate;
			// Simulated blood clot
			_newBleedRate = _bleedRate*CUP_bloodClotRate;
			player setVariable ["CUP_bleedRate", _newBleedRate, true];
			// Upper buffer (maximum blood)
			if (_newBloodLevel > 5500) then
			{
				_newBloodLevel = 5500;
			};
			// Lower buffer (death by bleedout)
			if (_newBloodLevel <= 0) then
			{
				player setDamage 1;
			};
			// Regen rate handling
			if (_regenRate > 1) then
			{
				_newRegenRate = _regenRate - CUP_regenRateRecover;
				// Lower buffer (minimum)
				if (_newRegenRate < 1) then
				{
					_newRegenRate = 1;
				};
				// Overdose unconsciousness
				if ((_newRegenRate > CUP_maxRegenRate) && (_lifeState != 2)) then
				{
					"overdose" spawn CUP_knockout;
				};
				player setVariable ["CUP_regenRate", _newRegenRate, true];
			};
			// Bleedout unconsciousness
			if (!((_bloodLevel > 2000) && (_regenRate > _bleedRate)) && (_lifeState == 0)) then
			{
				_unconcsChance = ((1 - (_newBloodLevel-1000)/1000)*((_bleedRate - _regenRate)/10))*CUP_bleedUnconcsCoeff;
				_unconcsRoll = random 1;
				if (_unconcsRoll > (1 - _unconcsChance)) then
				{
					"bleed" spawn CUP_knockout;
				};
			};      
			// Arm damage effects
			if (_armDamage > 0) then
			{
				// [Actual effects to go here - WIP]
				// Regen
				_newArmDamage = _armDamage - _regenRate;
				player setVariable ["CUP_armDamage", _newArmDamage]; 
			};
			
			player setVariable ["CUP_bloodLevel", _newBloodLevel, true];
			//* diag_log format ["Blood level: %1 Bleed rate: %2 Regen rate: %3 Arm damage: %4", _newBloodLevel, _bleedRate, _regenRate, _armDamage];
			sleep 1;
			[] call life_fnc_hudUpdate;
		};  
	};	
};
