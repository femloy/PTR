draw_set_font(global.bigfont)
draw_set_align();
if (player == 0)
{
	var yst = 25;
		
	draw_set_colour(c_white)
	draw_text_colour(32, 32, "BACK", c_white, c_white, c_white, c_white, key_select == -1 ? 1 : 0.5)
	
	draw_set_halign(fa_center)
	draw_text_colour(960 / 2 - 60, yst + (50 * 0), "UP", c_white, c_white, c_white, c_white, key_select == 0 ? 1 : 0.5)
	draw_text(960 / 2 + 100, yst + (50 * 0), scr_keyname(global.key_up))

	draw_text_colour(960 / 2 - 60, yst + (50 * 1), "DOWN", c_white, c_white, c_white, c_white, key_select == 1 ? 1 : 0.5)
	draw_text(960 / 2 + 100, yst + (50 * 1), scr_keyname(global.key_down))

	draw_text_colour(960 / 2 - 60, yst + (50 * 2), "RIGHT", c_white, c_white, c_white, c_white, key_select == 2 ? 1 : 0.5)
	draw_text(960 / 2 + 100, yst + (50 * 2), scr_keyname(global.key_right))

	draw_text_colour(960 / 2 - 60, yst + (50 * 3), "LEFT", c_white, c_white, c_white, c_white, key_select == 3 ? 1 : 0.5)
	draw_text(960 / 2 + 100, yst + (50 * 3), scr_keyname(global.key_left))

	draw_text_colour(960 / 2 - 60, yst + (50 * 4), "JUMP", c_white, c_white, c_white, c_white, key_select == 4 ? 1 : 0.5)
	draw_text(960 / 2 + 100, yst + (50 * 4), scr_keyname(global.key_jump))

	draw_text_colour(960 / 2 - 60, yst + (50 * 5), "GRAB", c_white, c_white, c_white, c_white, key_select == 5 ? 1 : 0.5)
	draw_text(960 / 2 + 100, yst + (50 * 5), scr_keyname(global.key_slap))

	draw_text_colour(960 / 2 - 60, yst + (50 * 6), "DASH", c_white, c_white, c_white, c_white, key_select == 6 ? 1 : 0.5)
	draw_text(960 / 2 + 100, yst + (50 * 6), scr_keyname(global.key_attack))

	draw_text_colour(960 / 2 - 60, yst + (50 * 7), "SHOOT", c_white, c_white, c_white, c_white, key_select == 7 ? 1 : 0.5)
	draw_text(960 / 2 + 100, yst + (50 * 7), scr_keyname(global.key_shoot))

	draw_text_colour(960 / 2 - 60, yst + (50 * 8), "TAUNT", c_white, c_white, c_white, c_white, key_select == 8 ? 1 : 0.5)
	draw_text(960 / 2 + 100, yst + (50 * 8), scr_keyname(global.key_taunt))

	draw_text_colour(960 / 2 - 60, yst + (50 * 9), "PAUSE", c_white, c_white, c_white, c_white, key_select == 9 ? 1 : 0.5)
	draw_text(960 / 2 + 100, yst + (50 * 9), scr_keyname(global.key_start))
}
if (player == 1)
{
	draw_text_colour(280, 25, "PLAYER 2", c_white, c_white, c_white, c_white, 1)
	if (key_select == -1)
		draw_text_colour(280, 50, "BACK", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(280, 50, "BACK", c_white, c_white, c_white, c_white, 0.5)
	if (key_select == 0)
		draw_text_colour(420, 50, "UP", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 50, "UP", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 50, scr_keyname(global.key_upN))
	if (key_select == 1)
		draw_text_colour(420, 100, "DOWN", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 100, "DOWN", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 100, scr_keyname(global.key_downN))
	if (key_select == 2)
		draw_text_colour(420, 150, "RIGHT", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 150, "RIGHT", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 150, scr_keyname(global.key_rightN))
	if (key_select == 3)
		draw_text_colour(420, 200, "LEFT", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 200, "LEFT", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 200, scr_keyname(global.key_leftN))
	if (key_select == 4)
		draw_text_colour(420, 250, "JUMP", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 250, "JUMP", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 250, scr_keyname(global.key_jumpN))
	if (key_select == 5)
		draw_text_colour(420, 300, "GRAB", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 300, "GRAB", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 300, scr_keyname(global.key_slapN))
	if (key_select == 6)
		draw_text_colour(420, 350, "DASH", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 350, "DASH", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 350, scr_keyname(global.key_attackN))
	if (key_select == 7)
		draw_text_colour(420, 400, "SHOOT", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 400, "SHOOT", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 400, scr_keyname(global.key_shootN))
	if (key_select == 8)
		draw_text_colour(420, 450, "TAUNT", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 450, "TAUNT", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 450, scr_keyname(global.key_tauntN))
	if (key_select == 9)
		draw_text_colour(420, 500, "PAUSE", c_white, c_white, c_white, c_white, 1)
	else
		draw_text_colour(420, 500, "PAUSE", c_white, c_white, c_white, c_white, 0.5)
	draw_text(580, 500, scr_keyname(global.key_startN))
}
