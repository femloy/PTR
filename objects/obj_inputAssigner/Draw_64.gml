var _halign = draw_get_halign()
var _valign = draw_get_valign()

draw_set_alpha(1)
draw_set_color(c_white)

if deactivated <= 0
{
	draw_set_font(global.bigfont)
	if press_start
	{
		var _txt = "PRESS START"
		draw_text(480, 298, _txt)
	}
	
	if sprite_exists(pausebg)
		sprite_delete(pausebg);
}
else
{
	draw_set_alpha(1);
	if sprite_exists(pausebg)
	{
		draw_sprite_stretched(pausebg, 0, 0, 0, display_get_gui_width(), display_get_gui_height());
		draw_set_alpha(0.5);
	}
	
	draw_set_colour(c_black);
	draw_rectangle(0, 0, 960, 540, false);
	draw_set_alpha(1);
	
	draw_set_font(global.bigfont);
	draw_set_halign(fa_center);
	draw_set_colour(c_white);
	draw_text(960 / 2 + random_range(-1, 1), 240, "CONTROLLER DISCONNECTED!");
	
	var desc = "Press any button to continue.";
	draw_set_font(global.font_small);
	draw_text(960 / 2, 280, desc);
}
draw_set_align(_halign, _valign)
