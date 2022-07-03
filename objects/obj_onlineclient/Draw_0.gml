if !instance_exists(obj_rank)
{
	// draws your own username
	with obj_player1
	{
		draw_set_colour(c_white);
		draw_set_font(global.font_small);
		draw_set_align(fa_center, fa_top);
	
		var yy = clamp(sprite_get_bbox_top(sprite_index) + y - 75, 0, room_height - 16);
		draw_text(x, yy, other.username);
	}
}
