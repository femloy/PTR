function WCscr_altname(name, alt)
{
	variable_global_set("sh_" + alt, variable_global_get("sh_" + name));
	array_push(allFunctions, alt);
	
	var metadata = functionData[$ name];
	metadata.hidden = true;
	functionData[$ alt] = metadata;
}

function scr_wc_create()
{
	WC_debug = false;
	
	// all command aliases
	WCscr_altname("clear", "cls");
	WCscr_altname("var", "variable");
	WCscr_altname("panic", "pizzatime");
	
	// selection modes
	enum WC_select_modes
	{
		create,
		debugview,
		variable
	}
	WC_select_mode = -1;
	WC_select_inst = noone;
	
	// instance drag
	WC_drag_toggle = true;
	WC_drag_alt = false;
	WC_drag_offset = [0, 0];
	WC_drag_grid = [1, 1];
	WC_drag_inst = noone;
	WC_drag_deleting = false;
	
	// debug view
	WC_debugview = false;
	WC_debugview_target = noone;
	WC_debugview_scroll = 0;
	
	// etc
	WC_showinvisible = 0; // 0: no, 1: yes, 2: show names of objects without sprites
	WC_oobcam = false;
	showhud = true;
	
	// shortcuts
	WC_binds = ds_map_create();
	function WCscr_addbind(key, command_or_method) {
		ds_map_add(WC_binds, string(key), command_or_method);
	}
	WCscr_addbind(ord("1"), "create");
	WCscr_addbind(ord("3"), "var");
	WCscr_addbind(ord("4"), "oobcam");
	WCscr_addbind(ord("5"), "panic");
	WCscr_addbind(ord("7"), "showinvisible");
	WCscr_addbind(ord("9"), "debughud");
	WCscr_addbind(vk_numpad1, "resetsaveroom");
	
	// frozen variables
	WC_frozen = ds_list_create();
	function WCscr_freezevar(instance, variable)
	{
		for(var i = 0; i < ds_list_size(WC_frozen); i++)
		{
			var frozen = WC_frozen[|i];
			if frozen[0] == instance && frozen[1] == variable
			{
				ds_list_delete(WC_frozen, i);
				return false;
			}
		}
		ds_list_add(WC_frozen, [instance, variable, variable_instance_get(instance, variable)]);
		return true;
	}
	
	// open console bind
	WCscr_addbind(220, function() {
		if !isOpen
			self.open();
		else
			self.close();
	});
	
	// windows
	WC_win_list = ds_list_create();
	function WCwin(x = 0, y = 0, title = "Untitled") constructor
	{
		// vars
		win_x = x;
		win_y = y;
		win_width = 160;
		win_height = 90;
		win_surf = -1;
		win_title = title;
		
		win_moving = false;
		win_resize = false;
		
		// func
		draw = function()
		{
		
		}
		
		function add() {
			ds_list_add(obj_shell.WC_win_list, self);
		}
	}
	WC_win_focus = -1;
	WC_win_dragx = 0;
	WC_win_dragy = 0;
	
	#region functions
	
	function WCscr_overconsole()
	{
		var mx = device_mouse_x_to_gui(0), my = device_mouse_y_to_gui(0);
		return isOpen && mx >= shellOriginX && my >= shellOriginY && mx < shellOriginX + width && my < shellOriginY + height;
	}
	function WCscr_findobj(obj)
	{
		var target_one = false;
		var target = noone;
	
		if obj == "all"
		{
			// every instance
			target = all;
		}
		else if asset_get_type(obj) == asset_object
		{
			// just an object
			var asset = asset_get_index(obj);
			if instance_exists(asset)
				target = asset;
		}
		else
		{
			// possibly a specific object
			if string_pos(":", obj) > 0
			{
				// parse object and index
				var parse_obj = "";
				var parse_ind = "";
				var parsing = 0;
				
				for(var i = 1; i <= string_length(obj); i++)
				{
					var char = string_char_at(obj, i);
					
					// obj part
					if parsing == 0
					{
						if char == ":"
						{
							parsing = 1;
							continue;
						}
						parse_obj += char;
					}
					
					// index part
					else
						parse_ind += char;
				}
				
				// verify that index is number
				if string_digits(parse_ind) != parse_ind
					return "Instance index must be a number";
				parse_ind = real(parse_ind);
				
				// get object
				var asset = noone;
				if string_digits(parse_obj) == parse_obj
					asset = real(parse_obj);
				else if asset_get_type(parse_obj) == asset_object
					asset = asset_get_index(parse_obj);
			
				if instance_exists(asset)
				{
					target_one = true;
					
					// get specific instance
					asset = instance_find(asset, parse_ind);
					if instance_exists(asset)
						target = asset;
				}
			}
			// or just an object, by number
			else if string_digits(obj) == obj && obj != ""
			{
				if instance_exists(real(obj))
					target = real(obj);
				if real(obj) >= 100000 // most likely an instance id
					target_one = true;
			}
		}
		return [target, target_one];
	}
	function WCscr_allargs(args, after = 0)
	{
		var ret = "";
		for(var i = after; i < array_length(args); i++)
			ret += args[i] + (i == array_length(args) - 1 ? "" : " ");
		return ret;
	}
	function WCscr_getvalue(value)
	{
		value = string(value);
		if asset_get_index(value) != -1 // asset
			value = asset_get_index(value);
		else if string_is_number(value) // number
			value = real(value);
		else if string_char_at(value, 1) == "'"
		&& string_char_at(value, string_length(value)) == "'" // forced string
		{
			value = string_delete(value, 1, 1);
			value = string_delete(value, string_length(value), 1);
		}
		else
		{
			// parse?
			
		}
		return value;
	}
	
	#endregion
}

