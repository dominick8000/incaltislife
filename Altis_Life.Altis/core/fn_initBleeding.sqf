/*
	Author: super mSc!



*/

//* _script = {
//* 	while {true} do
//* 	{
//* 		sleep 60;
//* 		_bleeding = player getVariable "bleeding";
//* 		life_my_blood = life_my_blood-round(_bleeding);	
//* 		if (life_my_blood<0) then {
//* 			player setDamage 1;		
//* 			life_my_blood = 0;
//* 		};
//* 		diag_log format["Bleeding: %1 Blood: %2",_bleeding, life_my_blood];
//* 		[] call life_fnc_hudUpdate;
//* 	};
//* };
//* [] spawn _script;