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

// network macros
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
#macro psyncarray [buffer_u16, buffer_bool, buffer_s16, buffer_s16, buffer_u32, buffer_u8, buffer_string, buffer_s8, buffer_s16, buffer_string, buffer_string, buffer_u8, buffer_u8]