function scr_wc_step()
{
	// prepare
	depth = -16000;
	WC_debug |= debug;
	
	// ugly as fuck cursor resetter
	if window_get_cursor() == cr_size_nwse
	{
		if display_mouse_get_x() > window_get_x() && display_mouse_get_x() < window_get_x() + window_get_width()
		&& display_mouse_get_y() > window_get_y() && display_mouse_get_y() < window_get_y() + window_get_height()
			window_set_cursor(cr_default);
	}
	
	#region bound keys
	
	for(var i = ds_map_find_first(WC_binds); !is_undefined(i); i = ds_map_find_next(WC_binds, i))
	{
		if keyboard_check_pressed(real(i))
		{
			var val = ds_map_find_value(WC_binds, i);
			if is_method(val)
				val();
			else if !isOpen
			{
				var args = _input_string_split(val);
				
				// set arguments outside of the console
				if array_length(args) == 1
				{
					if args[0] == "var" or args[0] == "variable"
					{
						if keyboard_check(vk_shift)
						{
							var variable = get_string("Input global variable name here", "");
							if variable != ""
							{
								if variable_global_exists(variable)
									var value = get_string("Overwriting existing value in global." + variable + " to...", string(variable_global_get(variable)));
								else
									var value = get_string("Creating new variable global." + variable + " with value...", "");
							
								consoleString = "var global " + variable + " " + value;
								_execute_script(_input_string_split(consoleString));
								consoleString = "";
							}
						}
						else
							WC_select_mode = WC_select_modes.variable;
					}
					else
					{
						var metadata = functionData[$ args[0]];
						if !is_undefined(metadata) && variable_struct_exists(metadata, "arguments")
						{
							for(var i = 0; i < array_length(metadata.arguments); i++)
							{
								if string_char_at(metadata.arguments[i], 1) != "<"
								{
									var getstring = get_string("Write value for argument:\n" + metadata.arguments[i], "");
									if getstring == ""
										break;
								
									val += " \"" + getstring + "\"";
								}
							}
						}
						args = _input_string_split(val)
						
						consoleString = val;
						if array_length(args) > 0
							_execute_script(args);
					}
				}
				else
				{
					consoleString = val;
					if array_length(args) > 0
						_execute_script(args);
				}
				consoleString = "";
			}
		}
	}
	
	#endregion
	#region frozen variables
	
	for(var i = 0; i < ds_list_size(WC_frozen); i++)
	{
		var frozen = WC_frozen[|i];
		if instance_exists(frozen[0]) or frozen[0] == global
			variable_instance_set(frozen[0], frozen[1], frozen[2]);
	}
	
	#endregion
	#region focus on a window
	
	var mousex = device_mouse_x_to_gui(0), mousey = device_mouse_y_to_gui(0);
	if mouse_check_button_pressed(mb_left)
	{
		WC_win_focus = -1;
		if !WCscr_overconsole()
		{
			for(var i = 0; i < ds_list_size(WC_win_list); i++)
			{
				var win = WC_win_list[|i];
				if mousex >= win.win_x && mousex < win.win_x + win.win_width + 4
				&& mousey >= win.win_y - 32 && mousey < win.win_y + win.win_height + 4
				{
					WC_win_focus = win;
					break;
				}
			}
		}
	}
	#endregion
	#region drag objects
	
	if WC_drag_toggle && WC_debug && WC_select_mode <= -1
	{
		// object gone failsafe
		if !instance_exists(WC_drag_inst)
			WC_drag_inst = noone;
		
		// start dragging an object
		var mb = mouse_check_button_pressed(mb_left) - mouse_check_button_pressed(mb_middle);
		if mb != 0 && WC_win_focus == -1 && !WCscr_overconsole() && !instance_exists(WC_drag_inst)
		{
			// drag player
			if mb == 1 && keyboard_check(vk_control) && instance_exists(obj_player1)
			{
				WC_drag_offset = [0, 0];
				WC_drag_alt = keyboard_check(vk_alt);
				WC_drag_inst = instance_find(obj_player1, 0);
			}
			// normal drag
			else
			{
				WC_drag_inst = collision_point(mouse_x, mouse_y, all, true, false);
				if instance_exists(WC_drag_inst)
				{
					// prioritize baddie (pt exclusive)
					if WC_drag_inst.object_index == obj_baddiecollisionbox
					&& instance_exists(WC_drag_inst.baddieID)
						WC_drag_inst = WC_drag_inst.baddieID;
					
					// vars
					WC_drag_offset = [mouse_x - WC_drag_inst.x, mouse_y - WC_drag_inst.y];
					WC_drag_alt = keyboard_check(vk_alt);
					
					// duplicate
					if mb == -1
					{
						with WC_drag_inst
							other.WC_drag_inst = instance_copy(keyboard_check(vk_control));
					}
				}
			}
		}
	
		// mass delete
		if WC_drag_inst == noone && keyboard_check(vk_control) && mouse_check_button_pressed(mb_right)
			WC_drag_deleting = true;
		
		if WC_drag_deleting
		{
			if !mouse_check_button(mb_right)
				WC_drag_deleting = false;
		
			var delinst = collision_point(mouse_x, mouse_y, all, true, false);
			if instance_exists(delinst)
				instance_destroy(delinst, !keyboard_check(vk_alt));
		}
		
		// actually drag the object
		if instance_exists(WC_drag_inst)
		{
			var rel = (!mouse_check_button(mb_middle) && mouse_check_button_released(mb_left)) or (!mouse_check_button(mb_left) && mouse_check_button_released(mb_middle));
		
			// move the object
			if !WC_drag_alt or rel
			{
				with WC_drag_inst
				{
					// handle grid
					x = floor((mouse_x - other.WC_drag_offset[0]) / other.WC_drag_grid[0]) * other.WC_drag_grid[0];
					y = floor((mouse_y - other.WC_drag_offset[1]) / other.WC_drag_grid[1]) * other.WC_drag_grid[1];
				}
				
				// handle frozen position
				for(var i = 0; i < ds_list_size(WC_frozen); i++)
				{
					var frozen = WC_frozen[|i];
					if instance_exists(frozen[0]) && frozen[0].id == WC_drag_inst.id
					{
						if frozen[1] == "x"
							WC_frozen[|i][2] = WC_drag_inst.x;
						if frozen[2] == "y"
							WC_frozen[|i][2] = WC_drag_inst.y;
					}
				}
			}
			
			// delete or cancel
			if rel
				WC_drag_inst = noone;
			else if mouse_check_button_pressed(mb_right) && WC_drag_inst != noone
			{
				if !WC_drag_alt
					instance_destroy(WC_drag_inst, !keyboard_check(vk_control));
				WC_drag_inst = noone;
			}
			
			// duplicate
			else if (mouse_check_button(mb_left) && mouse_check_button_pressed(mb_middle))
			or (keyboard_check(vk_control) && mouse_check_button(mb_middle))
			{
				var copy = noone;
				with WC_drag_inst
					copy = instance_copy(false);
				
				if WC_drag_alt
				{
					with copy
					{
						x = floor((mouse_x - other.WC_drag_offset[0]) / other.WC_drag_grid[0]) * other.WC_drag_grid[0];
						y = floor((mouse_y - other.WC_drag_offset[1]) / other.WC_drag_grid[1]) * other.WC_drag_grid[1];
					}
				}
			}
		}
	}
	else
		WC_drag_inst = noone;
	
	#endregion
	#region instance selection mode
	
	switch WC_select_mode
	{
		case -1:
			WC_select_inst = noone; 
			break;
		
		case WC_select_modes.create:
			if mouse_check_button_pressed(mb_left) or (mouse_check_button(mb_left) && keyboard_check(vk_control))
				instance_create(floor(mouse_x / WC_drag_grid[0]) * WC_drag_grid[0], floor(mouse_y / WC_drag_grid[1]) * WC_drag_grid[1], WC_select_inst);
			break;
		
		default:
			WC_select_inst = collision_point(mouse_x, mouse_y, all, false, false);
			
			// make sure you select the baddie instead of its collision
			if WC_select_inst && WC_select_inst.object_index == obj_baddiecollisionbox && !keyboard_check(vk_shift)
			{
				if instance_exists(WC_select_inst.baddieID)
					WC_select_inst = WC_select_inst.baddieID;
			}
			
			// select
			if WC_select_inst && mouse_check_button_pressed(mb_left)
			{
				switch WC_select_mode
				{
					default: show_message("Boop"); break;
					
					case WC_select_modes.debugview:
						WC_debugview = true;
						WC_debugview_target = WC_select_inst;
						WC_debugview_scroll = 0;
						break;
					
					case WC_select_modes.variable:
						var variable = get_string("Selected " + object_get_name(WC_select_inst.object_index) + "\nInput variable name here", "");
						if variable == ""
							WC_select_mode = -1;
						else
						{
							if variable_instance_exists(WC_select_inst, variable)
								var value = get_string("Overwriting existing value in " + variable + " to...", string(variable_instance_get(WC_select_inst, variable)));
							else
								var value = get_string("Creating new variable " + variable + " with value...", "");
							
							consoleString = "var " + string(get_instid(WC_select_inst)) + " " + variable + " " + value;
							_execute_script(_input_string_split(consoleString));
							consoleString = "";
						}
						break;
				}
				WC_select_mode = -1;
			}
			break;
	}
	
	// cancel
	if mouse_check_button_pressed(mb_right)
		WC_select_mode = -1;
	
	#endregion
}

