draw_set_alpha(fadealpha)
draw_set_color(c_white)
draw_rectangle(0, 0, (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])), false)
draw_set_alpha(1)

if !instance_exists(obj_rank)
{
	with player
	{
		pal_swap_set(spr_palette, paletteselect, 0)
		draw_sprite_ext(sprite_index, image_index, x, y, xscale * scale_xs, yscale * scale_ys, angle, image_blend, image_alpha)
		pal_swap_reset()
	}
}
