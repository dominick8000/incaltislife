/*
	File: fn_gatherOil.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gathers oil, needs to be revised and changed.
*/
private["_sum"];
_sum = ["oilu",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0  && (vehicle player == player)) then
{
	life_action_in_use = true;
	titleText["Gathering Oil...","PLAIN"];
	sleep 4;
	if(([true,"oilu",_sum] call life_fnc_handleInv)) then
	{
		titleText["You have gathered some oil.","PLAIN"];
	};
}
	else
{
	hint "Your inventory space is full.";
};

if(_sum > 0 && (typeOf (vehicle player) == "O_Truck_03_device_F")) then
{
	life_action_in_use = true;
	titleText["Starting to Mine...","PLAIN"];
	titleFadeOut 5;
	sleep 5;
	disableSerialization;

	_ctrl = "oilu";
	_num = 10;
	[[vehicle player, "tempestwork",100],"life_fnc_playSound",true,false] spawn BIS_fnc_MP;
	titleText["Turing on","PLAIN"]; sleep 5;
	_totalWeight = [vehicle player] call life_fnc_vehicleWeight;
	titleText["Gathering...","PLAIN"]; sleep 60;
	_itemWeight = ([_ctrl] call life_fnc_itemWeight) * _num;
	_veh_data = vehicle player getVariable ["Trunk",[[],0]];
	titleText["Loading trunk","PLAIN"]; sleep 5;
	_inv = _veh_data select 0;

	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint "Device is full"};

	_index = [_ctrl,_inv] call fnc_index;
	if(_index == -1) then
	{
		_inv set[count _inv,[_ctrl,_num]];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	vehicle player setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	titleText["The job is done.","PLAIN"];
};

life_action_in_use = false;