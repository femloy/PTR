if (!in_saveroom(id))
{
	repeat 8
	{
		with create_debris(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), spr_deadjohndebris)
		{
			hsp = random_range(-5, 5)
			vsp = random_range(-10, 10)
		}
	}
	repeat 5
	{
		with instance_create(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), obj_parryeffect)
		{
			sprite_index = spr_deadjohnsmoke
			image_speed = 0.35
		}
	}
	
	scr_sleep(5)
	if audio_is_playing(sfx_breakblock1) or audio_is_playing(sfx_breakblock2)
	{
		audio_stop_sound(sfx_breakblock1)
		audio_stop_sound(sfx_breakblock2)
	}
	scr_soundeffect(sfx_breakblock1, sfx_breakblock2)
	instance_create(x + sprite_width / 2, y + sprite_height / 2, obj_bangeffect)
	ds_list_add(global.saveroom, id)
}
