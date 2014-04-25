/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {1500}; //Drivers License cost
	case "boat": {1000}; //Boating license cost
	case "pilot": {35000}; //Pilot/air license cost
	case "gun": {10000}; //Firearm/gun license cost
	case "dive": {2000}; //Diving license cost
	case "oil": {37500}; //Oil processing license cost
	case "cair": {15000}; //Cop Pilot License cost
	case "swat": {35000}; //Swat License cost
	case "cg": {8000}; //Coast guard license cost
	case "heroin": {35275}; //Heroin processing license cost
	case "marijuana": {30000}; //Marijuana processing license cost
	case "medmarijuana": {1500}; //Medical Marijuana processing license cost
	case "gang": {100000}; //Gang license cost
	case "rebel": {500000}; //Rebel license cost
	case "truck": {10000}; //Truck license cost
	case "diamond": {45000};
	case "salt": {10000};
	case "cocaine": {68000};
	case "sand": {30000};
	case "iron": {50000};
	case "copper": {10000};
	case "cement": {35000};
};