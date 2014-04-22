/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	case "oilu": {30};
	case "oilp": {20};
	case "heroinu": {6};
	case "heroinp": {4};
	case "cannabis": {5};
	case "marijuana": {3};
	case "apple": {1};
	case "water": {1};
	case "rabbit": {1};
	case "salema": {2};
	case "ornate": {2};
	case "mackerel": {4};
	case "tuna": {6};
	case "mullet": {4};
	case "catshark": {6};
	case "turtle": {4};
	case "fishing": {2};
	case "turtlesoup": {2};
	case "donuts": {1};
	case "coffee": {1};
	case "fuelE": {2};
	case "fuelF": {5};
	case "money": {0};
	case "pickaxe": {2};
	case "copperore": {12};
	case "ironore": {18};
	case "copper_r": {6};
	case "iron_r": {9};
	case "sand": {3};
	case "salt": {3};
	case "salt_r": {1};
	case "glass": {1};
	case "diamond": {10};
	case "diamondc": {5};
	case "cocaine": {6};
	case "cocainep": {3};
	case "spikeStrip": {15};
	case "rock": {20};
	case "cement": {10};
	case "goldbar": {12};
	default {1};
};
