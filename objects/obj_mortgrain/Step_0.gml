with (instance_place((x - 1), y, obj_player))
{
	if (state == states.mort && other.eaten == 0)
	{
		movespeed = abs(movespeed)
		other.eaten = 1
		grav = 0.5
		state = states.normal
	}
}
with (instance_place((x + 1), y, obj_player))
{
	if (state == states.mort && other.eaten == 0)
	{
		movespeed = abs(movespeed)
		other.eaten = 1
		grav = 0.5
		state = states.normal
	}
}
if eaten
{
	x = -100
	y = -100
	sprite_index = spr_corneaten
	if (!in_saveroom(id))
		ds_list_add(global.saveroom, id)
}
