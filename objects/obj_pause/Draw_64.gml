if pause
{
	draw_set_align();
	
	// background
	var pad = 72;
	pausebg_pos = (pausebg_pos + 0.5) % pad;
	
	if !surface_exists(pausebg_surf2)
		pausebg_surf2 = surface_create(960, 540);
	if !surface_exists(pausebg_surf)
		pausebg_surf = surface_create(pad * 2, pad * 2);
	
	surface_set_target(pausebg_surf);
	draw_clear(c_black);
	draw_set_colour(pausebg_col);
	draw_roundrect_ext(0, 0, pad - 1, pad - 1, 16, 16, false);
	draw_roundrect_ext(pad, pad, pad + pad - 1, pad + pad - 1, 16, 16, false);
	surface_reset_target();
	
	surface_set_target(pausebg_surf2);
	draw_surface_tiled(pausebg_surf, pausebg_pos, pausebg_pos);
	surface_reset_target();
	
	draw_surface(pausebg_surf2, 0, 0);
	
	draw_set_colour(c_white)
	if instance_exists(obj_option)
		exit;
	
	// text
	var pad = 48, xx = 490, yy = 48;
	for (var i = 0; i < array_length(pause_menu); i++)
	{
		var c = c_gray
		yy = 96 + (pad * i)
		if selected == i
		{
			c = c_white
			draw_sprite(spr_cursor, cursor_index, (xx - 48), (yy + (cursor_sprite_height / 2)))
		}
		draw_text_color(xx, yy, pause_menu[i], c, c, c, c, 1)
	}
	
	// draw the player
	xx = 256
	yy = 192
	pal_swap_set(spr_palette, paletteselect, 0)
	draw_sprite(peppino_sprite, peppino_index, xx, yy)
	pal_swap_reset()
	
	// score
	draw_set_font(global.collectfont)
	draw_set_halign(fa_center)
	xx = 689
	yy = 416
	
	draw_sprite(spr_pizzascore, 0, xx, yy)
	if global.collect >= global.crank
		draw_sprite(spr_pizzascore_pepper, 0, xx, yy)
	if global.collect >= global.brank
		draw_sprite(spr_pizzascore_pepperoni, 0, xx, yy)
	if global.collect >= global.arank
		draw_sprite(spr_pizzascore_olive, 0, xx, yy)
	if global.collect >= global.srank
		draw_sprite(spr_pizzascore_shroom, 0, xx, yy)
	draw_text(xx, yy - 54, global.collect)
	
	// rank
	var rank = "D"
	if global.collect >= global.crank
		rank = "C"
	if global.collect >= global.brank
		rank = "B"
	if global.collect >= global.arank
		rank = "A"
	if global.collect >= global.srank
		rank = "S"
	
	// toppins
	xx = 172
	yy = 404
	pad = 40
	for (i = 0; i < array_length(toppin_sprite); i++)
		draw_sprite_ext(toppin_sprite[i], toppin_index[i], xx + pad * i, yy, 1, 1, 0, c_white, toppin_has[i] ? 1 : 0.5)
}
