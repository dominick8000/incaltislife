_para = createVehicle ["B_Parachute_02_F", [0,0,100], [], 0, ""];
_para setPosATL (player modelToWorld[0,0,100]);
_veh = createVehicle ["B_supplyCrate_F", [0,0,80], [], 0, ""];
_veh attachTo [_para,[0,0,0]]; 

// Land safely
WaitUntil {((((position _veh) select 2) < 1) || (isNil "_para"))};
detach _veh;
_veh SetVelocity [0,0,-5];           
sleep 0.3;
_veh setPos [(position _veh) select 0, (position _veh) select 1, 1];
_veh SetVelocity [0,0,0];