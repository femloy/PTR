if safe_get(obj_pause, "pause") == false
{
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
}
if instance_exists(obj_keyconfig) or instance_exists(obj_audioconfig)
	exit;

draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)

var _os = optionselected
var _os_fs = optionsaved_fullscreen
draw_text_colour(480, 50, "FULLSCREEN", c_white, c_white, c_white, c_white, (_os == 0 ? 1 : 0.5))
draw_text_colour(380, 100, "ON", c_white, c_white, c_white, c_white, (_os_fs == 0 ? 1 : 0.5))
draw_text_colour(580, 100, "OFF", c_white, c_white, c_white, c_white, (_os_fs == 1 ? 1 : 0.5))
var _os_rs = optionsaved_resolution
draw_text_colour(480, 180, "RESOLUTION", c_white, c_white, c_white, c_white, (_os == 1 ? 1 : 0.5))
draw_text_colour(300, 230, concat(480, "X", 270), c_white, c_white, c_white, c_white, (_os_rs == 0 ? 1 : 0.5))
draw_text_colour(480, 230, concat(960, "X", 540), c_white, c_white, c_white, c_white, (_os_rs == 1 ? 1 : 0.5))
draw_text_colour(680, 230, concat(1920, "X", 1080), c_white, c_white, c_white, c_white, (_os_rs == 2 ? 1 : 0.5))
draw_text_colour(480, 295, "KEY CONFIG", c_white, c_white, c_white, c_white, (_os == 2 ? 1 : 0.5))
draw_text_colour(480, 345, "AUDIO CONFIG", c_white, c_white, c_white, c_white, (_os == 3 ? 1 : 0.5))
var _os_vb = optionsaved_vibration
draw_text_colour(480, 410, "CONTROLLER VIBRATION", c_white, c_white, c_white, c_white, (_os == 4 ? 1 : 0.5))
draw_text_colour(380, 460, "ON", c_white, c_white, c_white, c_white, (_os_vb == 0 ? 1 : 0.5))
draw_text_colour(580, 460, "OFF", c_white, c_white, c_white, c_white, (_os_vb == 1 ? 1 : 0.5))
