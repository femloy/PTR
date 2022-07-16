if (room == Realtitlescreen or room == rm_eggplantdisclaimer or room == rank_room or room == rm_levelselect or room == rm_onlinerace or room == timesuproom or room == boss_room1 or room == characterselect or room == hub_loadingscreen)
{
	visible = false
	sprite_index = spr_tv_off
}
else
	visible = true
if (instance_exists(obj_debugcontroller) && (!obj_debugcontroller.showhud))
	visible = false

image_speed = 0.35
if (targetgolf != noone && (!instance_exists(targetgolf)))
	targetgolf = -4
if (targetgolf != -4 && (!view_visible[1]))
{
	view_visible[1] = true
	view_enabled = true
}

if (bubblespr != -4 && bubblespr != spr_tv_bubbleclosed)
{
	if (prompt != -4)
		prompt_buffer = 2
	bubbleindex += image_speed
	if (floor(bubbleindex) == sprite_get_number(bubblespr))
	{
		bubbleindex = 0
		switch bubblespr
		{
			case spr_tv_bubbleopen:
				bubblespr = spr_tv_bubble
				break
			case spr_tv_bubbleclose:
				bubblespr = spr_tv_bubbleclosed
				if (prompt == -4 or prompt == "")
					bubblespr = -4
				break
		}

	}
}

