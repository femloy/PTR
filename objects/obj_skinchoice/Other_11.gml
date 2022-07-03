if playerid.state == states.normal
{
	var prev = playerid.character;
	with playerid
	{
		shot = false;
		pogochargeactive = false;
			
		character = other.sel[1];
		scr_characterspr();
		sprite_index = spr_idle;
		scr_changetoppings();
		
		noisetype = other.noisetype;
		
		if character != prev
		or paletteselect != other.sel[0]
		{
			instance_create(x, y, obj_genericpoofeffect);
			if global.gameplay != 0 && character != prev
			{
				with obj_tv
				{
					if sprite_index != spr_tv_open
						tvsprite = idlespr;
				}
			}
		}
		paletteselect = other.sel[0];
	}
	scr_soundeffect(sfx_collecttoppin);
	
	selected = true;
	if spr_select != spr_idle
		img = 0;
	
	t = 2;
	con = 0;
}
