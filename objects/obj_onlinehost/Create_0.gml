if live_call() return live_result;

port = "6400";
max_clients = "5";

socket_list = ds_list_create(); // list of client ids, accessed to in async networking.
server = -1;
server_buffer = -1;

packet = false;

// game
usernames = [];
maps = [["Entrance", entrance_1]];
map = 0;
started_race = false;
