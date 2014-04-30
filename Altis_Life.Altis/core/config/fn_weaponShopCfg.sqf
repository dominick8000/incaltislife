#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			default
			{
				["Altis Cop Shop",
					[
						["arifle_sdar_F","Taser Rifle",20000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["hgun_P07_F",nil,7500],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["muzzle_snds_L",nil,650],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["16Rnd_9x21_Mag",nil,50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 2): {"You are not at a patrol officer rank!"};
			default
			{
				["Altis Patrol Officer Shop",
					[
						["SMG_02_ACO_F",nil,15000],
						["MineDetector",nil,1000],
						["acc_flashlight",nil,750],
						["optic_Holosight",nil,1200],
						["optic_Arco",nil,2500],
						["muzzle_snds_H",nil,2750],
						["30Rnd_9x21_Mag",nil,250]
					]
				];
			};
		};
	};

	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 3): {"You are not at a sergeant rank!"};
			default
			{
				["Altis Sergeant Officer Shop",
					[
						["SMG_02_ACO_F",nil,15000],
						["arifle_MXC_F",nil,30000],
						["optic_Arco",nil,2500],
						["muzzle_snds_H",nil,2750],
						["30Rnd_65x39_caseless_mag",nil,100],
						["30Rnd_9x21_Mag",nil,60],
						["9Rnd_45ACP_Mag",nil,200],
						["SmokeShellBlue","Traenengas",200],
						["MiniGrenade","Flashbang",200]
					]
				];
			};
		};
	};


	case "cop_gsg":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 6): {"You are not at a GSG rank!"};
			default
			{
				["Altis GSG Shop",
					[
						["SMG_02_ACO_F",nil,15000],
						["30Rnd_9x21_Mag",nil,60],
						["hgun_ACPC2_F",nil,17500],
						["9Rnd_45ACP_Mag",nil,200],
						["arifle_MX_F",nil,30000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["arifle_MX_SW_F",nil,30000],
						["100Rnd_65x39_caseless_mag",nil,100],
						["arifle_MXM_F",nil,30000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["muzzle_snds_H",nil,2750],
						["muzzle_snds_H_MG","MG Schalldaempfer",2750],
						["muzzle_snds_acp",nil,2750],
						["muzzle_snds_B",nil,2750],
						["muzzle_snds_L",nil,2750],
						["muzzle_snds_M",nil,2750],
						["srifle_LRR_F","M320",50000],
						["7Rnd_408_Mag","M320 Munition",1000],
						["srifle_GM6_F","GM6 Lynx",50000],
						["5Rnd_127x108_APDS_Mag","Lynx APDS Munition",1000],
						["5Rnd_127x108_Mag","Lynx Munition",1000],
					  	["launch_I_Titan_F","Anti Air Werfer",100000],
						["Titan_AA ","Anti Air Rakete",20000],
						["launch_I_Titan_short_F","Anti Tank Werfer",100000],
						["Titan_AT","Anti Tank Rakete",100000],
						["Rangefinder",nil,1000],
						["optic_SOS","Scharfuetzenvisier",1000],
						["optic_Aco",nil,1000],
						["optic_Hamr",nil,1000],
						["optic_tws",nil,1000],
						["SmokeShellBlue","Traenengas",200],
						["MiniGrenade","Flashbang",200]
					]
				];
			};
		};
	};
	

	case "cop_chief":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 7): {"You are not at a chief rank!"};
			default
			{
				["Altis Chief Shop",
					[
						["SMG_02_ACO_F",nil,15000],
						["30Rnd_9x21_Mag",nil,60],
						["hgun_ACPC2_F",nil,17500],
						["9Rnd_45ACP_Mag",nil,200],
						["arifle_MX_F",nil,30000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["arifle_MX_SW_F",nil,30000],
						["100Rnd_65x39_caseless_mag",nil,100],
						["arifle_MXM_F",nil,30000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["muzzle_snds_H",nil,2750],
						["muzzle_snds_H_MG","MG Schalldaempfer",2750],
						["muzzle_snds_acp",nil,2750],
						["muzzle_snds_B",nil,2750],
						["muzzle_snds_L",nil,2750],
						["muzzle_snds_M",nil,2750],
						["srifle_LRR_F","M320",50000],
						["7Rnd_408_Mag","M320 Munition",1000],
						["srifle_GM6_F","GM6 Lynx",50000],
						["5Rnd_127x108_APDS_Mag","Lynx APDS Munition",1000],
						["5Rnd_127x108_Mag","Lynx Munition",1000],
						["Rangefinder",nil,1000],
						["optic_SOS","Scharfuetzenvisier",1000],
						["optic_Aco",nil,1000],
						["optic_Hamr",nil,1000],
						["optic_tws",nil,1000],
						["SmokeShellBlue","Traenengas",200],
						["MiniGrenade","Flashbang",200]
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a cop!"};
			case (!license_civ_rebel): {"You don't have a Rebel training license!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["arifle_TRG20_F",nil,25000],
						["30Rnd_556x45_Stanag",nil,100],
						["SMG_01_F",nil,10000],
						["30Rnd_45ACP_Mag_SMG_01",nil,10000],
						["srifle_EBR_F",nil,10000],
						["20Rnd_762x51_Mag",nil,100],
						["launch_I_Titan_F","Anti Air Werfer",100000],
						["Titan_AA ","Anti Air Rakete",20000],
						["launch_I_Titan_short_F","Anti Tank Werfer",100000],
						["Titan_AT","Anti Tank Rakete",100000]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a cop!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Rook40_F",nil,6500],
						["hgun_Pistol_heavy_02_F",nil,9850],
						["hgun_ACPC2_F",nil,11500],
						["hgun_PDW2000_F",nil,20000],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,4900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
		};
	};
	
	case "donator":
	{
		switch(true) do
		{
			case (__GETC__(life_donator) == 0): {"You are not a donator!"};
			case (__GETC__(life_donator) == 1):
			{
				["STS Donator Shop Tier 1",
					[
						["hgun_Rook40_F",nil,750],
						["hgun_PDW2000_F",nil,6500],
						["optic_ACO_grn_smg",nil,750],
						["ToolKit",nil,50],
						["itemgps",nil,50],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};

			case (__GETC__(life_donator) == 2):
			{
				["STS Donator Shop Tier 2",
					[
						["hgun_Rook40_F",nil,750],
						["hgun_PDW2000_F",nil,6500],
						["arifle_MK20C_plain_F",nil,25000],
						["optic_ACO_grn_smg",nil,750],
						["NVGoggles",nil,350],
						["ToolKit",nil,50],
						["itemgps",nil,50],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75],
						["30Rnd_556x45_Stanag",nil,125]
					]
				];
			};

			case (__GETC__(life_donator) >= 3):
			{
				["STS Donator Shop Tier 3",
					[
						["hgun_Rook40_F",nil,500],
						["hgun_PDW2000_F",nil,6500],
						["hgun_pistol_heavy_01_F",nil,5850],
						["arifle_Mk20C_plain_F",nil,25000],
						["optic_ACO_grn_smg",nil,750],
						["optic_MRCO",nil,10000],
						["NVGoggles",nil,350],
						["ToolKit",nil,50],
						["itemgps",nil,50],
						["FirstAidKit",nil,25],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75],
						["11Rnd_45ACP_Mag",nil,85],
						["30Rnd_556x45_Stanag",nil,125]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Altis General Store",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};
};