var playerobj = (instance_exists(obj_player2) && global.coop && !obj_player1.spotlight ? obj_player2 : obj_player1);
switch state
{
	case states.normal:
		idlespr = spr_tv_idle
		if playerobj.isgustavo
		{
			idlespr = spr_tv_idleG
			if global.panic
				idlespr = spr_tv_escapeG
		}
		
		var _state = playerobj.state
		if _state == states.backbreaker or _state == states.chainsaw
			_state = playerobj.tauntstoredstate
		if _state == states.backbreaker
		{
			with obj_teleporter
			{
				if alarm[0] > -1 or alarm[1] > -1
					_state = storedstate;
			}
			with obj_warplaser
			{
				if alarm[0] > -1 or alarm[1] > -1
					_state = storedstate;
			}
		}
		
		var _transfo = 1
		switch _state
		{
			case states.knightpep:
			case states.knightpepattack:
			case states.knightpepslopes:
				idlespr = spr_tv_knight
				break
			case states.bombpep:
				idlespr = spr_tv_bombpep
				break
			case states.fireass:
				idlespr = spr_tv_fireass
				if (playerobj.sprite_index == playerobj.spr_scaredjump1 or playerobj.sprite_index == playerobj.spr_scaredjump2)
					idlespr = spr_tv_scaredjump
				break
			case states.tumble:
				if (playerobj.sprite_index == playerobj.spr_tumble or playerobj.sprite_index == playerobj.spr_tumblestart or playerobj.sprite_index == playerobj.spr_tumbleend)
					idlespr = spr_tv_tumble
				break
			case states.firemouth:
				idlespr = spr_tv_firemouth
				break
			case states.ghost:
			case states.ghostpossess:
				idlespr = spr_tv_ghost
				break
			case states.stunned:
				if (playerobj.sprite_index == playerobj.spr_squished)
					idlespr = spr_tv_squished
				break
			case states.normal:
			case states.jump:
			case states.handstandjump:
			case states.crouch:
			case states.ladder:
				with (playerobj)
				{
					if shotgunAnim
						other.idlespr = spr_tv_shotgun
					else if global.mort
						other.idlespr = spr_tv_mort
				}
				break
			case states.freefallprep:
			case states.freefall:
			case states.freefallland:
				if playerobj.shotgunAnim
					idlespr = spr_tv_shotgun
				break
			case states.pistol:
				if global.mort
					idlespr = spr_tv_mort
				break
			case states.shotgun:
			case states.shotgunfreefall:
			case states.shotgunjump:
			case states.shotgundash:
			case states.shotguncrouch:
			case states.shotguncrouchjump:
				idlespr = spr_tv_shotgun
				break
			case states.barrel:
				idlespr = spr_tv_barrel
				break
			case states.golf:
				idlespr = spr_tv_golf
				break
			case states.rocket:
				idlespr = spr_tv_rocket
				break
			case states.cheeseball:
				idlespr = spr_tv_cheeseball
				break
			case states.cheesepep:
			case states.cheesepepstick:
			case states.cheesepepstickside:
			case states.cheesepepstickup:
				idlespr = spr_tv_cheesepep
				break
			case states.boxxedpep:
			case states.boxxedpepjump:
			case states.boxxedpepspin:
				idlespr = spr_tv_boxxedpep
				break
			case states.mach2:
			case states.climbwall:
			case states.machroll:
			case states.grind:
				if playerobj.skateboarding
					idlespr = spr_tv_clown
				break
			default:
				_transfo = 0
				break
		}
		if !_transfo
		{
			with playerobj
			{
				if (mach4mode == 1)
					tv_do_expression(spr_tv_exprmach4)
				else if (state == states.mach3 or sprite_index == spr_mach3boost)
					tv_do_expression(spr_tv_exprmach3)
				else if (state == states.hurt)
					tv_do_expression(spr_tv_exprhurt)
				else if (state == states.ratmounthurt)
					tv_do_expression(spr_tv_hurtG)
				else if (global.combo >= 3 && (!playerobj.isgustavo))
					tv_do_expression(spr_tv_exprcombo)
				else if (global.stylethreshold >= 3 && (!playerobj.isgustavo))
					tv_do_expression(spr_tv_exprheat)
			}
		}
		switch animset
		{
			case spr_tv_off:
				if visible
				{
					animset = spr_tv_open
					image_index = 0
				}
				break
			
			case spr_tv_open:
				if (floor(image_index) == (image_number - 1))
					animset = idlespr
				break
			
			case spr_tv_idle:
				if (idleanim > 0)
					idleanim--
				if (animset != idlespr)
					animset = idlespr
				if (idleanim <= 0 && floor(image_index) == (image_number - 1))
				{
					animset = choose(spr_tv_idleanim1, spr_tv_idleanim2)
					image_index = 0
				}
				break
			
			case spr_tv_idleanim1:
			case spr_tv_idleanim2:
				if (floor(image_index) == (image_number - 1))
				{
					animset = idlespr
					idleanim = (240 + (60 * irandom_range(-1, 2)))
				}
				if (idlespr != spr_tv_idle && idlespr != spr_tv_idleN)
					animset = idlespr
				break
			
			default:
				animset = idlespr
		}
		
		if animset != spr_tv_open
		{
			if !ds_list_empty(tvprompts_list)
			{
				if (bubblespr == spr_tv_bubbleclosed or bubblespr == noone)
				&& prompt_buffer <= 0
				{
					var b = ds_list_find_value(tvprompts_list, 0)
					prompt_buffer = prompt_max
					if (b[0] != "" && b[0] != -4)
					{
						bubblespr = spr_tv_bubbleopen
						bubbleindex = 0
						prompt = b[0]
						promptspd = b[3]
						promptx = promptxstart
					}
					else
					{
						if (bubblespr != -4 && bubblespr != spr_tv_bubbleclosed)
							bubblespr = spr_tv_bubbleclose
						if (bubblespr == spr_tv_bubbleclosed)
							bubblespr = -4
						bubbleindex = 0
						promptx = promptxstart
						prompt = -4
					}
					if (b[1] == tvprompt.normal)
					{
						animset = spr_tv_open
						image_index = 0
						tvsprite = b[2]
					}
					else
					{
						tvsprite = b[2]
						animset = tvsprite
						image_index = 0
					}
					state = states.transitioncutscene
				}
				
				if animset != spr_tv_open
				{
					if tvsprite != spr_tv_idleanim1 && tvsprite != spr_tv_idleanim2
						animset = tvsprite;
						
					if prompt_buffer > 0
					{
						prompt_buffer--;
						if prompt_buffer <= 0
						{
							promptx = promptxstart;
							ds_list_delete(tvprompts_list, 0);
						}
					}
				}
			}
			else
				bubblespr = -4
		}
		else
		{
			if floor(image_index) >= image_number - 1
				animset = tvsprite;
		}
		
		if tvsprite != spr_tv_open && animset != spr_tv_open
		&& instance_exists(playerobj) && playerobj.character != "P"
		{
			var spr = sprite_get_name(animset)
			spr = asset_get_index(concat(spr, playerobj.character))
			
			if sprite_exists(spr)
				sprite_index = spr;
			else
				sprite_index = animset;
		}
		else
			sprite_index = animset;
		break
	
	case states.transitioncutscene:
		if animset == spr_tv_off
			animset = spr_tv_open;
		if animset == spr_tv_open && floor(image_index) == image_number - 1
			animset = tvsprite;
		
		var spr = sprite_get_name(animset);
		spr = asset_get_index(spr + string_upper(string(playerobj.character)));
		
		if sprite_exists(spr)
			sprite_index = spr;
		else
			sprite_index = animset;
		
		if animset == tvsprite
			state = states.normal;
		break
	
	case states.tv_whitenoise:
		sprite_index = spr_tv_whitenoise
		if noisebuffer > 0
			noisebuffer--
		else
		{
			noisebuffer = noisemax
			if expressionsprite != -4
				state = states.tv_expression
			else
				state = states.normal
			image_index = 0
		}
		break
	
	case states.tv_expression:
		switch expressionsprite
		{
			case spr_tv_exprhurt:
				if (playerobj.state != states.hurt)
				{
					if (expressionbuffer > 0)
						expressionbuffer--
					else
					{
						state = states.tv_whitenoise
						expressionsprite = -4
					}
				}
				break
			
			case spr_tv_hurtG:
				if (playerobj.state != states.ratmounthurt)
				{
					if (expressionbuffer > 0)
						expressionbuffer--
					else
					{
						state = states.tv_whitenoise
						expressionsprite = -4
					}
				}
				break
			
			case spr_tv_exprcombo:
				if (global.combo < 3 or playerobj.isgustavo)
				{
					state = states.tv_whitenoise
					expressionsprite = -4
					if (playerobj.state == states.hurt)
						tv_do_expression(spr_tv_exprhurt)
				}
				break
			
			case spr_tv_exprcollect:
			case spr_tv_happyG:
				if (expressionbuffer > 0)
					expressionbuffer--
				else
				{
					state = states.tv_whitenoise
					expressionsprite = -4
				}
				break
			
			case spr_tv_exprmach3:
				with (playerobj)
				{
					if (state != states.mach3 && (state != states.chainsaw or tauntstoredstate != states.mach3) && sprite_index != spr_mach3boost && mach4mode == 0)
					{
						other.state = states.tv_whitenoise
						other.expressionsprite = -4
					}
				}
				break
			
			case spr_tv_exprmach4:
				with (playerobj)
				{
					if (mach4mode == 0)
					{
						other.state = states.tv_whitenoise
						other.expressionsprite = -4
					}
				}
				break
			
			case spr_tv_exprheat:
				_transfo = 0
				with (playerobj)
				{
					if (!scr_transformationcheck())
						_transfo = 1
					if isgustavo
						_transfo = 1
				}
				if (global.stylethreshold < 3 or _transfo)
				{
					state = states.tv_whitenoise
					expressionsprite = -4
				}
				break
		}

		if !ds_list_empty(tvprompts_list)
		{
			state = states.tv_whitenoise
			expressionsprite = -4
		}
		else if sprite_exists(expressionsprite) && !(playerobj.character == "P" && playerobj.ispeppino)
		{
			var spr = sprite_get_name(expressionsprite);
			spr = asset_get_index(spr + playerobj.character);
			
			if sprite_exists(spr)
				sprite_index = spr;
			else
				sprite_index = expressionsprite;
			idlespr = sprite_index;
		}
		else if sprite_exists(expressionsprite)
		{
			sprite_index = expressionsprite;
			idlespr = sprite_index;
		}
		break
}