function WCscr_drawmask(xx = x, yy = y)
{
	var _mask = mask_index == -1 ? sprite_index : mask_index;
	
	// Get the unmodified mask data
	var _b1 = sprite_get_bbox_left(_mask) * image_xscale;
	var _b2 = sprite_get_bbox_top(_mask) * image_yscale;
	var _b3 = (sprite_get_bbox_right(_mask) + 1) * image_xscale;
	var _b4 = (sprite_get_bbox_bottom(_mask) + 1) * image_yscale;
	
	var _xoff = sprite_get_xoffset(_mask) * image_xscale;
	var _yoff = sprite_get_yoffset(_mask) * image_yscale;
	
	// Get the unmodified vector for each corner
	var _dis1 = point_distance(_xoff, _yoff, _b1, _b2);
	var _dir1 = point_direction(_xoff, _yoff, _b1, _b2);
	var _dis2 = point_distance(_xoff, _yoff, _b3, _b2);
	var _dir2 = point_direction(_xoff, _yoff, _b3, _b2);
	var _dis3 = point_distance(_xoff, _yoff, _b3, _b4);
	var _dir3 = point_direction(_xoff, _yoff, _b3, _b4);
	var _dis4 = point_distance(_xoff, _yoff, _b1, _b4);
	var _dir4 = point_direction(_xoff, _yoff, _b1, _b4);

	// Now modify the vectors using the current position and image angle
	var _x1 = lengthdir_x(_dis1, image_angle + _dir1);
	var _y1 = lengthdir_y(_dis1, image_angle + _dir1);
	var _x2 = lengthdir_x(_dis2, image_angle + _dir2);
	var _y2 = lengthdir_y(_dis2, image_angle + _dir2);
	var _x3 = lengthdir_x(_dis3, image_angle + _dir3);
	var _y3 = lengthdir_y(_dis3, image_angle + _dir3);
	var _x4 = lengthdir_x(_dis4, image_angle + _dir4);
	var _y4 = lengthdir_y(_dis4, image_angle + _dir4);
			
	draw_primitive_begin(pr_trianglefan);
	draw_vertex(xx + _x1, yy + _y1);
	draw_vertex(xx + _x2, yy + _y2);
	draw_vertex(xx + _x3, yy + _y3);
	draw_vertex(xx + _x4, yy + _y4);
	draw_primitive_end();
}

