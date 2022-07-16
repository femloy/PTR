// for the peppino clone
if sprite_exists(spr_palette)
	pal_swap_set(spr_palette, paletteselect, false);
draw_self();
pal_swap_reset();
