if instance_number(object_index) > 1
{
	trace("Extra obj_parallax in ", room_get_name(room), "!");
	instance_destroy();
}

bg = bg_desert
bg2 = bg_null
bg3 = bg_null
backgrounds = ["Backgrounds_still1", "Backgrounds_still2"]
global.roombgs = ds_list_create();
