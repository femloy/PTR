var _obj = id
with (other)
{
	if (scr_transformationcheck() or state == states.tumble)
	{
		if ((state != states.bump or sprite_index != spr_player_catched) && (state != states.tumble or xscale != _obj.image_xscale) && state != states.knightpep && state != states.knightpepslopes && state != states.backbreaker && state != states.gotoplayer)
		{
			state = states.tumble
			xscale = sign(other.image_xscale)
			mask_index = spr_crouchmask
			movespeed = 14
			vsp = 0
			sprite_index = spr_tumble
			other.image_index = 0
			other.sprite_index = spr_goblinbot_kick
			var _max = 46
			y = (other.y - _max)
			if place_meeting(x, y, obj_platform)
				y--
			if scr_solid(x, y)
			{
				for (var i = 0; i <= _max; i++)
				{
					if scr_solid(x, y)
						x += xscale
				}
			}
			if scr_solid(x, y)
			{
				for (var i = 0; i <= _max; i++)
				{
					if scr_solid(x, y)
						y++
				}
			}
		}
	}
}
