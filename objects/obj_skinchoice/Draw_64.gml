// background
event_inherited();

// draw the skins
var _spr = selected ? spr_select : spr_idle;
if selected
	_spr = spr_select;
var _sprno = sprite_get_number(_spr);

img += sprite_get_speed(_spr) * 0.35;
if img >= _sprno or (selected && img >= 10)
{
	if selected && con != 1
	{
		t = 0;
		con = 1;
	}
	if img >= _sprno
		img -= _sprno;
}

if sel[1] == "N"
{
	if _spr != spr_select or spr_idle == spr_select
	{
		if noisetype == 1
			_spr = spr_playerN_mach;
		if noisetype == 0
			_spr = spr_playerN_pogofall;
	}
}

if sel[0] != -1
{
	if sprite_exists(spr_palette)
		pal_swap_set(spr_palette, sel[0], false);
}
else
{
	/*
	if !surface_exists(palsurf)
		custompal_update(palcolors);
	else
		pal_swap_set(palsurf, 1, true);
	*/
}
if sprite_exists(_spr)
	draw_sprite_ext(_spr, img, (960 / 2) + xoffset, (540 / 2) + yoffset, 2, 2, 0, (locked ? merge_colour(c_white, c_black, 0.75) : c_white), ((100 - abs(xoffset) - abs(yoffset)) / 100) * talpha);

draw_set_colour(c_white);
draw_set_font(global.bigfont);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

pal_swap_reset();
if locked
	draw_text_auto((960 / 2) + xoffset, ((540 / 2) + yoffset) - sprite_get_height(_spr), "Locked",,,talpha);

// text
if sel[0] == -1
{
	/*
	palname = "CUSTOM PALETTE";
	paldesc = "Sky's the limit.";
	if !locked
		paldesc += "\nPress SHIFT to customize.";
	*/
	
	sel[0] = 0;
}
else
{
	try
	{
		palname = selarray[sel[0]][0];
		paldesc = selarray[sel[0]][1];
	}
	catch (e)
	{
		palname = "Palette";
		paldesc = "loypoll please add details";
		e = "";
	}
}