var change_pos = false
with obj_player
{
	if point_in_rectangle(x, y, _camx + _camw - 224, _camy, _camx + _camw, _camy + 187)
		change_pos = true;
	if other.bubblespr != noone && point_in_rectangle(x, y, _camx + _camw - 644, _camy, _camx + _camw, _camy + 101)
		change_pos = true;
}
if instance_exists(obj_fadeout)
	change_pos = false;

var spd = 15
if change_pos
	hud_posY = Approach(hud_posY, -300, spd)
else
	hud_posY = Approach(hud_posY, 0, spd)

pizzaface_index += 0.35
hand_index += 0.35
johnface_index += 0.35
if (global.panic && global.fill > 0)
{
	showtime_buffer = 100
	if (!instance_exists(obj_ghostcollectibles))
		timer_y = Approach(timer_y, timer_ystart, 1)
	else
		timer_y = Approach(timer_y, (timer_ystart + 212), 4)
}
else if global.panic
{
	if (pizzaface_sprite == spr_timer_pizzaface1)
	{
		pizzaface_sprite = spr_timer_pizzaface2
		pizzaface_index = 0
	}
	else if (pizzaface_sprite == spr_timer_pizzaface2)
	{
		if (floor(pizzaface_index) == (sprite_get_number(pizzaface_sprite) - 1))
		{
			pizzaface_sprite = spr_timer_pizzaface3
			pizzaface_index = 0
		}
	}
	else if (showtime_buffer > 0)
		showtime_buffer--
	else
		timer_y = Approach(timer_y, (timer_ystart + 212), 1)
}
else
{
	pizzaface_sprite = spr_timer_pizzaface1
	hand_sprite = spr_timer_hand1
	timer_y = (timer_ystart + 212)
}
if (global.panic && global.fill < (chunkmax / 5))
	hand_sprite = spr_timer_hand2