function WCscr_drawobject(instance, alpha = 0.75)
{
	// redraw sprite
	if sprite_exists(instance.sprite_index)
	{
		var xscale = instance.image_xscale, yscale = instance.image_yscale;
		if variable_instance_exists(instance, "xscale")
			xscale = instance.xscale;
		if variable_instance_exists(instance, "yscale")
			yscale = instance.yscale;
		draw_sprite_ext(instance.sprite_index, instance.image_index, instance.x, instance.y, xscale, yscale, instance.image_angle, instance.image_blend, alpha);
	}
}

function scr_wc_draw()
{
	draw_set_font(consoleFont);
	
	#region dragging instance
	
	if instance_exists(WC_drag_inst)
	{
		var drawmask = WCscr_drawmask;
		
		with WC_drag_inst
		{
			var xp = x, yp = y;
		
			x = floor((mouse_x - other.WC_drag_offset[0]) / other.WC_drag_grid[0]) * other.WC_drag_grid[0];
			y = floor((mouse_y - other.WC_drag_offset[1]) / other.WC_drag_grid[1]) * other.WC_drag_grid[1];
		}
		
		// draw spr
		WCscr_drawobject(WC_drag_inst);
		
		// mask
		draw_set_colour(WC_drag_alt ? c_aqua : c_red);
		draw_set_alpha(0.25);
		with WC_drag_inst
			drawmask();
		draw_set_alpha(1);
		
		// resetti positioni
		with WC_drag_inst
		{
			x = xp;
			y = yp;
		}
	}
	
	#endregion
	#region selecting instance
	
	if WC_select_mode != -1
	{
		// make color
		var col = c_white;
		switch WC_select_mode
		{
			case WC_select_modes.debugview:
				col = merge_colour(c_white, c_orange, 0.35);
				break;
		}
		draw_set_colour(col);
		
		// make text
		var text = "Select object", xx = mouse_x, yy = mouse_y;
		if WC_select_mode == WC_select_modes.create
		{
			xx = floor(mouse_x / WC_drag_grid[0]) * WC_drag_grid[0];
			yy = floor(mouse_y / WC_drag_grid[1]) * WC_drag_grid[1];
			
			text = "Spawn here";
			
			var objspr = object_get_sprite(WC_select_inst);
			if sprite_exists(objspr)
			{
				text = "";
				draw_sprite_ext(object_get_sprite(WC_select_inst), 0, xx, yy, 1, 1, 0, c_white, 0.5);
			}
		}
		else if instance_exists(WC_select_inst)
		{
			text = object_get_name(WC_select_inst.object_index);
			xx += choose(1, -1);
			
			draw_set_flash(true, col);
			WCscr_drawobject(WC_select_inst, abs(sin(current_time / 500)) * 0.5);
			draw_set_flash(false);
		}
		
		// draw it
		draw_set_align(fa_center, fa_middle);
		draw_text_outline(xx, yy, text);
		draw_set_align();
	}
	
	#endregion
	#region show invisible
	
	if WC_showinvisible > 0
	{
		var drawobject = WCscr_drawobject;
		with all
		{
			if sprite_exists(sprite_index)
				drawobject(id);
			else if other.WC_showinvisible == 2
			{
				draw_set_alpha(1);
				draw_set_colour(c_white);
				draw_set_align(fa_center, fa_middle);
				draw_text_outline(x, y, object_get_name(object_index));
				draw_set_align();
			}
		}
	}
	
	#endregion
	#region debug view
	
	if WC_debugview && instance_exists(WC_debugview_target)
	{
		// draw its mask
		if !(instance_exists(WC_drag_inst) && WC_drag_inst.id == WC_debugview_target.id)
		{
			var drawmask = WCscr_drawmask;
			
			draw_set_alpha(0.5);
			draw_set_colour(c_red);
			with WC_debugview_target
				drawmask();
			draw_set_alpha(1);
		}
		
		// draw the sprite
		if !WC_debugview_target.visible or WC_debugview_target.image_alpha <= 0
			WCscr_drawobject(WC_debugview_target);
		
		// and draw the center of the object
		draw_set_colour(c_red);
		draw_rectangle(WC_debugview_target.x - 1, WC_debugview_target.y - 1, WC_debugview_target.x + 1, WC_debugview_target.y + 1, false);
	}
	
	#endregion
}

