/*
	File: fn_saveGear.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Saves the player / cops gear in a formatted array.
*/
private["_allowedItems","_primary","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_curWep"];

//Pre-approved weapons / attachments
_allowedItems =
[
	"arifle_sdar_F",
	"hgun_P07_snds_F",
	"hgun_P07_F",
	"SMG_02_ACO_F",
	"arifle_MXC_F",
	"hgun_ACPC2_F",
	"arifle_MX_SW_F",
	"arifle_MX_F",
	"arifle_MXM_F",
	"srifle_LRR_F",
	"srifle_GM6_F",
	"Binocular",
	"Rangefinder",
	"ItemGPS",
	"FirstAidKit",
	"Medikit",
	"NVGoggles",
	"MineDetector",
	"acc_flashlight",
	"muzzle_snds_L",
	"muzzle_snds_H",
	"muzzle_snds_H_MG",
	"muzzle_snds_acp",
	"muzzle_snds_B",
	"muzzle_snds_M",
	"30Rnd_9x21_Mag",
	"9Rnd_45ACP_Mag",
	"30Rnd_65x39_caseless_mag",
	"100Rnd_65x39_caseless_mag",
	"7Rnd_408_Mag",
	"5Rnd_127x108_APDS_Mag",
	"5Rnd_127x108_Mag",
	"optic_SOS",
	"optic_Aco",
	"optic_Hamr",
	"optic_tws",
	"SmokeShellBlue",
	"MiniGrenade",
	"U_Rangemaster",
	"U_B_CombatUniform_mcam_tshirt",
	"U_B_survival_uniform",
	"U_B_CombatUniform_mcam_worn",
	"U_B_CombatUniform_mcam_worn",
	"U_B_CombatUniform_wdl",
	"U_I_GhillieSuit",
	"H_HelmetB_plain_mcamo",
	"H_Booniehat_mcamo",
	"H_MilCap_mcamo",
	"H_PilotHelmetFighter_B",
	"H_HelmetSpecB_blk",
	"V_PlateCarrierIA1_dgtl",
	"V_RebreatherB",
	"V_TacVestIR_blk",
	"B_Kitbag_cbr",
	"B_FieldPack_cbr",
	"B_AssaultPack_cbr",
	"B_Bergen_sgg",
	"B_Carryall_cbr",
	"launch_I_Titan_F",
	"launch_I_Titan_short_F",
	"Titan_AT",
	"Titan_AA"
];

//Old format / code
_primary = primaryWeapon player;
_handgun = handGunWeapon player;
_magazines = [];
_uniform = uniform player;
_vest = vest player;
_backpack = backpack player;
_items = assignedItems player;
_primitems = primaryWeaponItems player;
_secitems = secondaryWeaponItems player;
_handgunitems = handGunItems player;
_uitems = [];
_vitems = [];
_bitems = [];

if(!(_primary in _allowedItems)) then {_primary = ""};
if(!(_handgun in _allowedItems)) then {_handgun = ""};
if(_uniform != "") then {{_uitems set[count _uitems,_x];} foreach (uniformItems player);};
if(_vest != "") then {{_vitems set[count _vitems,_x];} foreach (vestItems player);};
if(_backpack != "") then {{_bitems set[count _bitems,_x];} foreach (backPackItems player);};

if(goggles player != "") then { _items set[count _items, goggles player]; };
if(headgear player != "") then { _items set[count _items, headgear player]; };
if(count (primaryWeaponMagazine player) > 0) then
{
	{
		_magazines set[count _magazines,_x];
	} foreach (primaryWeaponMagazine player);
};

if(count (handgunMagazine player) > 0) then
{
	{
		_magazines set[count _magazines,_x];
	} foreach (handgunMagazine player);
};

//Hard code for Laser Desigantor batteries
_curWep = currentWeapon player;
if("Laserdesignator" in assignedItems player) then
{
	player selectWeapon "Laserdesignator";
	if(currentMagazine player != "") then {_magazines set[count _magazines,(currentMagazine player)];};
};

player selectWeapon _curWep;

cop_gear = [_primary,_handgun,_magazines,_uniform,_vest,_backpack,_items,_primitems,_secitems,_handgunitems,_uitems,_vitems,_bitems];