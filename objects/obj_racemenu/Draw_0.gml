if live_call() return live_result;
function draw_editorbutton(x, y, w, h, str)
{
	var hover = false;
	
	if mouse_x >= x && mouse_y >= y
	&& mouse_x < x + w && mouse_y < y + h
		hover = true;
	
	draw_set_colour(hover ? c_dkgray : c_black);
	draw_roundrect(x, y, x + w, y + h, false);
	draw_set_colour(c_white);
	draw_roundrect(x, y, x + w, y + h, true);
	
	draw_set_font(global.bigfont);
	draw_set_align(fa_center, fa_middle);
	draw_text(x + w / 2, y + h / 2, string_upper(str));
	
	if mouse_check_button_pressed(mb_left) && hover
		return 1;
	else if hover
		return -1;
	else
		return 0;
}

switch menu
{
	case 0:
		draw_sprite(spr_cursor, -1, (sel == 0 ? 250 : 960 - 250 - 192) - 40, 304);
		if draw_editorbutton(250, 280, 192, 48, "PLAY") or (sel == 0 && obj_player.key_jump)
		{
			menu = 1;
			sel = 0;
			scr_soundeffect(sfx_step);
			instance_create_unique(0, 0, obj_onlineclient);
			keyboard_string = obj_onlineclient.ip;
		}
		else if draw_editorbutton(960 - 250 - 192, 280, 192, 48, "HOST") or (sel == 1 && obj_player.key_jump)
		{
			menu = 2;
			sel = 0;
			scr_soundeffect(sfx_step);
			instance_create_unique(0, 0, obj_onlinehost);
			keyboard_string = string(obj_onlinehost.port);
		}
		break;
	
	case 1:
		var starty = 120;
		
		draw_set_font(global.font_small);
		draw_set_align(fa_center, fa_top);
		draw_text_transformed_colour(960 / 2, starty + (100 * 0) + 32, obj_onlineclient.ip, 2, 2, 0, c_white, c_white, c_white, c_white, sel == 0 ? 1 : 0.5);
		draw_text_transformed_colour(960 / 2, starty + (100 * 1) + 32, obj_onlineclient.port, 2, 2, 0, c_white, c_white, c_white, c_white, sel == 1 ? 1 : 0.5);
		draw_text_transformed_colour(960 / 2, starty + (100 * 2) + 32, obj_onlineclient.username, 2, 2, 0, c_white, c_white, c_white, c_white, sel == 2 ? 1 : 0.5);
		
		draw_set_font(global.bigfont);
		var options = ["IP", "PORT", "USERNAME", "PLAY"];
		
		for(var i = 0; i < array_length(options); i++)
			draw_text_colour(960 / 2, starty + (100 * i), options[i], c_white, c_white, c_white, c_white, sel == i ? 1 : 0.5);
		
		draw_sprite(spr_cursor, -1, 960 / 2 - string_width(options[sel]) / 2 - 40, starty + (100 * sel) + 12);
		break;
	
	case 3:
		draw_set_font(global.bigfont);
		draw_set_align(fa_center, fa_middle);
		draw_text(960 / 2 + random_range(-1, 1), 540 / 2, "CONNECTING...");
		
		draw_set_font(global.font_small);
		draw_text(960 / 2, 540 / 2 + 32, "If it takes too long, you'll be put back in the menu eventually.");
		break;
	
	case -1:
		draw_set_font(global.bigfont);
		draw_set_align(fa_center, fa_middle);
		draw_text(960 / 2 + random_range(-1, 1), 540 / 2, "WAIT...");
		break;
	
	case 2:
		var starty = 160;
		
		draw_set_font(global.font_small);
		draw_set_align(fa_center, fa_top);
		draw_text_transformed_colour(960 / 2, starty + (100 * 0) + 32, obj_onlinehost.port, 2, 2, 0, c_white, c_white, c_white, c_white, sel == 0 ? 1 : 0.5);
		draw_text_transformed_colour(960 / 2, starty + (100 * 1) + 32, obj_onlinehost.max_clients, 2, 2, 0, c_white, c_white, c_white, c_white, sel == 1 ? 1 : 0.5);
		
		draw_set_font(global.bigfont);
		var options = ["PORT", "PLAYERS", "HOST"];
		
		for(var i = 0; i < array_length(options); i++)
			draw_text_colour(960 / 2, starty + (100 * i), options[i], c_white, c_white, c_white, c_white, sel == i ? 1 : 0.5);
		
		draw_sprite(spr_cursor, -1, 960 / 2 - string_width(options[sel]) / 2 - 40, starty + (100 * sel) + 12);
		break;
	
	case 5:
		var size = 1;
		var xx = 50 * size;
		var yy = 60 * size;
		var xsiz = (960 / 2) * (1 - size);
		var ysiz = (540 / 2) * (1 - size);
		var yplus = -32;
		var rectsize = 4;
		
		draw_set_alpha(0.5);
		draw_set_colour(c_dkgray);
		draw_roundrect_ext(xx + xsiz, yy + ysiz + yplus, 960 - xx - xsiz, 540 - yy - ysiz + yplus, 16, 16, false);
		draw_roundrect_ext(xx + xsiz + rectsize, yy + ysiz + rectsize + yplus, 960 - xx - xsiz - rectsize, 540 - yy - ysiz - rectsize + yplus, 16, 16, false);
		draw_set_alpha(1);
		
		draw_set_colour(c_white);
		draw_set_font(global.font_small);
		draw_set_align();
		
		var str = "LEVEL: " + obj_onlinehost.maps[obj_onlinehost.map][0] +
		"\nPLAYERS: " + string(ds_list_size(obj_onlinehost.socket_list)) + " out of " + string(obj_onlinehost.max_clients);
		
		draw_text(xx + 32 + rectsize, yy + 32 + rectsize + yplus, str);
		
		with obj_onlinehost
		{
			if !started_race && ds_list_size(socket_list) > 0
			{
				if draw_editorbutton(960 / 2 - 192 / 2, 540 / 2 - 48 / 2 + yplus, 192, 48, "START")
				{
					started_race = true;
					
					for(var i = 0; i < ds_list_size(socket_list); i++)
					{
						packet_write_server(buffer_u8, network.race_start);
						packet_send_server(socket_list[|i]);
					}
				}
			}
		}
		
		/*
		draw_set_align();
		draw_set_font(font0);
		draw_set_colour(c_white);
		
		var num = 0;
		for(var i = ds_list_size(consolelog) - 1; i >= 0; i--)
		{
			if i < 24
				draw_text(xx + 4 + rectsize, 540 - yy + yplus - (16 * (i + 2)) - rectsize + 10, consolelog[|num]);
			num++;
		}
		*/
		break;
}

if menu == 1 or menu == 2 or menu == 5
{
	if draw_editorbutton(25, 540 - 25 - 48, 192, 48, "BACK")
	{
		sel = menu == 1 ? 0 : 1;
		menu = 0;
		scr_soundeffect(sfx_enemyprojectile);
		instance_destroy(obj_onlineclient);
		instance_destroy(obj_onlinehost);
	}
}
if menu != 5
{
	draw_sprite(spr_title, 0, -9, 13);
	//draw_sprite(spr_controlseggplant, 0, 829, 93);
	
	draw_set_font(global.bigfont);
	draw_set_align(fa_center, fa_top);
	draw_text(180, 180, "RACE");
}
draw_set_align();
