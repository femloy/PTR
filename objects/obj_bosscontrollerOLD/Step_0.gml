if ((!instance_exists(bossID)) && bossID != noone && state != (98 << 0) && (!fakedeath))
{
    state = (98 << 0)
    alarm[1] = (room_speed * 4)
}
if (player_hp <= 0)
{
    fakedeath = 0
    if (state != (8 << 0) && state != (89 << 0))
    {
        if (endroundfunc != -4)
            endroundfunc()
        depth = (obj_player1.depth + 1)
        state = (8 << 0)
        with (bossID)
            player_destroy(lastplayerid)
    }
    else if (bossID.state != (61 << 0) && state != (89 << 0))
    {
        state = (89 << 0)
        alarm[1] = (room_speed * 4)
    }
}
if instance_exists(bossID)
{
    if (bossID.destroyed && (!fakedeath))
    {
        depth = (bossID.depth + 1)
        state = (8 << 0)
    }
}
switch state
{
    case (144 << 0):
        with (obj_player)
        {
            state = (146 << 0)
            xscale = (x > (room_width / 2) ? -1 : 1)
            image_blend = make_colour_hsv(0, 0, 255)
        }
        with (par_boss)
        {
            state = (146 << 0)
            x = xstart
        }
        if (playerx != 0)
            playerx += 5
        else if (!flashed)
        {
            flash = 1
            flashed = 1
            alarm[2] = (0.15 * room_speed)
        }
        if (bossx != (room_width - sprite_get_width(bossspr)))
            bossx -= 5
        if (vsy != 0)
            vsy += 5
        flamey -= 4
        if (intro_buffer > 0)
            intro_buffer--
        else if use_countdown
            state = (145 << 0)
        else
        {
            state = (0 << 0)
            with (obj_player)
            {
                if (object_index != obj_player2 or global.coop)
                    state = (0 << 0)
            }
            with (par_boss)
                state = (0 << 0)
        }
        break
    case (145 << 0):
        var round_yto = 437
        round_y = Approach(round_y, round_yto, 7)
        if (round_y != round_yto)
            round_x = (round_xstart + irandom_range(-1, 1))
        if (timer_buffer > 0)
        {
            if (bell_buffer > 0)
            {
                if (bell_index > (sprite_get_number(bell_sprite) - 1))
                    bell_index = (sprite_get_number(bell_sprite) - 1)
                bell_buffer--
            }
            else
            {
                bell_sprite = spr_bosstimer_bell
                round_timer = Approach(round_timer, round_timermax, 60)
            }
            timer_buffer--
            instance_destroy(obj_noisebossbomb)
            with (obj_player)
            {
                if (state != (146 << 0) && state != (95 << 0) && state != (137 << 0) && (!instance_exists(obj_fadeout)))
                {
                    if (state == (137 << 0) or state == (61 << 0))
                    {
                        hitLag = 0
                        x = hitX
                        y = hitY
                    }
                    movespeed = 0
                    hsp = 0
                    vsp = 0
                    sprite_index = spr_idle
                    image_speed = 0.35
                    xscale = (x > (room_width / 2) ? -1 : 1)
                    image_blend = make_colour_hsv(0, 0, 255)
                    state = (146 << 0)
                    visible = true
                    image_alpha = 1
                }
                if (state == (146 << 0))
                    state_player_arenaround()
            }
            with (par_boss)
            {
                if (state == (137 << 0) or state == (61 << 0))
                {
                    hitLag = 0
                    x = hitX
                    y = hitY
                }
                if (colliding && state != (180 << 0) && state != (181 << 0))
                {
                    state = (145 << 0)
                    attack_cooldown = attack_max[(phase - 1)]
                }
            }
        }
        else
        {
            if (startroundfunc != -4)
                startroundfunc()
            minutes = maxminutes
            seconds = maxseconds
            round_timer = round_timermax
            bell_sprite = 2081
            alarm[0] = 1
            state = (0 << 0)
            with (obj_player)
            {
                if (object_index == obj_player1 or global.coop)
                    state = (0 << 0)
            }
            with (par_boss)
                state = (0 << 0)
        }
        break
    case (0 << 0):
        bell_sprite = spr_bosstimer_bell
        round_y = Approach(round_y, round_ystart, 4)
        if (super >= supermax && obj_player.state != (252 << 0))
        {
            var p = 0
            with (obj_player)
            {
                if ((!p) && key_shoot2 && check_player_coop())
                {
                    other.super = 0
                    p = 1
                    state = (252 << 0)
                    superattackstate = (8 << 0)
                    var lag = 60
                    hitX = x
                    hitY = y
                    hitLag = lag
                    bossID = other.bossID
                    other.super_portrait_state = 1
                    with (instance_create(x, y, obj_finishereffect))
                        playerid = other.id
                    with (bossID)
                    {
                        hitX = x
                        hitY = y
                        hitLag = lag
                        state = (252 << 0)
                        sprite_index = stunfallspr
                    }
                }
            }
        }
        bg_super_y -= 20
        if (bg_super_y < -540)
            bg_super_y = 0
        switch super_portrait_state
        {
            case 0:
                super_portrait_index = 0
                super_portrait_x = super_portrait_x_off
                break
            case 1:
                super_portrait_index += 0.35
                super_portrait_x = Approach(super_portrait_x, super_portrait_xstart, 40)
                if (super_portrait_x == super_portrait_xstart)
                    super_portrait_state = 2
                break
            case 2:
                super_portrait_index += 0.35
                super_portrait_x += 1
                if (obj_player.state != (252 << 0) or obj_player.superattackstate != (8 << 0))
                    super_portrait_state = 0
                break
        }

        break
    case (8 << 0):
        instance_destroy(obj_baddiespawner)
        instance_destroy(obj_baddie)
        if (player_hp > 0)
        {
            if ((!instance_exists(bossID)) or bossID.state != (137 << 0))
            {
                fade -= 0.05
                fade = clamp(fade, 0, 1)
            }
        }
        else
        {
            var hit = 0
            with (obj_player)
            {
                if (state == (137 << 0))
                    hit = 1
            }
            if (!hit)
            {
                fade -= 0.05
                fade = clamp(fade, 0, 1)
            }
        }
        break
    case (98 << 0):
    case (89 << 0):
        fade -= 0.05
        fade = clamp(fade, 0, 1)
        break
}

bell_index += 0.35
portrait1_index += 0.35
portrait2_index += 0.35
if (state == (0 << 0) && instance_exists(bossID))
{
    if (obj_player1.state == (137 << 0) or obj_player1.state == (156 << 0))
        portrait1_sprite = portrait1_hurt
    else
        portrait1_sprite = portrait1_idle
    if (bossID.state == (137 << 0) or bossID.state == (138 << 0))
        portrait2_sprite = portrait2_hurt
    else
        portrait2_sprite = portrait2_idle
}
else
{
    portrait1_sprite = portrait1_idle
    portrait2_sprite = portrait2_idle
}
