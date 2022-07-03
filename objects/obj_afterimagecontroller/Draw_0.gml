for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
	var b = ds_list_find_value(global.afterimage_list, i)
	with (b)
	{
		if visible
		{
			var a = other.alpha[identifier]
			if identifier == afterimage.firemouth
			{
				a = alpha
				draw_set_flash(true, make_colour_rgb(255 * 0.97, 255 * 0.43, 255 * 0.09));
			}
			else if identifier == afterimage.blue
			{
				a = alpha
				draw_set_flash(true, make_colour_rgb(255 * 0.17, 255 * 0.49, 255 * 0.9));
			}
			else if identifier == afterimage.blur
			{
				a = alpha
				if instance_exists(playerid)
				{
					if playerid != noone
						pal_swap_set(playerid.spr_palette, playerid.paletteselect, 0)
				}
			}
			
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, image_blend, a)
			pal_swap_reset()
			draw_set_flash(false)
		}
	}
}
