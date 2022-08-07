if live_call() return live_result;

function received_packet(buffer)
{
	var msgid = buffer_read(buffer, buffer_u8);
	switch msgid
	{
		case network.player_hello:
			socket = buffer_read(buffer, buffer_u8);
			with obj_player1
				paletteselect = other.socket % pal_swap_get_pal_count(spr_palette);
			
			packet_write(buffer_u8, network.player_join);
			packet_write(buffer_string, username);
			packet_send();
			break;
		
		case network.close_server:
			global.levelreset = false;
			scr_playerreset();
			
			with obj_player
			{
				state = states.titlescreen;
				targetDoor = "A";
			}
			with obj_roomname
			{
				alarm[0] = room_speed * 4;
				message = "SERVER CLOSED!";
				showtext = true;
			}
			room_goto(rm_onlinerace);
			event_user(0);
			instance_destroy();
			break;
		
		case network.error_disconnect:
			var m = buffer_read(buffer, buffer_string);
			
			if room != rm_onlinerace
			{
				global.levelreset = false;
				scr_playerreset();
				
				with obj_player
				{
					state = states.titlescreen;
					targetDoor = "A";
				}
				with obj_roomname
				{
					alarm[0] = room_speed * 4;
					message = m;
					showtext = true;
				}
			}
			room_goto(rm_onlinerace);
			event_user(0);
			instance_destroy();
			break;
		
		case network.change_player_room:
			var r = buffer_read(buffer, buffer_u16);
			var d = buffer_read(buffer, buffer_string);
			
			with obj_player1
			{
				image_index = 0;
				state = states.comingoutdoor;
				targetRoom = r;
				targetDoor = d;
			}
			instance_create(0, 0, obj_fadeout);
			break;
		
		case network.race_start:
			instance_create(0, 0, obj_racecountdown);
			break;
		
		case network.player_join:
			var sock = buffer_read(buffer, buffer_u8), nameread = buffer_read(buffer, buffer_string);
			with obj_otherplayer
			{
				if socket == sock
					instance_destroy();
			}
			
			with instance_create(0, 0, obj_otherplayer)
			{
				socket = sock;
				name = nameread;
			}
			break;
		
		case network.player_add:
			var count = buffer_read(buffer, buffer_u8);
			repeat count
			{
				var sock = buffer_read(buffer, buffer_u8), nameread = buffer_read(buffer, buffer_string);
				with obj_otherplayer
				{
					if socket == sock
						instance_destroy();
				}
				
				with instance_create(0, 0, obj_otherplayer)
				{
					socket = sock;
					name = nameread;
				}
			}
			break;
		
		case network.player_leave:
			var sock = buffer_read(buffer, buffer_u8);
			with obj_otherplayer
			{
				if socket == sock
					instance_destroy();
			}
			break;
		
		case network.player_sync:
			var sock = buffer_read(buffer, buffer_u8);
			
			var br = psyncarray;
			for(var i = 0; i < array_length(br); i++)
				br[i] = buffer_read(buffer, br[i]);
			
			with obj_otherplayer
			{
				if socket == sock
				{
					player_room = br[0];
					visible = br[1];
					x = br[2];
					y = br[3];
					image_blend = br[4];
					image_index = br[5];
					sprite_index = asset_get_index(br[6]);
					image_xscale = br[7];
					racepos = br[8];
					baddiegrabbedID = br[9];
					spr_palette = asset_get_index(br[10]);
					paletteselect = br[11];
					state = br[12];
					
					done = player_room == rank_room;
					sock = -9999;
				}
			}
			break;
		
		case network.sync_var:
			var sock = buffer_read(buffer, buffer_u8);
			var value_type = buffer_read(buffer, buffer_u8);
			var varname = buffer_read(buffer, buffer_string);
			var value = buffer_read(buffer, value_type);
			
			with obj_otherplayer
			{
				if socket == sock
					variable_instance_set(id, varname, value);
			}
			break;
		
		case network.kill_object:
			var instid = buffer_read(buffer, buffer_string);
			with all
			{
				if string(id) == instid
					instance_destroy();
			}
			ds_list_add(global.saveroom, instid);
			break;
	}
	buffer_delete(buffer);
}

var type_event = async_load[?"type"];
switch type_event
{
	case network_type_data: // received data
		var buffer = async_load[?"buffer"];
		buffer_seek(buffer, buffer_seek_start, 0);
		received_packet(buffer);
		break;
	
	case network_type_non_blocking_connect:
		connected = async_load[?"succeeded"];
		if !connected
		{
			with obj_racemenu
				menu = 4;
		}
		break;
}
