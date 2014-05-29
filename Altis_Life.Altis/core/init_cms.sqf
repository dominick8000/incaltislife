// CUP MEDIC SYSTEM

CUP_debugHintBool = true; // Defines whether or not to show the debug hint. 

CUP_instantUnconcsCoeff = 1; // Coefficient for chance to be instantly knocked out upon being hit. 
CUP_bleedUnconcsCoeff = 1; // Coefficient for chance to bleed out into unconsciousness. 
CUP_unconcsAutorecoverCoeff = 1; // Coefficient for chance to autorecover from standard unconsciousness (when bleeding is stopped). 
CUP_bleedCoeff = 12; // Coefficient for bleeding added when hit. 
CUP_instantBleedCoeff = 400; // Coefficient for instant blood loss upon being hit. 
CUP_bloodClotRate = 0.99; // Blood clot rate (bleed rate is multiplied by this each second). 
CUP_maxRegenRate = 8; // The upper limit for regen rate. If the regen rate goes higher than this, you will go into overdose-unconsciousness. 
CUP_regenRateRecover = 0.02; // Rate at which the regen rate returns to normal
CUP_regenRateRecoverUnconcs = 0.08; // Additional recovery for regen rate when unconscious due to overdose. 
CUP_overdoseUnconcsRecoverChance = 0.5; // The chance each second for an overdose-unconscious player to recover (after returning to below the max regen rate). 
CUP_unconcsRecoverFatigue = 1; // setFatigue value for after recovering from unconsciousness. Set to any negative to disable. 
CUP_injectFatigue = 0.8; // setFatigue value for using an injection. Set to any negative to disable. 
CUP_checkPatchBleedRate = 1; // Bleed rate must be greater than this before you can use a patch. 
CUP_checkBandageBleedRate = 5; // Bleed rate must be greater than this before you can use a bandage. 
CUP_minReviveTime = 5; // Minimum possible time spent to revive someone. 
CUP_maxReviveTime = 5; // Maximum additional time spent to revive someone (note: this is not the actual maximum. That would be the above plus this.) 
CUP_recoverControlsDelay = 3; // Delay between the world fading back in and control being handed back to the player. 
CUP_involuntaryFireChance = 0.2; // Chance of involuntary weapon discharge upon being hit in the arm. (Currently disabled)
CUP_armDamageCoeff = 1; // Multiplier for the damage added to arms upon being hit in the arms


call compile preprocessFileLineNumbers "core\medical\cupmed_functions.sqf";
waitUntil {player == player};
[] spawn CUP_playerInit;

diag_log "CupMed initialised";