function scr_wc_drawgui()
{
	draw_set_font(consoleFont);
	
	// vars
	var mousex = device_mouse_x_to_gui(0), mousey = device_mouse_y_to_gui(0);
	var wincol = c_black, txtcol = c_white;
	var guiwidth = display_get_gui_width(), guiheight = display_get_gui_height();
	
	#region debug view
	
	show_debug_overlay(WC_debugview);
	if WC_debugview
	{
		draw_set_align();
		draw_set_colour(c_white);
		
		draw_text_outline(4, 24, "room: " + room_get_name(room) + " (" + string(room) + ")" +
		"\nfps: " + string(fps) + " instances: " + string(instance_number(all)));
		
		if instance_exists(WC_debugview_target) or WC_debugview_target == global
		{
			if WC_debugview_target != global
			{
				var str = "\n\n\nSelected " + object_get_name(WC_debugview_target.object_index) + " (id: " + string(WC_debugview_target.id) + ")";
				str += "\nx: " + string(WC_debugview_target.x);
				str += "\ny: " + string(WC_debugview_target.y);
				
				if WC_debugview_target.sprite_index == -1
					str += "\nsprite_index: none";
				else
					str += "\nsprite_index: " + sprite_get_name(WC_debugview_target.sprite_index) + " (" + string(WC_debugview_target.sprite_index) + ")";
				str += "\nimage_index: " + string(WC_debugview_target.image_index);
				str += "\nimage_xscale: " + string(WC_debugview_target.image_xscale);
				str += "\nimage_yscale: " + string(WC_debugview_target.image_yscale);
				
				if WC_debugview_target.mask_index == -1
					str += "\nmask_index: none";
				else
					str += "\nmask_index: " + sprite_get_name(WC_debugview_target.mask_index) + " (" + string(WC_debugview_target.mask_index) + ")";
				
				for (var c = 0; c <= 11; c++)
				{
					if WC_debugview_target.alarm[c] > -1
						str += "\nalarm[" + string(c) + "]: " + string(WC_debugview_target.alarm[c]);
				}
			
				draw_text_outline(4, 24, str);
			}
			
			draw_set_halign(fa_right);
			var objvars = variable_instance_get_names(WC_debugview_target);
		
			if array_length(objvars) == 0
				draw_text_outline(display_get_gui_width(), 4, "No variables");
			else
			{
				WC_debugview_scroll = clamp(WC_debugview_scroll, 0, max(array_length(objvars) - 32, 0));
				for (var b = WC_debugview_scroll; b < min(WC_debugview_scroll + 33, array_length(objvars)); b++)
				{
					var getvar = variable_instance_get(WC_debugview_target, objvars[b]);
					
					draw_set_colour(c_white);
					if string_char_at(string(getvar), 1) == "-"
						draw_set_colour(merge_colour(c_white, c_red, 0.5));
					var todraw = string_replace_all(string(getvar), "\n", "\\n");
					
					if b <= 32 + WC_debugview_scroll
						draw_text_outline(956, ((b - WC_debugview_scroll) * 16) + 4, objvars[b] + ": " + todraw);
				}
				
				if keyboard_check_pressed(vk_pageup)
				{
					WC_debugview_scroll -= 32;
					if WC_debugview_scroll < 0
						WC_debugview_scroll = 0;
				}
				if keyboard_check_pressed(vk_pagedown)
				{
					WC_debugview_scroll += 32;
					if WC_debugview_scroll > array_length(objvars) - 32
						WC_debugview_scroll = array_length(objvars) - 32;
				}
			}
		}
		else
			WC_debugview_target = noone;
	}
	else
		WC_debugview_target = noone;
	
	#endregion
	#region windows
	
	for(var i = 0; i < ds_list_size(WC_win_list); i++)
	{
		var win = WC_win_list[|i];
		with win
		{
			var focused = other.WC_win_focus == self;
		
			// move window
			if focused && (mousey < win_y or win_moving) && !win_resize
			{
				if mouse_check_button(mb_left)
				{
					if !win_moving
					{
						WC_win_dragx = mousex - win_x;
						WC_win_dragy = mousey - win_y;
						win_moving = true;
					}
					win_x = mousex - WC_win_dragx;
					win_y = mousey - WC_win_dragy;
					
					// snap window to screen sides
					win_x = clamp(win_x, 0, guiwidth - win_width);
					win_y = clamp(win_y, 32, guiheight - win_height);
				}
				else
					win_moving = false;
				
				if mouse_check_button(mb_right) && win_moving
				{
					delete win;
					other.WC_win_focus = -1;
					ds_list_delete(other.WC_win_list, i);
					continue;
				}
			}
			else
				win_moving = false;
		
			// resize window
			if (mousex < win_x + win_width + 4 && mousex >= win_x + win_width - 4
			&& mousey < win_y + win_height + 4 && mousey >= win_y + win_height - 4 && !win_moving)
			or (win_resize && mouse_check_button(mb_left))
			{
				if win_resize or !other.WCscr_overconsole()
					window_set_cursor(cr_size_nwse);
				if focused && mouse_check_button(mb_left)
				{
					if !win_resize
					{
						WC_win_dragx = mousex - win_width;
						WC_win_dragy = mousey - win_height;
						win_resize = true;
					}
					win_width = max(mousex - WC_win_dragx, 16);
					win_height = max(mousey - WC_win_dragy, 16);
				}
				else
					win_resize = false;
			}
			else
				win_resize = false;
		
			// draw
			if !surface_exists(win_surf)
				win_surf = surface_create(1, 1);
			else
			{
				// window content
				surface_resize(win_surf, win_width, win_height);
			
				surface_set_target(win_surf);
				draw_clear_alpha(wincol, 0.35);
				draw_set_colour(txtcol);
				draw();
				surface_reset_target();
			
				draw_surface(win_surf, win_x, win_y);
			
				// window top
				draw_set_colour(wincol);
				draw_set_alpha(focused ? 0.6 : 0.45);
				draw_rectangle(win_x, win_y, win_x + win_width - 1, win_y - 32, false);
			
				draw_set_colour(txtcol);
				draw_text(win_x + 6, win_y - 33 + floor(string_height("M") / 2), win_title);
			
				draw_set_alpha(1);
			}
		}
	}
	
	#endregion
	#region dragging
	
	if instance_exists(WC_drag_inst)
	{
		draw_set_color(WC_drag_alt ? merge_colour(c_aqua, c_white, 0.75) : c_white);
		draw_set_align(fa_center, fa_top);
		
		var dragtext = "Dragging ";
		if mouse_check_button(mb_middle) && keyboard_check(vk_control)
			dragtext = "Duplicating ";
		var postext = "x" + string(WC_drag_inst.x) + " y" + string(WC_drag_inst.y);
		if WC_drag_alt
			postext += "  >  x" + string(floor((mouse_x - other.WC_drag_offset[0]) / other.WC_drag_grid[0]) * other.WC_drag_grid[0]) + " y" + string(floor((mouse_y - other.WC_drag_offset[1]) / other.WC_drag_grid[1]) * other.WC_drag_grid[1]);
		draw_text_outline(guiwidth / 2, 0, dragtext + object_get_name(WC_drag_inst.object_index) + "\n" + postext);
	}
	
	#endregion
	#region selecting instance
	
	if WC_select_mode != -1
	{
		draw_set_color(c_white);
		draw_set_align(fa_center, fa_top);
		draw_text_outline(guiwidth / 2, 0, "Right click to cancel");
	}
	
	#endregion
}
