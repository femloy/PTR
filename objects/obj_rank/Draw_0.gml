var textspr = asset_get_index(sprite_get_name(sprite_index) + "_text");
if sprite_exists(textspr)
	draw_sprite_ext(textspr, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

if global.collect >= global.collectN
	pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, 0)
if global.collectN > global.collect
	pal_swap_set(obj_player2.spr_palette, obj_player2.paletteselect, 0)
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
pal_swap_reset()
