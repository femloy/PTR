function scr_hurtplayer(argument0)
{
    var _hurt = 0
    with (argument0)
    {
        if global.failcutscene
        {
        }
        else if (state == (147 << 0) or state == (208 << 0) or state == (148 << 0) or state == (165 << 0))
        {
        }
        else if (state == (42 << 0) && flash == 1)
        {
        }
        else if (state == (84 << 0) or state == (61 << 0))
        {
        }
        else if global.kungfu
        {
            if (state == (206 << 0))
            {
                if (sprite_index != spr_player_airattackstart)
                {
                    instance_create(x, y, obj_parryeffect)
                    image_index = 0
                }
                sprite_index = spr_player_airattackstart
                hsp = ((-xscale) * 2)
            }
            else if (state != (156 << 0) && state != (137 << 0) && (!hurted))
            {
                instance_create(x, y, obj_parryeffect)
                repeat (5)
                {
                    with (create_debris(x, y, spr_slapstar))
                        vsp = irandom_range(-6, -11)
                }
                hitLag = 3
                hitxscale = (x != other.x ? sign((other.x - x)) : (-other.image_xscale))
                state = (137 << 0)
                hitstunned = 50
                hurted = 1
                alarm[7] = (hitstunned + 30)
                hithsp = 12
                hitvsp = -5
                hitX = x
                hitY = y
                sprite_index = spr_hurt
                if (global.hp > 1)
                {
                    global.hp--
                    with (obj_camera)
                        healthshaketime = 60
                }
                else
                {
                    with (obj_music)
                        arena = 0
                    global.kungfu = 0
                    if (!instance_exists(obj_fadeout))
                    {
                        with (obj_player)
                            targetRoom = lastroom
                        instance_create(x, y, obj_fadeout)
                    }
                }
            }
        }
        else if isgustavo
        {
            if (!hurted)
            {
                state = (196 << 0)
                movespeed = 6
                vsp = -9
                flash = 1
                scr_soundeffect(sfx_pephurt)
                alarm[8] = 100
                hurted = 1
                instance_create(x, y, obj_spikehurteffect)
                _hurt = 1
            }
        }
        else if (state == (70 << 0))
        {
        }
        else if ((state == (47 << 0) or state == (48 << 0) or state == (38 << 0) or state == (49 << 0)) && cutscene == 0)
        {
        }
        else if (state == (16 << 0))
        {
        }
        else if (state == (17 << 0))
        {
            if (instance_exists(possessID) && object_get_parent(possessID) == 407)
            {
                state = (16 << 0)
                with (obj_baddie)
                {
                    if (is_controllable && state == (17 << 0) && playerid == other.id)
                        instance_destroy()
                }
            }
        }
        else if (state == (94 << 0))
        {
        }
        else if (state == (187 << 0))
        {
        }
        else if (state == (41 << 0))
        {
        }
        else if (state == (51 << 0) && hurted == 0)
        {
        }
        else if (state == (31 << 0))
        {
        }
        else if (state == (94 << 0))
        {
        }
        else if (state == (33 << 0))
        {
            hsp = ((-xscale) * 4)
            vsp = -5
            state = (106 << 0)
            sprite_index = spr_bump
            alarm[5] = 2
            alarm[8] = 60
            alarm[7] = 120
            hurted = 1
        }
        else if (pizzashield == 1)
        {
            pizzashield = 0
            with (instance_create(x, y, obj_sausageman_dead))
                sprite_index = spr_pizzashield_collectible
            hsp = ((-xscale) * 4)
            vsp = -5
            state = (106 << 0)
            sprite_index = spr_bump
            invhurt_buffer = 120
            alarm[8] = 60
            alarm[7] = 120
            hurted = 1
            scr_soundeffect(sfx_pephurt)
        }
        else if (state != (107 << 0) && state != (196 << 0) && state != (4 << 0) && (hurted == 0 or state == (24 << 0) or state == (29 << 0) or state == (30 << 0)) && cutscene == 0)
        {
            if (state == (11 << 0) or state == (14 << 0) or state == (12 << 0) or state == (13 << 0))
            {
                with (instance_create(x, y, obj_mortflyaway))
                    image_xscale = (-other.xscale)
            }
            if instance_exists(obj_hardmode)
                global.heatmeter_count = ((global.heatmeter_threshold - 1) * global.heatmeter_threshold_count)
            _hurt = 1
            if (character == "V")
                global.playerhealth -= 25
            if (state == (113 << 0) or state == (115 << 0) or state == (114 << 0) or state == (116 << 0))
            {
                repeat (4)
                    create_debris(x, y, spr_barreldebris)
            }
            if global.kungfu
            {
                if (global.hp > 1)
                {
                    global.hp--
                    with (obj_camera)
                        healthshaketime = 60
                }
                else
                {
                    with (obj_music)
                        arena = 0
                    global.kungfu = 0
                    if (!instance_exists(obj_fadeout))
                    {
                        with (obj_player)
                            targetRoom = lastroom
                        instance_create(x, y, obj_fadeout)
                    }
                }
            }
            if (state == (4 << 0))
            {
                if (object_index == obj_player1)
                    y = obj_player2.y
                else
                    y = obj_player1.y
            }
            scr_soundeffect(sfx_pephurt)
            alarm[8] = 100
            alarm[7] = 50
            hurted = 1
            if (xscale == other.image_xscale)
                sprite_index = spr_hurtjump
            else
                sprite_index = spr_hurt
            movespeed = 8
            vsp = -14
            timeuntilhpback = 300
            instance_create(x, y, obj_spikehurteffect)
            state = (107 << 0)
            image_index = 0
            flash = 1
        }
        if _hurt
        {
            global.combotime -= 25
            global.style -= 25
            global.hurtcounter += 1
            var loseamount = (50 * (global.stylethreshold + 1))
            if (!global.pizzadelivery)
            {
                if (global.collect > loseamount)
                    global.collect -= loseamount
                else
                    global.collect = 0
                if (global.collect != 0)
                {
                    if (character == "P" or character == "V")
                    {
                        repeat (10)
                        {
                            with (instance_create(x, y, obj_pizzaloss))
                                sprite_index = choose(1559, 1561, 1562, 1563, 1560)
                        }
                    }
                    else
                    {
                        repeat (10)
                            instance_create(x, y, obj_pizzaloss)
                    }
                }
            }
        }
    }
    exit;
}