barfill_x -= 0.2
if (barfill_x < -173)
	barfill_x = 0
if (pizzaface_index > (sprite_get_number(pizzaface_sprite) - 1))
	pizzaface_index = frac(pizzaface_index)
if (hand_index > (sprite_get_number(hand_sprite) - 1))
	hand_index = frac(hand_index)
if (johnface_index > (sprite_get_number(johnface_sprite) - 1))
	johnface_index = frac(johnface_index)
combo_posX = Wave(-5, 5, 2, 20)
if (global.combotime > 0 && global.combo != 0)
{
	switch combo_state
	{
		case 0:
			combo_posY += combo_vsp
			combo_vsp += 0.5
			if (combo_posY > 20)
				combo_state++
			break
		case 1:
			combo_posY = lerp(combo_posY, 0, 0.05)
			if (combo_posY < 1)
			{
				combo_posY = 0
				combo_vsp = 0
				combo_state++
			}
			break
		case 2:
			if (global.combotime < 30)
			{
				combo_posY += combo_vsp
				if (combo_vsp < 20)
					combo_vsp += 0.5
				if (combo_posY > 0)
				{
					combo_posY = 0
					combo_vsp = -1
					if (global.combotime < 15)
						combo_vsp = -2
				}
			}
			else
				combo_posY = Approach(combo_posY, 0, 10)
			break
	}

}
else
{
	combo_posY = Approach(combo_posY, -500, 5)
	combo_vsp = 0
	combo_state = 0
}
combofill_index += 0.35
if (combofill_index > (sprite_get_number(spr_tv_combobubblefill) - 1))
	combofill_index = frac(combofill_index)
