var player = instance_place(x, y, obj_player);
if player
{
	if !oneway
	{
		if !in_saveroom(id)
		{
			if !done && global.gameplay == gameplay.remix
			{
				audio_stop_sound(sfx_collectgiantpizza);
				audio_stop_sound(sfx_secretwall);
				scr_soundeffect(sfx_secretwall);
			}
			ds_list_add(global.saveroom, id);
		}
		alpha = Approach(alpha, 0, 0.05);
	}
}
else if alpha < 1
{
	alpha = Approach(alpha, 1, 0.05);
	if alpha >= 1 && oneway && !done
	{
		with instance_create(x, y, obj_solid)
		{
			image_xscale = other.image_xscale;
			image_yscale = other.image_yscale;
		}
		done = true;
		depth = 90;
	}
}
