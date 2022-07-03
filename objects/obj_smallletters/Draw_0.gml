switch negative
{
	case 0:
		draw_set_color(make_colour_rgb(255, 255, 255))
		break
	case 1:
		draw_set_color(make_colour_rgb(248, 0, 0))
		break
}

draw_set_font(global.smallfont)
draw_set_halign(fa_center)
shader_reset()
if flash
{
	draw_set_flash(true)
	draw_text(x, y, letters)
	draw_set_flash(false)
}
else
	draw_text(x, y, letters)
