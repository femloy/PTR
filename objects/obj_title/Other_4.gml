if object_index == obj_title
{
	with obj_player
	{
		sprite_index = spr_file2;
		image_speed = 0.35;
		state = states.actor;
		xscale = 1;
	}
	with obj_tv
	{
		alarm[0] = -1;
		event_perform(ev_alarm, 0);
	}
}
