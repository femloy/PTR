function Approach(a, b, amount)
{
	if a < b
	{
		a += amount;
		if a > b
			return b;
	}
	else
	{
		a -= amount;
		if a < b
			return b;
	}
	return a;
}

function camera_zoom(zoom_target, zoom_speed)
{
	with obj_camera
	{
		targetzoom = zoom_target
		targetzoom = clamp(targetzoom, 0, max_zoom)
		
		if zoom_speed != undefined
			zoomspd = abs(zoom_speed)
	}
}

function camera_set_zoom(argument0)
{
	with obj_camera
		zoom = argument0
}

function try_solid(xplus, yplus, object, tries)
{
	var old_x = x
	var old_y = y
	var n = -1
	
	for(var i = 0; i < tries; i++)
	{
		x += xplus
		y += yplus
		
		if !scr_solid(x, y)
		{
			n = i + 1
			break
		}
	}
	
	x = old_x
	y = old_y
	return n;
}

function ledge_bump(argument0)
{
	var old_x = x
	var old_y = y
	
	x += xscale * 4
	var ty = try_solid(0, -1, obj_solid, argument0)
	x = old_x
	
	if ty != -1
	{
		y -= ty
		x += xscale
		if scr_solid(x, y)
		{
			x = old_x
			y = old_y
			return true;
		}
		return false;
	}
	return true;
}

function instance_create_unique(argument0, argument1, argument2)
{
	if instance_exists(argument2)
		return noone;
	var b = instance_create(argument0, argument1, argument2)
	return b;
}

function get_solid_difference(argument0, argument1, argument2)
{
	var old_x = x
	var old_y = y
	
	var n = 0
	for (i = 0; i < argument2; i++)
	{
		x += argument0
		y += argument1
		if !scr_solid(x, y)
			n++
	}
	
	x = old_x
	y = old_y
	return n;
}

function trace()
{
	var _string = ""
	for (var i = 0; i < argument_count; i++)
		_string += string(argument[i])
	show_debug_message(_string)
}

function concat()
{
	var _string = ""
	for (var i = 0; i < argument_count; i++)
		_string += string(argument[i])
	return _string;
}

function ds_list_add_unique(argument0)
{
	if argument_count > 1
	{
		for (var i = 1; i < argument_count; i++)
		{
			var b = argument[i]
			if ds_list_find_index(argument0, b) == -1
				ds_list_add(argument0, b)
		}
	}
}

function point_in_camera(argument0, argument1, argument2)
{
	var cam_x = camera_get_view_x(argument2)
	var cam_y = camera_get_view_y(argument2)
	var cam_w = camera_get_view_width(argument2)
	var cam_h = camera_get_view_height(argument2)
	return point_in_rectangle(argument0, argument1, cam_x, cam_y, (cam_x + cam_w), (cam_y + cam_h));
}

function point_in_camera_ext(argument0, argument1, argument2, argument3, argument4)
{
	var cam_x = camera_get_view_x(argument2)
	var cam_y = camera_get_view_y(argument2)
	var cam_w = camera_get_view_width(argument2)
	var cam_h = camera_get_view_height(argument2)
	return point_in_rectangle(argument0, argument1, (cam_x - argument3), (cam_y - argument4), ((cam_x + cam_w) + argument3), ((cam_y + cam_h) + argument4));
}

function bbox_in_camera(argument0, argument1)
{
	if is_undefined(argument1)
		argument1 = 0
	var cam_x = camera_get_view_x(argument0)
	var cam_y = camera_get_view_y(argument0)
	var cam_w = camera_get_view_width(argument0)
	var cam_h = camera_get_view_height(argument0)
	return bbox_left < cam_x + cam_w + argument1 && bbox_right > cam_x - argument1 && bbox_top < cam_y + cam_h + argument1 && bbox_bottom > cam_y - argument1;
}

function instance_nearest_random(argument0, argument1)
{
	var l = instance_furthest(x, y, argument0)
	var list = ds_list_create()
	for (i = 0; i < instance_number(argument0); i++)
	{
		var b = instance_find(argument0, i)
		var t = distance_to_object(b)
		if t <= l
			ds_list_add(list, b)
	}
	
	var b = undefined
	if ds_list_size(list) > 0
	{
		var n = irandom(argument1)
		if ds_list_size(list) < n
			n = ds_list_size(list) - 1
		b = ds_list_find_value(list, ds_list_size(list) - n)
	}
	ds_list_destroy(list)
	return b;
}

function instance_random(object) {
	return instance_find(object, irandom(instance_number(object) - 1));
}

