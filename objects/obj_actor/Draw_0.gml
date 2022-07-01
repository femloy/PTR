if use_palette
{
	pal_swap_set(spr_palette, paletteselect, 0)
	draw_self()
	pal_swap_reset()
}
else
	draw_self()
