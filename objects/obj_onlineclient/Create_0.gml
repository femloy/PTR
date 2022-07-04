if live_call() return live_result;

depth = -7;

ip = "127.0.0.1";
port = "6400";
username = "";

client = -1;
connected = false;
client_buffer = buffer_create(1024, buffer_fixed, 1);
socket = -1;

packet = false;
gamemode = 0;
localpaused = false;

global.racerank = 0;

// figure out what to do with network data
enum network
{
	player_hello,
	player_join,
	player_add,
	player_leave,
	player_sync,
	sync_var,
	change_player_room,
	close_server,
	error_disconnect,
	race_start,
	kill_object
}