function heat_calculate(num)
{
	trace(global.stylemultiplier)
	return num + round(num * global.stylemultiplier);
}

/// POST-DECOMPILED CODE

global.crashed = undefined;
if file_exists("lastcrash")
{
	var _e = file_text_open_read("lastcrash");
	
	var e = "";
	while !file_text_eof(_e)
		e += string(file_text_readln(_e));
	
	file_text_close(_e);
	
	global.crashed = e;
	if !file_delete("lastcrash")
		trace("last crash file didnt delete dumbass lmfao");
}
exception_unhandled_handler
(
	function(e)
	{
		audio_stop_all();
		audio_play_sound(sfx_pephurt, 0, false);
		
		trace(e);
		show_message("The game crashed! longMessage:\n\n" + e.longMessage);
		
		if file_exists("lastcrash")
			file_delete("lastcrash");
		
		var _f = file_text_open_write("lastcrash");
		file_text_write_string(_f, string(e));
		file_text_close(_f);
	}
)

function string_contains(str, substr)
{
	if string_length(substr) > string_length(str)
		return false;
	return (string_pos(substr, str) != 0);
}
function string_startswith(str, substr)
{
	if string_length(substr) > string_length(str)
		return false;
	return (string_pos(substr, str) == 1);
}
function string_endswith(str, substr)
{
	if string_length(substr) > string_length(str)
		return false;
	return (string_pos(substr, str) == (string_length(str) - string_length(substr)) + 1);
}

function draw_set_align(halign = fa_left, valign = fa_top)
{
	draw_set_halign(halign);
	draw_set_valign(valign);
}

function draw_text_outline(x, y, str, col = c_black, scale = 1, angle = 0, sep = 1)
{
	var resetcolor = draw_get_colour();
	
	draw_set_color(col);
	if scale == 1 && angle == 0
	{
		draw_text(x - sep, y - sep, str);
		draw_text(x - sep, y + sep, str);
		draw_text(x + sep, y + sep, str);
		draw_text(x + sep, y - sep, str);
		
		draw_set_color(resetcolor);
		draw_text(x, y, str);
	}
	else
	{
		draw_text_transformed(x - sep, y - sep, str, scale, scale, angle);
		draw_text_transformed(x - sep, y + sep, str, scale, scale, angle);
		draw_text_transformed(x + sep, y + sep, str, scale, scale, angle);
		draw_text_transformed(x + sep, y - sep, str, scale, scale, angle);
		
		draw_set_color(resetcolor);
		draw_text_transformed(x, y, str, scale, scale, angle);
	}
}

function string_is_number(str)
{
	if str == ""
		return false;
	if is_real(str)
		return true;
	return string_length(string_digits(str)) + string_count("-", str) + string_count(".", str) == string_length(str);
}
function number_in_range(num, a, b)
{
	if num >= a && num <= b
		return true;
	return false;
}

function game_is_compiled()
{
	if string_pos("Runner.exe", parameter_string(0)) > 0
		return true;
	return false;
}

function safe_get(inst, variable)
{
	if instance_exists(inst) && variable_instance_exists(inst, variable)
		return variable_instance_get(inst, variable);
	return undefined;
}

function is_jukebox_playing()
{
	if global.jukebox >= 0 && audio_is_playing(global.jukebox)
		return true;
	return false;
}

function draw_set_flash(enable, col = (global.gameplay == gameplay.remix ? c_white : merge_colour(c_red, c_white, 0.9)))
{
	// default color is kinda weird but i think it's what shd_hit does
	gpu_set_fog(enable, col, 0, 1);
}

function get_instid(instance)
{
	if instance_exists(instance)
		return real(string_digits(string(instance.id)));
}

function draw_text_auto(x, y, str, sep = undefined, w = undefined, alpha = draw_get_alpha())
{
	str = string(str);
	
	if draw_get_font() == global.bigfont or draw_get_font() == global.smallfont
		str = string_upper(str);
	
	var aprev = draw_get_alpha();
	draw_set_alpha(alpha);
	
	if is_undefined(sep) && is_undefined(w)
		draw_text(x, y, str);
	else
		draw_text_ext(x, y, str, sep, w);
	
	draw_set_alpha(aprev);
}

function check_shaders() {
	return shaders_are_supported();
}

function in_saveroom(ID)
{
	if ds_list_find_index(global.saveroom, ID) != -1
	or ds_list_find_index(global.saveroom, real(string_digits(string(ID)))) != -1
	or ds_list_find_index(global.saveroom, string(ID)) != -1
		return true;
	return false;
}
