if ((!instance_exists(baddieID)) && room != custom_lvl_room)
    instance_destroy()
if instance_exists(baddieID)
{
    x = baddieID.x
    y = baddieID.y
    image_xscale = baddieID.image_xscale
}
for (var i = 0; i < 2; i++)
{
    var _obj_player = asset_get_index(concat("obj_player", (i + 1)))
    var _playerindex = (i + 1)
    if (instance_exists(baddieID) && place_meeting(x, y, _obj_player) && _obj_player.cutscene == 0)
    {
        if (baddieID.state != (4 << 0) && (!baddieID.invincible) && baddieID.state != (17 << 0))
        {
            with (_obj_player)
            {
                if (instance_exists(other.baddieID) && y < other.baddieID.y && attacking == 0 && (!global.kungfu) && sprite_index != spr_player_mach2jump && ((state == (3 << 0) && vsp > 0) or state == (92 << 0) or state == (103 << 0) or state == (79 << 0)) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep && (!other.baddieID.invincible))
                {
                    scr_soundeffect(sfx_stompenemy)
                    image_index = 0
                    if (other.baddieID.object_index != obj_tank)
                    {
                        if (x != other.baddieID.x)
                            other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
                        other.baddieID.hsp = (xscale * 5)
                        other.baddieID.vsp = -5
                        other.baddieID.state = (138 << 0)
                        if (other.baddieID.stunned < 100)
                            other.baddieID.stunned = 100
                        other.baddieID.xscale = 1.4
                        other.baddieID.yscale = 0.6
                    }
                    if (other.baddieID.object_index == obj_pizzaball)
                    {
                        with (other.baddieID)
                        {
                            scr_pizzaball_go_to_thrown(0, -5, 0)
                            vsp = 5
                        }
                    }
                    if key_jump2
                    {
                        instance_create(x, (y + 50), obj_stompeffect)
                        stompAnim = 1
                        vsp = -14
                        if (state == (92 << 0))
                            sprite_index = spr_stompprep
                    }
                    else
                    {
                        instance_create(x, (y + 50), obj_stompeffect)
                        stompAnim = 1
                        vsp = -9
                        if (state == (92 << 0))
                            sprite_index = spr_stompprep
                    }
                }
                if (instance_exists(other.baddieID) && state == (44 << 0))
                {
                    other.baddieID.grabbedby = _playerindex
                    other.baddieID.state = (4 << 0)
                    other.baddieID.hp = -99
                    if key_down
                    {
                        sprite_index = spr_piledriver
                        vsp = -5
                        state = (76 << 0)
                        image_index = 0
                        image_speed = 0.35
                    }
                    else
                    {
                        sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5)
                        image_index = 0
                        hsp = 0
                        movespeed = 0
                        state = (6 << 0)
                    }
                }
                if (instance_exists(other.baddieID) && other.baddieID.state != (205 << 0) && (!other.baddieID.invincible) && state == (193 << 0))
                {
                    other.baddieID.ratplayerid = id
                    other.baddieID.state = (205 << 0)
                    ratgrabbedID = other.baddieID.id
                    state = (191 << 0)
                }
                if (instance_exists(other.baddieID) && other.baddieID.invtime == 0 && ((other.baddieID.object_index != obj_bigcheese && other.baddieID.object_index != obj_pepbat) or state != (5 << 0)) && ((state == (42 << 0) && global.attackstyle == 1) or instakillmove == 1) && other.baddieID.state != (4 << 0) && (!other.baddieID.invincible) && other.baddieID.instantkillable)
                    Instakill()
                else if (state == (42 << 0) && global.attackstyle == 0)
                {
                    image_index = 0
                    if (!key_up)
                    {
                        if (movespeed <= 10)
                            sprite_index = spr_haulingstart
                        else
                            sprite_index = spr_swingding
                        if (!grounded)
                            vsp = -6
                        swingdingendcooldown = 0
                        state = (79 << 0)
                        baddiegrabbedID = other.baddieID
                        grabbingenemy = 1
                        other.baddieID.state = (4 << 0)
                        other.baddieID.grabbedby = _playerindex
                    }
                    else if key_up
                    {
                        baddiegrabbedID = other.baddieID
                        grabbingenemy = 1
                        other.baddieID.state = (4 << 0)
                        other.baddieID.grabbedby = _playerindex
                        sprite_index = spr_piledriver
                        vsp = -14
                        state = (76 << 0)
                        image_index = 0
                        image_speed = 0.35
                    }
                }
                else if (state == (42 << 0) && global.attackstyle == 3)
                {
                    var _ms = movespeed
                    movespeed = 0
                    baddiegrabbedID = other.baddieID
                    grabbingenemy = 1
                    var _prevstate = other.baddieID.state
                    other.baddieID.state = (4 << 0)
                    other.baddieID.grabbedby = _playerindex
                    if global.pummeltest
                    {
                        if (image_index > 6)
                        {
                            if key_up
                            {
                                state = (6 << 0)
                                sprite_index = spr_uppercutfinishingblow
                                image_index = 4
                                movespeed = 0
                            }
                            else if key_down
                            {
                                sprite_index = spr_piledriver
                                vsp = -5
                                state = (76 << 0)
                                image_index = 4
                                image_speed = 0.35
                            }
                            else
                            {
                                state = (6 << 0)
                                sprite_index = spr_player_lungehit
                                image_index = 0
                            }
                        }
                        else
                        {
                            other.baddieID.state = _prevstate
                            grabbingenemy = 0
                            movespeed = _ms
                        }
                    }
                    else
                    {
                        image_index = 0
                        if key_up
                        {
                            state = (6 << 0)
                            sprite_index = spr_uppercutfinishingblow
                            image_index = 4
                            movespeed = 0
                        }
                        else if key_down
                        {
                            sprite_index = spr_piledriver
                            vsp = -5
                            state = (76 << 0)
                            image_index = 4
                            image_speed = 0.35
                        }
                        else
                        {
                            state = (6 << 0)
                            sprite_index = spr_player_lungehit
                            image_index = 0
                        }
                    }
                }
                if (place_meeting(x, (y + 1), other) && state == (58 << 0) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_playerN_pogobounce && (!other.baddieID.invincible))
                {
                    switch pogochargeactive
                    {
                        case 0:
                            pogospeedprev = 0
                            other.baddieID.vsp = -3
                            scr_soundeffect(sfx_stompenemy)
                            other.baddieID.state = (138 << 0)
                            if (other.baddieID.stunned < 100)
                                other.baddieID.stunned = 100
                            sprite_index = spr_playerN_pogobounce
                            break
                        case 1:
                            pogospeedprev = 0
                            scr_throwenemy()
                            sprite_index = spr_playerN_pogobouncemach
                            break
                    }

                    instance_create(x, (y + 50), obj_stompeffect)
                    image_index = 0
                    movespeed = 0
                    vsp = 0
                }
                var pepp_grab = 0
                if (character == "M" && instance_exists(other.baddieID) && (state == (0 << 0) or state == (92 << 0)) && pepperman_grabID == -4 && sprite_index != spr_pepperman_throw && other.baddieID.state == (138 << 0) && other.baddieID.stuntouchbuffer == 0 && (!other.baddieID.thrown) && (!other.baddieID.invincible))
                {
                    other.baddieID.pepperman_grab = 1
                    pepperman_grabID = other.baddieID.id
                    other.baddieID.state = (4 << 0)
                    other.baddieID.grabbedby = _playerindex
                    pepp_grab = 1
                }
                if (instance_exists(other.baddieID) && other.baddieID.object_index != obj_bigcheese && (state == (5 << 0) or state == (104 << 0)) && other.baddieID.state != (80 << 0) && other.baddieID.state != (137 << 0) && (!pepp_grab) && other.baddieID.thrown == 0 && other.baddieID.stuntouchbuffer <= 0 && other.baddieID.state != (4 << 0) && other.baddieID.state != (41 << 0) && other.baddieID.state != (61 << 0) && (!other.baddieID.invincible))
                {
                    var lag = 0
                    other.baddieID.stuntouchbuffer = 15
                    with (other.baddieID)
                    {
                        xscale = 0.8
                        yscale = 1.3
                        instance_create(x, y, obj_bangeffect)
                        state = (137 << 0)
                        image_xscale = (-other.xscale)
                        hithsp = (other.xscale * 12)
                        hitvsp = (((other.y - 180) - y) / 60)
                        trace([hithsp, hitvsp])
                        hitLag = lag
                        hitX = x
                        hitY = y
                        invtime = (lag + 5)
                        flash = 1
                    }
                    tauntstoredstate = state
                    tauntstoredsprite = sprite_index
                    tauntstoredmovespeed = movespeed
                    tauntstoredvsp = vsp
                    state = (61 << 0)
                    hitLag = lag
                    hitX = x
                    hitY = y
                    repeat (2)
                    {
                        with (create_debris(x, y, spr_slapstar))
                            vsp = irandom_range(-6, -11)
                    }
                }
                if (character != "M" && instance_exists(other.baddieID) && state == (55 << 0) && (!other.baddieID.invincible))
                {
                    if (instance_exists(other.baddieID) && y < (other.baddieID.y - 50) && attacking == 0 && state != (42 << 0) && other.baddieID.state != (4 << 0) && sprite_index != spr_player_mach2jump && (state == (92 << 0) or state == (103 << 0) or (state == (79 << 0) && sprite_index != spr_swingding)) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep && (!other.baddieID.invincible))
                    {
                        scr_soundeffect(sfx_stompenemy)
                        if (x != other.baddieID.x)
                            other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
                        image_index = 0
                        other.baddieID.state = (138 << 0)
                        if (other.baddieID.stunned < 100)
                            other.baddieID.stunned = 100
                        if key_jump2
                        {
                            instance_create(x, (y + 50), obj_stompeffect)
                            stompAnim = 1
                            other.baddieID.image_index = 0
                            vsp = -14
                            if (state != (79 << 0))
                                sprite_index = spr_stompprep
                        }
                        else
                        {
                            instance_create(x, (y + 50), obj_stompeffect)
                            stompAnim = 1
                            other.baddieID.image_index = 0
                            vsp = -9
                            if (state != (79 << 0))
                                sprite_index = spr_stompprep
                        }
                    }
                    if (other.baddieID.thrown == 0 && (character == "P" or character == "N"))
                    {
                        movespeed = 0
                        image_index = 0
                        sprite_index = spr_haulingstart
                        state = (79 << 0)
                        other.baddieID.state = (4 << 0)
                        other.baddieID.grabbedby = _playerindex
                    }
                }
            }
        }
    }
}
