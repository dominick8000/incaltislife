#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret set[count _ret,["U_Rangemaster","Cop Uniform",25]];
		if(__GETC__(life_coplevel) > 4) then
		{
			_ret set[count _ret,["U_B_CombatUniform_sgg",nil,350]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_ret set[count _ret,["U_B_CombatUniform_sgg",nil,350]];
			_ret set[count _ret,["U_B_SpecopsUniform_sgg",nil,350]];
			_ret set[count _ret,["U_I_OfficerUniform",nil,350]];
		};
	};
	
	//Hats
	case 1:
	{	
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret set[count _ret,["H_MilCap_mcamo",nil,550]];
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_ret set[count _ret,["H_MilCap_mcamo",nil,550]];
			_ret set[count _ret,["H_HelmetB_plain_blk",nil,550]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_ret set[count _ret,["H_MilCap_mcamo",nil,550]];
			_ret set[count _ret,["H_HelmetB_plain_blk",nil,550]];
			_ret set[count _ret,["H_HelmetSpecB_blk",nil,550]];
			_ret set[count _ret,["H_Beret_brn_SF",nil,550]];
		};
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		_ret set[count _ret,["V_Rangemaster_belt",nil,350]];
		if(__GETC__(life_coplevel) > 4) then
		{
			_ret set[count _ret,["V_BandollierB_blk",nil,550]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_ret set[count _ret,["V_TacVest_blk",nil,350]];
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Kitbag_cbr",nil,800],
			["B_FieldPack_cbr",nil,500],
			["B_AssaultPack_cbr",nil,700],
			["B_Bergen_sgg",nil,2500],
			["B_Carryall_cbr",nil,3500],
			["B_Parachute",nil,3500]
		];
	};
};

_ret;