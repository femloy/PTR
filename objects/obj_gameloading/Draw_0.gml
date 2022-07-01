if subroutine == 0
{
	var p = tex_max - array_length(group_arr)
	var t = (p / tex_max) * 100
	draw_healthbar(0, 524, 960, 540, t, c_black, c_white, c_white, 0, 0, 0)

	draw_set_colour(c_white);
	draw_set_align(fa_center, fa_middle);
	draw_set_font(global.bigfont);
	draw_text(960 / 2 + random_range(-1, 1), 540 / 2, loadtxt);

	draw_set_font(global.font_small);
	draw_text(960 / 2, 540 / 2 + 32, loadsubtitle);
}
else
{
	// continue
	if fade > 0
	{
		fade += 0.1;
		if fade >= 2
		{
			global.crashed = undefined;
			event_perform(ev_alarm, 0);
		}
	}
	else
	{
		if (keyboard_check_pressed(vk_enter) or keyboard_check_pressed(global.key_jump))
		{
			scr_soundeffect(sfx_contin);
			fade = 0.1;
		}
	}
	
	// draw
	draw_set_colour(c_white);
	draw_set_alpha(1);
	draw_set_font(global.font_small);
	
	draw_set_halign(fa_center);
	draw_text(room_width / 2 + random_range(-1, 1), room_height - 64, "Press ENTER to play");
	
	var crashtext = "The game crashed last time.";
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(16, 16, crashtext, 2, 2, 0);
	
	draw_set_alpha(0.75);
	draw_set_font(font1);
	draw_text_ext(16, 32 + string_height(crashtext) * 2, string(global.crashed), 16, room_width - 16);
	
	draw_set_alpha(fade);
	draw_set_colour(c_black);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(1);
}
