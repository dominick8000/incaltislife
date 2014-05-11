class DefaultEventHandler;
class CfgPatches
{
	class life_headless_client
	{
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F"};
		fileName = "life_hc.pbo";
		author[]= {"Tonic"}; 
	};
};

class CfgFunctions
{
	class MySQL_Database
	{
		tag = "DB";
		class MySQL
		{
			file = "\life_hc\MySQL";
			class insert{};
			class query{};
			class update{};
			class numberSafe {};
			class formatArray {};
			class mresArray {};
			class mresToArray {};
			class addQueue {};
			class processQueue {};
			class queueManagement {};
			class insertVehicle {};
			class queryVehicle {};
			class queryVehicles {};
			class bool{};
			class mresString {};
		};
	};
	
	class Life_Headless_Client
	{
		tag = "HC";
		class Headless_Functions
		{
			file = "\life_hc\Functions";
			class query {};
			class insert {};
			class update {};
		};
		
		class Headless_Startup
		{
			file = "life_hc";
			class initHC {preInit = 1;};
		};
	};
};