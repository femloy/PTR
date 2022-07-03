if is_bossroom() or room == editor_room
	exit;
if global.kungfu
	draw_sprite(spr_pizzahealthbar, 8 - global.hp, 190, 70)

if obj_player.state != states.gameover
{
	if obj_player.x < 250 && obj_player.y < 169
		hud_posY = Approach(hud_posY, -300, 15)
	else
		hud_posY = Approach(hud_posY, 0, 15)
	
	pizzascore_index = (pizzascore_index + (0.25 * global.stylethreshold)) % pizzascore_number;
	if global.stylethreshold <= 0
	{
		if floor(pizzascore_index) != 0
			pizzascore_index += 0.35
		else
			pizzascore_index = 0
	}
	
	var sw = sprite_get_width(spr_heatmeter_fill)
	var sh = sprite_get_height(spr_heatmeter_fill)
	var b = global.stylemultiplier
	var hud_xx = 121 + irandom_range(-collect_shake, collect_shake)
	var hud_yy = 70 + irandom_range((-collect_shake), collect_shake) + hud_posY
	
	// heat meter
	draw_sprite_part(spr_heatmeter_fill, pizzascore_index, 0, 0, (sw * b), sh, (hud_xx - 95), (hud_yy + 24))
	pal_swap_set(spr_heatmeter_palette, global.stylethreshold, 0)
	draw_sprite_ext(spr_heatmeter, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
	pal_swap_reset()
	
	// score
	draw_sprite_ext(spr_pizzascore, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
	var _score = global.collect
	if global.coop
		_score += global.collectN
	
	if _score >= global.crank
		draw_sprite_ext(spr_pizzascore_pepper, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
	if _score >= global.brank
		draw_sprite_ext(spr_pizzascore_pepperoni, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
	if _score >= global.arank
		draw_sprite_ext(spr_pizzascore_olive, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
	if _score >= global.srank
		draw_sprite_ext(spr_pizzascore_shroom, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
	
	// rank bubble
	var rx = hud_xx + 142
	var ry = hud_yy - 22
	
	var rank_ix = 0
	if global.srank <= 0
		rank_ix = 5
	else if _score >= global.srank
		rank_ix = 4
	else if _score >= global.arank
		rank_ix = 3
	else if _score >= global.brank
		rank_ix = 2
	else if _score >= global.crank
		rank_ix = 1
	
	if check_race()
	{
		rank_ix = floor(global.racerank);
		if instance_exists(obj_racebarrier)
			rank_ix = 5
	}
	
	if previousrank != rank_ix
	{
		previousrank = rank_ix
		rank_scale = 3
	}
	rank_scale = Approach(rank_scale, 1, 0.2)
	
	var spr_w = sprite_get_width(spr_ranks_hudfill)
	var spr_h = sprite_get_height(spr_ranks_hudfill)
	var spr_xo = sprite_get_xoffset(spr_ranks_hudfill)
	var spr_yo = sprite_get_yoffset(spr_ranks_hudfill)
	var perc = 0
	switch rank_ix
	{
		default: perc = 0; break;
		case 3: perc = (_score - global.arank) / (global.srank - global.arank); break;
		case 2: perc = (_score - global.brank) / (global.arank - global.brank); break;
		case 1: perc = (_score - global.crank) / (global.brank - global.crank); break;
		case 0: perc = _score / global.crank; break;
	}
	
	if check_race()
		perc = frac(global.racerank);
	
	var t = spr_h * perc
	var top = spr_h - t
	
	draw_sprite_ext(spr_ranks_hud, rank_ix, rx, ry, rank_scale, rank_scale, 0, c_white, 1)
	draw_sprite_part(spr_ranks_hudfill, rank_ix, 0, top, spr_w, spr_h - top, rx - spr_xo, (ry - spr_yo) + top)
	
	// score
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	draw_set_font(global.collectfont)
	
	var text_y = 0
	switch floor(pizzascore_index)
	{
		case 1:
		case 2:
		case 3:
			text_y = 1
			break
		case 5:
		case 10:
			text_y = -1
			break
		case 6:
		case 9:
			text_y = -2
			break
		case 7:
			text_y = -3
			break
		case 8:
			text_y = -5
			break
	}

	var cs = 0
	with obj_comboend
		cs += comboscore
	var sc = _score - global.comboscore - cs
	var str = string(sc)
	var num = string_length(str)
	var w = string_width(str)
	var xx = hud_xx - (w / 2)
	if lastcollect != sc
	{
		color_array = array_create(num, 0)
		for (var i = 0; i < array_length(color_array); i++)
			color_array[i] = choose(irandom(3))
		lastcollect = sc
	}
	
	draw_set_alpha(alpha)
	for (i = 0; i < num; i++)
	{
		var yy = ((i + 1) % 2 == 0 ? -5 : 0);
		
		var c = color_array[i]
		pal_swap_set(spr_font_palette, c, 0)
		draw_text(xx - 5, hud_yy - 56 + text_y + yy - 7, string_char_at(str, i + 1))
		xx += w / num
	}
	draw_set_alpha(1)
	pal_swap_reset()
	
	// vigilante health
	draw_set_font(global.bigfont)
	draw_set_halign(fa_center)
	draw_set_color(c_white)
	if obj_player1.character == "V"
		draw_text(200 + healthshake, 125 + healthshake, global.playerhealth)
	
	// key inventory
	draw_sprite_ext(spr_inv, -1, 41, 150, 1, 1, 1, c_white, alpha)
	if global.key_inv
		draw_sprite_ext(spr_key, -1, 41, 150, 1, 1, 1, c_white, alpha)
}
