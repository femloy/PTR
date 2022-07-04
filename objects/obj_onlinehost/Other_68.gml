if live_call() return live_result;

var type_event = async_load[?"type"];
var socket = async_load[?"socket"];

function received_packet_server(buffer, socket)
{
	var msgid = buffer_read(buffer, buffer_u8);
	switch msgid
	{
		case network.player_join:
			usernames[socket] = buffer_read(buffer, buffer_string);
			
			// tell everyone else that a new player joined
			for(var i = 0; i < ds_list_size(socket_list); i++)
			{
				if socket_list[|i] != socket
				{
					packet_start_server();
					packet_write_server(buffer_u8, network.player_join);
					packet_write_server(buffer_u8, socket);
					packet_write_server(buffer_string, usernames[socket]);
					packet_send_server(socket_list[|i]);
				}
			}
			
			// send player to room
			packet_start_server();
			packet_write_server(buffer_u8, network.change_player_room);
			packet_write_server(buffer_u16, maps[map][1]);
			packet_write_server(buffer_string, "A");
			packet_send_server(socket);
			
			// tell the new player that other people are in the game
			if ds_list_size(socket_list) >= 2
			{
				packet_start_server();
				packet_write_server(buffer_u8, network.player_add);
				packet_write_server(buffer_u8, ds_list_size(socket_list) - 1);
				for(var i = 0; i < ds_list_size(socket_list); i++)
				{
					if socket_list[|i] != socket
					{
						packet_write_server(buffer_u8, socket_list[|i]);
						packet_write_server(buffer_string, usernames[socket_list[|i]]);
					}
				}
				packet_send_server(socket);
			}
			break;
		
		case network.player_sync:
			var br = [];
			br[0] = [buffer_u16, buffer_read(buffer, buffer_u16)]
			br[1] = [buffer_bool, buffer_read(buffer, buffer_bool)]
			br[2] = [buffer_s16, buffer_read(buffer, buffer_s16)]
			br[3] = [buffer_s16, buffer_read(buffer, buffer_s16)]
			br[4] = [buffer_u32, buffer_read(buffer, buffer_u32)]
			br[5] = [buffer_u8, buffer_read(buffer, buffer_u8)]
			br[6] = [buffer_string, buffer_read(buffer, buffer_string)]
			br[7] = [buffer_s8, buffer_read(buffer, buffer_s8)]
			br[8] = [buffer_s16, buffer_read(buffer, buffer_s16)]
			br[9] = [buffer_string, buffer_read(buffer, buffer_string)]
			br[10] = [buffer_string, buffer_read(buffer, buffer_string)]
			br[11] = [buffer_u8, buffer_read(buffer, buffer_u8)]
			
			for(var i = 0; i < ds_list_size(socket_list); i++)
			{
				// send to everyone else
				if socket_list[|i] != socket
				{
					packet_start_server();
					packet_write_server(buffer_u8, network.player_sync);
					packet_write_server(buffer_u8, socket);
					for(var j = 0; j < array_length(br); j++)
						packet_write_server(br[j][0], br[j][1]);
					packet_send_server(socket_list[|i]);
				}
			}
			break;
		
		case network.sync_var:
			var value_type = buffer_read(buffer, buffer_u8);
			var varname = buffer_read(buffer, buffer_string);
			var value = buffer_read(buffer, value_type);
			
			for(var i = 0; i < ds_list_size(socket_list); i++)
			{
				// send to everyone else
				if socket_list[|i] != socket
				{
					packet_write_server(buffer_u8, network.sync_var);
					packet_write_server(buffer_u8, socket);
					packet_write_server(buffer_u8, value_type);
					packet_write_server(buffer_string, varname);
					packet_write_server(value_type, value);
					packet_send_server(socket_list[|i]);
				}
			}
			break;
		
		case network.kill_object:
			var instid = buffer_read(buffer, buffer_string);
			for(var i = 0; i < ds_list_size(socket_list); i++)
			{
				// send to everyone else
				if socket_list[|i] != socket
				{
					packet_write_server(buffer_u8, network.kill_object);
					packet_write_server(buffer_string, instid);
					packet_send_server(socket_list[|i]);
				}
			}
			break;
		
		default:
			break;
	}
	buffer_delete(buffer);
}

switch type_event
{
	case network_type_data: // received data from client
		var buffer = async_load[?"buffer"];
		buffer_seek(buffer, buffer_seek_start, 0);
		received_packet_server(buffer, async_load[?"id"]);
		break;
	
	case network_type_connect: // add client to socket list
		if started_race
		{
			packet_write_server(buffer_u8, network.error_disconnect);
			packet_write_server(buffer_string, "THE RACE HAS ALREADY STARTED!");
			packet_send_server(socket);
		}
		else
		{
			ds_list_add(socket_list, socket);
			packet_write_server(buffer_u8, network.player_hello);
			packet_write_server(buffer_u8, socket);
			packet_send_server(socket);
		}
		break;
	
	case network_type_disconnect: // delete client from socket list
		ds_list_delete(socket_list, ds_list_find_index(socket_list, socket));
		
		// tell everyone else that the player left
		for(var i = 0; i < ds_list_size(socket_list); i++)
		{
			packet_write_server(buffer_u8, network.player_leave);
			packet_write_server(buffer_u8, socket);
			packet_send_server(socket_list[|i]);
		}
		if ds_list_size(socket_list) == 0
			started_race = false;
		break;
}
