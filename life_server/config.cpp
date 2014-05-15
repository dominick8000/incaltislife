class DefaultEventhandlers;
class CfgPatches 
{
	class life_server
	{
		units[] = {"C_man_1"};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
		fileName = "life_server.pbo";
		author[]= {"TAW_Tonic"}; 
	};
};

class CfgFunctions
{
	class BIS_Overwrite
	{
		tag = "BIS";
		class MP
		{
			file = "\life_server\Functions\MP";
			class initMultiplayer{};
			class call{};
			class spawn{};
			class execFSM{};
			class execVM{};
			class execRemote{};
			class addScore{};
			class setRespawnDelay{};
			class onPlayerConnected{};
			class initPlayable{};
			class missionTimeLeft{};
		};
	};
	class SpyGlass
	{
		tag = "SPY";
		class Functions
		{
			file = "\life_server\Functions\SPYGLASS";
			class cmdMenuCheck{};
			class cookieJar{};
			class menuCheck{};
			class notifyAdmins{};
			class observe{};
			class payLoad{};
			class variableCheck{};
			class initSpy {preInit=1;};
		};
	};
	class MySQL_Database
	{
		tag = "DB";
		class MySQL
		{
			file = "\life_server\Functions\MySQL";
			class numberSafe {};
			class mresArray {};
			class queryRequest{};
			class asyncCall{};
			class insertRequest{};
			class updateRequest{};
			class mresToArray {};
			class insertVehicle {};
			class bool{};
			class mresString {};
		};
	};
	
	class Life_System
	{
		tag = "life";
		class Wanted_Sys
		{
			file = "\life_server\Functions\WantedSystem";
			class wantedFetch {};
			class wantedPerson {};
			class wantedBounty {};
			class wantedTicket {};
			class wantedPardon {};
			class wantedRemove {};
			class wantedAdd {};
			class wantedPunish {};
		};
		
		class Jail_Sys
		{
			file = "\life_server\Functions\Jail";
			class jailSys {};
		};
		
		class Client_Code
		{
			file = "\life_server\Functions\Client";
			class safeOpen {};
			class safeInventory {};
			class safeTake {};
			class safeStore {};
		};
	};
	
	class TON_System
	{
		tag = "TON";
		class Systems
		{
			file = "\life_server\Functions\Systems";
			class managesc {};
			class cleanup {};
			class timeStamp {};
			class huntingZone {};
			class getID {};
			class vehicleCreate {};
			class vehicleDead {};
			class spawnVehicle {};
			class addVehicle2Chain {};
			class getVehicles {};
			class vehicleStore {};
			class vehicleDelete {};
			class spikeStrip {};
			class robReserve {};
			class robberyState {};
			class logIt {};
			class federalUpdate {};
			class isUIDActive {};
			class chopShopSell {};
			class silentSync {};
			class clientDisconnect {};
		};
	};
	class BRUUUDIS_System {

        tag = "BRUUUDIS";       
        class Bruuudis
        {
            file = "\life_server\Functions\bruuudis";
            class deleteHouse {};
            class insertHouse {};
            class queryHouses {};
            class queryPlayerHouses {};
            class updateHouseStorage {};
            class updateHouseWeaponStorage {};
        };
    };
	class msc_System {
		tag = "MSC";
		class msc
		{
			file = "\life_server\Functions\msc";
			class insertGang{};
			class queryGangs{};
			class queryPlayerGang{};
			class insertGangPlayer{};
			class removeGangPlayer{};
			class removeGang{};
			class updateGangLeader{};
			class updateGanglock{};
			class gatherZoneControl{};
			class updateZoneState{};
		};
	};
};

class CfgVehicles
{
	class Car_F;
	class CAManBase;
	class Civilian;
	class Civilian_F : Civilian
	{
		class EventHandlers;
	};
	
	class C_man_1 : Civilian_F
	{
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\fix_headgear.sqf""";
		};
	};
	
	class Offroad_01_base_F: Car_F
	{
		class EventHandlers;
	};
	
	class Hatchback_01_base_F: Car_F
	{
		class EventHandlers;
	};
	class SUV_01_base_F: Car_F
	{
		class EventHandlers;
	};
	
	class C_Hatchback_01_sport_F: Hatchback_01_base_F
	{
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "C_Hatchback_01_sport_F";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		displayName = "$STR_A3_CfgVehicles_C_car_sport0";
		hiddenSelectionsTextures[] = {"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT01_CO.paa"};
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\cars\hatchback\color.sqf""";
		};
	};
	
	class C_SUV_01_F: SUV_01_base_F
	{
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "C_SUV_01_F";
		scope = 2;
		crew = "C_man_1";
		typicalCargo[] = {"C_man_1"};
		side = 3;
		faction = "CIV_F";
		accuracy = 1.25;
		hiddenSelectionsTextures[] = {"\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_CO.paa"};
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\cars\SUV\color.sqf""";
		};
	};
	class C_Hatchback_01_F: Hatchback_01_base_F
	{
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "C_Hatchback_01_F";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		hiddenSelectionsTextures[] = {"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_CO.paa"};
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\cars\hatchback\color.sqf""";
		};
	};
	
	class C_Offroad_01_F: Offroad_01_base_F
	{
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "C_Offroad_01_F";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		accuracy = 1.25;
		class Turrets{};
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\cars\offroad\color.sqf""";
		};
	};
};