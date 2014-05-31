
private ["_userPlaylist", "_keyPlay", "_keyNext", "_keyPre", "_keyVolUp", "_keyVolDown", "_CLAY_CarRadio_KeyPressed"];

sleep 0.1;
#include "userconfig\CLAY_CarRadio\CLAY_CarRadio.hpp";

CLAY_CarRadio_KeyPlay    = _keyPlay;
CLAY_CarRadio_KeyNext    = _keyNext;
CLAY_CarRadio_KeyPre     = _keyPre;
CLAY_CarRadio_KeyVolUp   = _keyVolUp;
CLAY_CarRadio_KeyVolDown = _keyVolDown;

CLAY_CarRadio_KeyPressedCode = compile preprocessFile "carradio\scripts\key.sqf";
_CLAY_CarRadio_KeyPressed = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call CLAY_CarRadio_KeyPressedCode"];

If (isNil "CLAY_RadioAddVehicles") Then {CLAY_RadioAddVehicles = ["B_Heli_Light_01_F","I_Heli_Transport_02_F","O_Heli_Light_02_unarmed_F","B_Heli_Transport_01_camo_F","I_Heli_light_03_unarmed_F","B_Truck_01_mover_F","B_Truck_01_box_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_Repair_F","B_Truck_01_ammo_F","B_Truck_01_medical_F","B_Truck_01_fuel_F","O_Truck_03_device_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_ammo_F","O_Truck_03_repair_F","O_Truck_03_medical_F","O_Truck_03_fuel_F","I_Truck_02_transport_F","O_Truck_02_transport_F","I_Truck_02_covered_F","O_Truck_02_covered_F","I_Truck_02_ammo_F","O_Truck_02_ammo_F","I_Truck_02_box_F","O_Truck_02_box_F","I_Truck_02_medical_F","O_Truck_02_medical_F","I_Truck_02_fuel_F","O_Truck_02_fuel_F","B_G_Van_01_transport_F","C_Van_01_transport_F","C_Van_01_box_F","B_G_Van_01_fuel_F","C_Van_01_fuel_F","B_G_Offroad_01_F","C_Offroad_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","B_Quadbike_01_F","C_SUV_01_F","B_G_Offroad_01_armed_F","I_Boat_Transport_01_F","O_Boat_Transport_01_F","B_G_Boat_Transport_01_F","B_Boat_Transport_01_F","C_Boat_Civil_01_F","C_Rubberboat","B_SDV_01_F"]};
If (isNil "CLAY_RadioNoVehicles") Then {CLAY_RadioNoVehicles = []};
If (isNil "CLAY_RadioShowTooltips") Then {CLAY_RadioShowTooltips = false};

_trigger1 = createTrigger ["EmptyDetector", [0,0,0]];
_trigger1 setTriggerArea [0, 0, 0, false];
_trigger1 setTriggerActivation ["NONE", "PRESENT", true];
_trigger1 setTriggerStatements ["(('Car' countType [(vehicle player)] > 0) || (typeOf (vehicle player) in CLAY_RadioAddVehicles)) && !(typeOf (vehicle player) in CLAY_RadioNoVehicles)", "CLAY_RadioVeh = vehicle player; CLAY_ID_RADIO = CLAY_RadioVeh addAction ['Car Radio','carradio\scripts\radio.sqf'];", "CLAY_RadioEndTimer = true; CLAY_RadioPlaying = false; playMusic ''; CLAY_RadioVeh removeAction CLAY_ID_RADIO; CLAY_RadioVeh = nil;"];


CLAY_RadioPlaying = false;
CLAY_RadioEndTimer = true;

CLAY_RadioElectro = 
[
	["Copenhagen","Figures in Motion - Copenhagen",215],
	["Spiders","Oursvince - Spiders",264],
	["Sexdrugsnrocknroll","The Easton Ellises - Sexdrugsandrocknroll",233],
	["Divergence","The Black Parrot - Divergence",233]
];

CLAY_RadioMetal = 
[
	["Heroines","Diablo Swing Orchestra - Heroines",321],
	["Subliminalpestilence","Daniel Bautista - Subliminal Pestilence",380],
	["Whoreofbabylon","Sons of Sin - Whore of Babylon",211]
];

CLAY_RadioPop = 
[
	["Breakout","Asaf Productions - Breakout",218],
	["Nodoctor","Ay14ice - No doctor",203],
	["Iwannabe","Quentin Hannappe - I wanna be",152],
	["Sweet","Tamara Laurel - Sweet",214],
	["Midnightmind","Lyonn - Midnight Mind",224]
];

CLAY_RadioPlayList = CLAY_RadioElectro;

CLAY_RadioTrack = 0;
CLAY_RadioVol = 0.5;
CLAY_RadioVolStep = 10;

CLAY_RadioSrc = 1;
CLAY_RadioRepeat = false;
CLAY_RadioRandom = false;
CLAY_RadioKeyColor = 1;
CLAY_RadioDisplay = 9;
CLAY_RadioColor = "Black";
