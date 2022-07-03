// smooth
function outback(arg0, arg1, arg2, arg3)
{
	var _s = 1;

	arg0 = arg0/arg3 - 1;
	return arg2 * (arg0 * arg0 * ((_s + 1) * arg0 + _s) + 1) + arg1;
}
function incubic(arg0, arg1, arg2, arg3) {
	return arg2 * power(arg0/arg3, 3) + arg1;
}

// background
var color = make_color_rgb(121, 103, 151);

if con == 0
{
	t = min(t + 0.05, 2);
	
	if surface_exists(pizzasurf)
	{
		surface_set_target(pizzasurf);
		draw_clear_alpha(c_black, 0);
		
		var size = outback(min(t, 1), 0, 1, 1) * 560;
		draw_set_alpha(0.9);
		draw_circle_color(960 / 2, 540 / 2, size, color, color, false);
		
		var f1 = ceil(960 / 64) + 1, f2 = ceil(540 / 64) + 1, xx = floor(x), yy = floor(y);
		if t < 2
		{
			for(var i = -1; i < f1; i++)
			{
				for(var j = -1; j < f2; j++)
				{
					var size2 = outback(clamp(t - (i / 15), 0, 1), 0, 1, 1);
					draw_sprite_ext(pizza, 0, xx + i * 64, yy + j * 64, size2, size2, 0, c_white, 0.25);
				}
			}
		}
		else
			draw_sprite_tiled_ext(pizza, 0, xx - 32, yy - 32, 1, 1, c_white, 0.25);
		
		surface_reset_target();
		draw_surface_ext(pizzasurf, 0, 0, 1, 1, 0, c_white, 1);
	}
	else
		pizzasurf = surface_create(960, 540);
}
else if con == 1
{
	t = min(t + 0.1, 1);
	
	if surface_exists(pizzasurf)
	{
		surface_set_target(pizzasurf);
		draw_clear_alpha(c_black, 0);
		
		var size = outback(1 - t, 0, 1, 1) * 560;
		draw_set_alpha(0.9);
		draw_circle_color(960 / 2, 540 / 2, size, color, color, false);
		
		draw_sprite_tiled_ext(pizza, 0, floor(x) - 32, floor(y) - 32, 1, 1, c_white, 0.25 * (1 - clamp(t, 0, 1)));
		
		surface_reset_target();
		draw_surface_ext(pizzasurf, 0, 0, 1, 1, 0, c_white, 1);
	}
	else
		pizzasurf = surface_create(960, 540);
	
	if t >= 1
		instance_destroy();
}

y = (y - 0.5) % 64;
x = (x + 0.5) % 64;

talpha = abs(-con + clamp(t, 0, 1));
if basetext
{
	// text
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(titlefont);
	draw_text_auto((960 / 2) + random_range(-1, 1), 540 - 100, palname,,,talpha);
	draw_set_font(descfont);
	draw_text_auto(960 / 2, 540 - 64, paldesc, 16, 960 - 32, talpha);
}
draw_set_alpha(1);

// coop
if global.coop
{
	draw_set_font(global.font_small);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_colour(c_ltgray);
	
	var cooptext = "";
	if playerid.object_index == obj_player1
		cooptext = "Player 1";
	if playerid.object_index == obj_player2
		cooptext = "Player 2";
	
	draw_text_auto(960 / 2, 32, cooptext,,,talpha);
}
