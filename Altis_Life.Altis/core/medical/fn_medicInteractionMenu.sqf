/*
	File: fn_copInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various cop actions towards another player.
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;}; //Bad side check?
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
life_pInact_curTarget = _curTarget;

//Set Unrestrain Button
_Btn1 ctrlSetText localize "STR_pInAct_Diagnose";
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";

//Set Check Licenses Button
if((_curTarget getVariable["Medicated",false])) then {
	_Btn2 ctrlSetText localize "STR_pInAct_Medicate";
	_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopMedication; [life_pInact_curTarget] call life_fnc_medicInteractionMenu;";
} else {
	_Btn2 ctrlSetText localize "STR_pInAct_MedicateEnd";
	_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_medicateAction; closeDialog 0;";
};

if((_curTarget getVariable["Medicated",false]) OR !alive _curTarget) then {
	_Btn3 ctrlSetText localize "STR_pInAct_StopBleeding";
	_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopBleeding; [life_pInact_curTarget] call life_fnc_medicInteractionMenu;";
} else {
	_Btn3 ctrlEnable false;
};
	