if selected
{
	xoffset = lerp(xoffset, 0, 0.25);
	yoffset = lerp(yoffset, 0, 0.25);
	exit;
}
event_inherited();

if instance_exists(obj_racecountdown) && con != 1
{
	scr_soundeffect(sfx_diagclose);
	t = 0;
	con = 1;
}
if con == 1
	exit;

if sel[1] == "N" && key_taunt2
{
	scr_soundeffect(sfx_step);
	noisetype = !noisetype;
}

// change character
var lastchar = "N";
if key_down2 && sel[1] != lastchar
{
	if debug
	{
		surface_free(palsurf);
		scr_soundeffect(sfx_step);
	
		yoffset = 100;
		switch sel[1]
		{
			case "P":
				sel[1] = "N";
				break;
			case "N":
				sel[1] = "V";
				break;
			case "V":
				sel[1] = "S";
				break;
			case "S":
				sel[1] = "PP"; // to pissino
				break;
		}
		event_user(0);
	}
	else
		scr_soundeffect(sfx_denied);
}
else if key_up2 && sel[1] != "P"
{
	surface_free(palsurf);
	scr_soundeffect(sfx_step);
	
	yoffset = -100;
	switch sel[1]
	{
		case "N":
			sel[1] = "P";
			break;
		case "V":
			sel[1] = "N";
			break;
		case "S":
			sel[1] = "V";
			break;
		case "PP":
			sel[1] = "S";
			break;
	}
	event_user(0);
}
