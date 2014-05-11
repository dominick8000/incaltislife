/*
	File: initHC.sqf
	
	Description:
	Initializes key parts for the haedless client to function as a
	receiver for all player-based SQL updates.
*/
server_query_running = false;
life_DB_queue = [];

//Start up the update queue management.
[] spawn DB_fnc_queueManagement;