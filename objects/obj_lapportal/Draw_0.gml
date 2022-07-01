if (sprite_index != spr_pizzaportal)
{
	pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, 0)
	draw_self()
	pal_swap_reset()
}
else
	draw_self()
