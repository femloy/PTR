if room != player_room or room == rank_room
	exit;

if sprite_exists(sprite_index)
{
	if sprite_exists(spr_palette)
		pal_swap_set(spr_palette, paletteselect, false);
	draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	pal_swap_reset();
}

// username
draw_set_colour(c_white);
draw_set_font(global.font_small);
draw_set_align(fa_center, fa_top);

var spritey = 0;
if sprite_exists(sprite_index)
	spritey = sprite_get_bbox_top(sprite_index);

var yy = clamp(spritey + y - 75, 0, room_height - 16);

// draw it
draw_text(x, yy, name);
