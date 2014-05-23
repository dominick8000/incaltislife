/*

	Player clicked arrest/ok

*/

private ["_time"];

if(playerSide != west) exitWith {};
if(isNil "life_pInact_curTarget") exitWith {hint "arrest target."};

//Get minutes
_time = ctrlText 1400;


if(! ([_time] call fnc_isnumber)) exitWith
{
	hint "You must enter a number.";
};

_time = parseNumber _time; //requested number
_time = round _time;

if(_time < 5 || _time > 60) exitWith { hint "You can put jail people just between 5-60 minutes!"; };

closeDialog 0; 
[life_pInact_curTarget, _time] call life_fnc_arrestAction;