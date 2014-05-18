/*




*/

private["_curTarget"];
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_text = "";
_injuries = _curTarget getVariable "Injuries";
if (isNull _injuries) then {
	_text = "Keine Verletzungen";
} else {
	_text = "Es wurden die folgenden Verletzungen festgestellt:";
	if(["bl_body"] in _injuries) then {
		_text = _text + "\n Blutverlust Koerper";
	};
	if(["bl_hand_l"] in _injuries) then {
		_text = _text + "\n Blutverlust linke Hand";
	};
	if(["bl_hand_r"] in _injuries) then {
		_text = _text + "\n Blutverlust rechte Hand";
	};
	if(["bl_leg_l"] in _injuries) then {
		_text = _text + "\n Blutverlust linkes Bein";
	};
	if(["bl_leg_r"] in _injuries) then {
		_text = _text + "\n Blutverlust rechtes Bein";
	};	
	if(["headshot"] in _injuries) then {
		_text = _text + "\n Kopfschutz";
	};
};
hint _text;