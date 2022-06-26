prevhsp = hsp
prevmove = move
prevmovespeed = movespeed
previcemovespeed = icemovespeed
prevxscale = xscale
var prevmask = mask_index

switch state
{
    case (0 << 0):
        scr_player_normal()
        break
    case (1 << 0):
        scr_player_revolver()
        break
    case (2 << 0):
        scr_player_dynamite()
        break
    case (3 << 0):
        scr_player_boots()
        break
    case (4 << 0):
        scr_player_grabbed()
        break
    case (6 << 0):
        scr_player_finishingblow()
        break
    case (5 << 0):
        scr_player_tumble()
        break
    case (18 << 0):
        scr_player_titlescreen()
        break
    case (7 << 0):
        scr_player_ejected()
        break
    case (10 << 0):
        scr_player_firemouth()
        break
    case (9 << 0):
        scr_player_fireass()
        break
    case (8 << 0):
        scr_player_transitioncutscene()
        break
    case (19 << 0):	
        scr_playerN_hookshot()
        break
    case (23 << 0):
        scr_player_slap()
        break
    case (20 << 0):
        scr_player_tacklecharge()
        break
    case (24 << 0):
        scr_player_cheesepep()
        break
    case (26 << 0):
        scr_player_cheesepepjump()
        break
    case (27 << 0):
        scr_player_cheesepepfling()
        break
    case (21 << 0):
        scr_player_cheeseball()
        break
    case (22 << 0):
        scr_player_cheeseballclimbwall()
        break
    case (29 << 0):
        scr_player_cheesepepstickside()
        break
    case (30 << 0):
        scr_player_cheesepepstickup()
        break
    case (25 << 0):
        scr_player_cheesepepstick()
        break		
    case (28 << 0):
        scr_player_cheesepeplaunch()
        break
    case (33 << 0):
        scr_player_boxxedpep()
        break
    case (35 << 0):
        scr_player_boxxedpepjump()
        break
    case (34 << 0):
        scr_player_boxxedpepspin()
        break
    case (36 << 0):
        scr_player_pistolaim()
        break
    case (37 << 0):
        scr_player_climbwall()
        break
    case (38 << 0):
        scr_player_knightpepslopes()
        break
    case (39 << 0):
        scr_player_portal()
        break
    case (40 << 0):
        scr_player_secondjump()
        break
    case (41 << 0):
        scr_player_chainsawbump()
        break
    case (42 << 0):
        scr_player_handstandjump()
        break
    case (43 << 0):
        scr_player_lungeattack()
        break
    case (44 << 0):
        scr_player_lungegrab()
        break
    case (45 << 0):
        scr_player_dashtumble()
        break
    case (153 << 0):
        scr_player_shoulderbash()
        break
    case (46 << 0):
        scr_player_gottreasure()
        break
    case (47 << 0):
        scr_player_knightpep()
        break
    case (48 << 0):
        scr_player_knightpepattack()
        break
    case (49 << 0):
        scr_player_knightpepbump()
        break
    case (50 << 0):
        scr_player_meteorpep()
        break
    case (51 << 0):
        scr_player_bombpep()
        break
    case (54 << 0):
        scr_player_bombpepup()
        break
    case (53 << 0):
        scr_player_bombpepside()
        break
    case (52 << 0):
        scr_player_bombgrab()
        break
    case (55 << 0):
        scr_player_grabbing()
        break
    case (56 << 0):
        scr_player_chainsawpogo()
        break
    case (57 << 0):
        scr_player_shotgunjump()
        break
    case (59 << 0):
        scr_player_stunned()
        break
    case (60 << 0):
        scr_player_highjump()
        break
    case (61 << 0):
        scr_player_chainsaw()
        break
    case (137 << 0):
        scr_player_hit()
        break
    case (156 << 0):
        scr_player_thrown()
        break
    case (62 << 0):
        scr_player_facestomp()
        break
    case (64 << 0):
        scr_player_timesup()
        break
    case (65 << 0):
        scr_player_machroll()
        break
    case (72 << 0):
        scr_player_pistol()
        break
    case (66 << 0):
        scr_player_shotgun()
        break
    case (67 << 0):
        scr_player_shotguncrouch()
        break
    case (68 << 0):
        scr_player_shotguncrouchjump()
        break
    case (69 << 0):
        scr_player_shotgunshoot()
        break
    case (71 << 0):
        scr_player_shotgunfreefall()
        break
    case (70 << 0):
        scr_player_shotgundash()
        break
    case (73 << 0):
        scr_player_machfreefall()
        break
    case (74 << 0):
        scr_player_throwing()
        break
    case (76 << 0):
        scr_player_superslam()
        break
    case (75 << 0):
        scr_player_slam()
        break
    case (77 << 0):
        scr_player_skateboard()
        break
    case (78 << 0):
        scr_player_grind()
        break
    case (79 << 0):
        scr_player_grab()
        break
    case (80 << 0):
        scr_player_punch()
        break
    case (81 << 0):
        scr_player_backkick()
        break
    case (82 << 0):
        scr_player_uppunch()
        break
    case (83 << 0):
        scr_player_shoulder()
        break
    case (84 << 0):
        scr_player_backbreaker()
        break
    case (85 << 0):
        scr_player_graffiti()
        break
    case (86 << 0):
        scr_player_bossdefeat()
        break
    case (88 << 0):
        scr_player_bossintro()
        break
    case (96 << 0):
        scr_player_smirk()
        break
    case (87 << 0):
        scr_player_pizzathrow()
        break
    case (89 << 0):
        scr_player_gameover()
        break
    case (123 << 0):
        scr_player_Sjumpland()
        break
    case (122 << 0):
        scr_player_freefallprep()
        break
    case (120 << 0):
        scr_player_runonball()
        break
    case (118 << 0):
        scr_player_boulder()
        break
    case (90 << 0):
        scr_player_keyget()
        break
    case (91 << 0):
        scr_player_tackle()
        break
    case (94 << 0):
        scr_player_slipnslide()
        break
    case (93 << 0):
        scr_player_ladder()
        break
    case (92 << 0):
        scr_player_jump()
        break
    case (98 << 0):
        scr_player_victory()
        break
    case (95 << 0):
        scr_player_comingoutdoor()
        break
    case (97 << 0):
        scr_player_Sjump()
        break
    case (99 << 0):
        scr_player_Sjumpprep()
        break
    case (100 << 0):
        scr_player_crouch()
        break
    case (101 << 0):
        scr_player_crouchjump()
        break
    case (102 << 0):
        scr_player_crouchslide()
        break
    case (103 << 0):
        scr_player_mach1()
        break
    case (104 << 0):
        scr_player_mach2()
        break
    case (121 << 0):
        scr_player_mach3()
        break
    case (105 << 0):
        scr_player_machslide()
        break
    case (106 << 0):
        scr_player_bump()
        break
    case (107 << 0):
        scr_player_hurt()
        break
    case (108 << 0):
        scr_player_freefall()
        break
    case (111 << 0):
        scr_player_freefallland()
        break
    case (109 << 0):
        scr_player_hang()
        break
    case (112 << 0):
        scr_player_door()
        break
    case (113 << 0):
        scr_player_barrel()
        break
    case (114 << 0):
        scr_player_barreljump()
        break
    case (116 << 0):
        scr_player_barrelslide()
        break
    case (115 << 0):
        scr_player_barrelclimbwall()
        break
    case (117 << 0):
        scr_player_current()
        break
    case (119 << 0):
        scr_player_taxi()
        break
    case (152 << 0):
        scr_player_taxi()
        break
    case (58 << 0):
        scr_player_pogo()
        break
    case (31 << 0):
        scr_player_rideweenie()
        break
    case (32 << 0):
        scr_player_motorcycle()
        break
    case (124 << 0):
        scr_player_faceplant()
        break
    case (16 << 0):
        scr_player_ghost()
        break
    case (17 << 0):
        scr_player_ghostpossess()
        break
    case (11 << 0):
        scr_player_mort()
        break
    case (12 << 0):
        scr_player_mortjump()
        break
    case (13 << 0):
        scr_player_mortattack()
        break
    case (14 << 0):
        scr_player_morthook()
        break
    case (15 << 0):
        scr_player_hook()
        break
    case (144 << 0):
        scr_player_arenaintro()
        break
    case (146 << 0):
        scr_player_actor()
        break
    case (147 << 0):
        scr_player_parry()
        break
    case (148 << 0):
        scr_player_golf()
        break
    case (150 << 0):
        scr_player_tube()
        break
    case (154 << 0):
        scr_player_pummel()
        break
    case (165 << 0):
        scr_player_slipbanan()
        break
    case (183 << 0):
        scr_player_bombdelete()
        break
    case (184 << 0):
        scr_player_rocket()
        break
    case (185 << 0):
        scr_player_rocketslide()
        break
    case (186 << 0):
        scr_player_gotoplayer()
        break
    case (187 << 0):
        scr_player_trickjump()
        break
    case (190 << 0):
        scr_player_ridecow()
        break
    case (191 << 0):
        scr_player_ratmount()
        break
    case (196 << 0):
        scr_player_ratmounthurt()
        break
    case (192 << 0):
        scr_player_ratmountjump()
        break
    case (193 << 0):
        scr_player_ratmountattack()
        break
    case (194 << 0):
        scr_player_ratmountspit()
        break
    case (195 << 0):
        scr_player_ratmountclimbwall()
        break
    case (197 << 0):
        scr_player_ratmountgroundpound()
        break
    case (198 << 0):
        scr_player_ratmountbounce()
        break
    case (200 << 0):
        scr_player_ratmountballoon()
        break	
    case (202 << 0):
        scr_player_ratmountgrind()
        break
    case (201 << 0):
        scr_player_ratmounttumble()
        break
    case (259 << 0):
        scr_player_ratmountpunch()
        break
    case (203 << 0):
        scr_player_ratmounttrickjump()
        break
    case (204 << 0):
        scr_player_ratmountskid()
        break
    case (206 << 0):
        scr_player_blockstance()
        break
    case (207 << 0):
        scr_player_balloon()
        break
    case (208 << 0):
        scr_player_debugstate()
        break
    case (210 << 0):
        scr_player_trashjump()
        break
    case (211 << 0):
        scr_player_trashroll()
        break
    case (212 << 0):
        scr_player_stringfling()
        break
    case (213 << 0):
        scr_player_stringjump()
        break
    case (214 << 0):
        scr_player_stringfall()
        break
    case (215 << 0):
        scr_player_noisejetpack()
        break
    case (216 << 0):
        scr_player_spiderweb()
        break
    case (225 << 0):
        scr_player_animatronic()
        break
    case (252 << 0):
        scr_player_playersuperattack()
        break
    case (254 << 0):
        scr_player_jetpackjump()
        break
    case (257 << 0):
        scr_player_bee()
        break
    case (260 << 0):
        scr_player_ratmountcrouch()
        break
    case (261 << 0):
        scr_player_ratmountladder()
        break
    case (265 << 0):
        scr_player_antigrav()
        break
}

if (prevstate != state)
{
    if (prevstate == (211 << 0) && prevsprite != 1727 && prevsprite != 1636)
        create_debris(x, y, spr_player_trashlid)
}
if (!(place_meeting(x, (y + 1), obj_railparent)))
{
    if (state == (121 << 0) or state == (104 << 0) or state == (5 << 0))
        railmovespeed = Approach(railmovespeed, 0, 0.1)
    else
        railmovespeed = Approach(railmovespeed, 0, 0.5)
}
if (state != (42 << 0) && state != (5 << 0))
    crouchslipbuffer = 0
if (state != (121 << 0))
    mach4mode = 0
if (ratshootbuffer > 0)
    ratshootbuffer--
if (state != (225 << 0))
{
    animatronic_buffer = 360
    animatronic_collect_buffer = 0
}
if (state == (33 << 0) && grounded && vsp > 0)
    boxxedpepjump = boxxedpepjumpmax
if (verticalbuffer > 0)
    verticalbuffer--
if (superchargecombo_buffer > 0)
    superchargecombo_buffer--
else if (superchargecombo_buffer == 0)
{
    superchargecombo_buffer = -1
    global.combotime = 4
}
if (state != (0 << 0))
    breakdance_speed = 0.25
if ((!grounded) && (state == (187 << 0) or state == (92 << 0) or state == (103 << 0) or state == (104 << 0) or state == (121 << 0)) && key_jump && global.noisejetpack == 1)
{
    vsp = -14
    state = (254 << 0)
    sprite_index = spr_player_jetpackstart
    doublejump = 0
    with (instance_create(x, y, obj_highjumpcloud2))
        sprite_index = spr_player_firemouthjumpdust
}
if (walljumpbuffer > 0)
    walljumpbuffer--
if (grounded && vsp > 0 && state != (215 << 0))
    jetpackfuel = jetpackmax
if tauntstoredisgustavo
{
    isgustavo = 1
    if (state != (84 << 0) && state != (147 << 0) && state != (85 << 0))
        tauntstoredisgustavo = 0
}
if (state != (121 << 0) && (state != (105 << 0) or sprite_index != spr_mach3boost))
{
    launch = 0
    launched = 0
    launch_buffer = 0
}
if (launch_buffer > 0)
    launch_buffer--
else
    launched = 0
if (state != (6 << 0))
    finishingblow = 0
if (dash_doubletap > 0)
    dash_doubletap--
if (cow_buffer > 0)
    cow_buffer--
if (state == (43 << 0))
    lunge_buffer = 14
if (blur_effect > 0)
    blur_effect--
else if (breakdance_speed >= 0.6 or mach4mode == 1 or boxxeddash == 1 or state == (16 << 0) or state == (5 << 0) or state == (198 << 0) or state == (193 << 0) or state == (42 << 0) or state == (116 << 0) or (state == (79 << 0) && sprite_index == spr_swingding && swingdingdash <= 0) or (state == (80 << 0) && (sprite_index == spr_player_breakdanceuppercut or sprite_index == spr_player_breakdanceuppercutend)) or state == (108 << 0) or state == (43 << 0))
{
    if (visible && (!(place_meeting(x, y, obj_secretportal))) && (!(place_meeting(x, y, obj_secretportalstart))))
    {
        blur_effect = 2
        with (create_blur_afterimage(x, y, sprite_index, (image_index - 1), xscale))
            playerid = other.id
    }
}
if (state != (61 << 0) && state != (106 << 0) && state != (33 << 0) && state != (34 << 0) && state != (35 << 0))
{
    boxxed = 0
    boxxeddash = 0
}
if (state != (79 << 0))
    grabbingenemy = 0
if (state != (104 << 0) && state != (121 << 0) && state != (187 << 0) && state != (201 << 0) && state != (203 << 0))
{
    ramp = 0
    ramp_points = 0
}
if (state != (112 << 0) && state != (61 << 0) && state != (137 << 0) && place_meeting(x, y, obj_boxofpizza))
    state = (100 << 0)
if (shoot_buffer > 0)
    shoot_buffer--
if (cheesepep_buffer > 0)
    cheesepep_buffer--
if (state != (29 << 0))
    yscale = 1
if (invhurt_buffer > 0)
    invhurt_buffer--
if (state == (107 << 0))
{
    if (hurt_buffer > 0)
        hurt_buffer--
    else
    {
        invhurt_buffer = invhurt_max
        hurt_buffer = -1
    }
}
else
{
    if (hurt_buffer > 0)
        invhurt_buffer = invhurt_max
    hurt_buffer = -1
}
if (room == Realtitlescreen && instance_exists(obj_mainmenuselect))
    state = (18 << 0)
if (wallclingcooldown < 10)
    wallclingcooldown++
if ((!instance_exists(superchargedeffectid)) && supercharged)
{
    with (instance_create(x, y, obj_superchargeeffect))
    {
        playerid = other.id
        other.superchargedeffectid = id
    }
}
if (state != (97 << 0))
    sjumpvsp = -12
if (state != (108 << 0))
    freefallvsp = 20
if (supercharge > 9 && state != (84 << 0))
    supercharged = 1
if ((!instance_exists(pizzashieldid)) && pizzashield == 1)
{
    with (instance_create(x, y, obj_pizzashield))
    {
        playerid = other.object_index
        other.pizzashieldid = id
    }
}
if (visible == false && state == (95 << 0))
{
    coopdelay++
    image_index = 0
    if (coopdelay == 50)
    {
        visible = true
        coopdelay = 0
    }
}
if (global.coop == true)
{
    if ((state == (80 << 0) or state == (42 << 0)) && (!((obj_player2.state == (80 << 0) or obj_player2.state == (42 << 0)))))
        fightballadvantage = 1
    else if (!((obj_player2.state == (80 << 0) or obj_player2.state == (42 << 0))))
        fightballadvantage = 0
}
if (state != (58 << 0) && state != (84 << 0))
{
    pogospeed = 6
    pogospeedprev = 0
}
scr_playersounds()
if grounded
    doublejump = 0
if (pogochargeactive == 1)
{
    if (flashflicker == 0)
    {
        if (pogochargeactive == 1 && sprite_index == spr_playerN_pogofall)
            sprite_index = spr_playerN_pogofallmach
        if (pogochargeactive == 1 && sprite_index == spr_playerN_pogobounce)
            sprite_index = spr_playerN_pogobouncemach
    }
    flashflicker = 1
    pogocharge--
}
else
    flashflicker = 0
if (state != (74 << 0))
    kickbomb = 0
if (pogocharge == 0)
{
    pogochargeactive = 0
    pogocharge = 100
}
if (flashflicker == 1)
{
    flashflickertime++
    if (flashflickertime == 20)
    {
        flash = 1
        flashflickertime = 0
    }
}
if (state != (121 << 0) && state != (4 << 0))
    fightball = 0
if (state != (4 << 0) && state != (107 << 0))
{
    if (grounded && state != (55 << 0))
        suplexmove = 0
}
if (state != (108 << 0) && (state != (61 << 0) or tauntstoredstate != (108 << 0)) && (state != (84 << 0) or tauntstoredstate != (108 << 0)))
    freefallsmash = -14
if (global.playerhealth <= 0 && state != (89 << 0))
{
    image_index = 0
    sprite_index = spr_playerV_dead
    state = (89 << 0)
}
if (state == (89 << 0) && y > (room_height * 2))
{
    targetDoor = "A"
    scr_playerreset()
    if (global.coop == true)
    {
        with (obj_player2)
        {
            scr_playerreset()
            targetDoor = "A"
        }
    }
    with (obj_player)
    {
        targetDoor = "A"
        room = hub_reception
        room = rm_levelselect
    }
}
if (baddiegrabbedID == obj_null && (state == (79 << 0) or state == (76 << 0) or state == (20 << 0)))
    state = (0 << 0)
if (!((state == (79 << 0) or state == (76 << 0) or state == (104 << 0))))
{
    baddiegrabbedID = obj_null
    heavy = 0
}
if (cutscene == 1 && state != (186 << 0))
    global.heattime = 60
if (anger == 0)
    angry = 0
if (anger > 0)
{
    angry = 1
    anger -= 1
}
if (sprite_index == spr_winding && state != (0 << 0))
    windingAnim = 0
if (state != (79 << 0))
    swingdingbuffer = 0
if (state == (265 << 0) or state == (184 << 0) or state == (185 << 0))
    grav = 0
else if (state == (113 << 0))
    grav = 0.6
else if (state == (16 << 0) or state == (17 << 0))
    grav = 0
else if (boxxed && state != (34 << 0))
    grav = 0.3
else if (state == (254 << 0))
    grav = 0.5
else if (state == (34 << 0))
    grav = 0.6
else
    grav = 0.5
if (state == (113 << 0) && key_jump2 && (!jumpstop))
    grav = 0.4
if (sprite_index == spr_player_idlevomit && image_index > 28 && image_index < 43)
    instance_create((x + random_range(-5, 5)), (y + 46), obj_vomit)
if (sprite_index == spr_player_idlevomitblood && image_index > 28 && image_index < 43)
{
    with (instance_create((x + random_range(-5, 5)), (y + 46), obj_vomit))
        sprite_index = spr_vomit2
}
if (global.stylethreshold >= 2 && (!instance_exists(angryeffectid)) && state == (0 << 0) && character != "V")
{
    with (instance_create(x, y, obj_angrycloud))
    {
        playerid = other.object_index
        other.angryeffectid = id
    }
}
if (object_index == obj_player1)
{
    if (global.combo != global.previouscombo)
    {
        global.previouscombo = global.combo
        if ((global.combo % 5) == 0 && global.combo != 0)
        {
            with (instance_create(x, (y - 80), obj_combotitle))
            {
                title = floor((global.combo / 5))
                title = clamp(title, 0, floor((sprite_get_number(spr_comboend_title1) / 5)))
            }
        }
    }
    if (!((state == (112 << 0) or state == (150 << 0) or state == (119 << 0) or state == (46 << 0) or state == (98 << 0) or state == (46 << 0) or state == (146 << 0) or state == (95 << 0) or (state == (47 << 0) && (sprite_index == spr_knightpepstart or sprite_index == spr_knightpepthunder)) or instance_exists(obj_fadeout) or place_meeting(x, y, obj_secretportal) or place_meeting(x, y, obj_secretportalstart))))
    {
        if (global.combotime > 0)
            global.combotime -= 0.15
    }
    if (global.heattime > 0)
        global.heattime -= 0.15
    if (global.combotime <= 0 && global.combo != 0)
    {
        global.savedcombo = global.combo
        global.combotime = 0
        global.combo = 0
        supercharge = 0
    }
    if (global.heattime <= 0 && global.style > -1 && global.stylelock == 0)
        global.style -= 0.05
}
if (key_jump && (!grounded) && (state == (104 << 0) or state == (121 << 0)) && (state != ((37 << 0) & walljumpbuffer)) <= 0)
    input_buffer_walljump = 24
if (input_buffer_jump < 8)
    input_buffer_jump++
if (input_buffer_secondjump < 8)
    input_buffer_secondjump++
if (input_buffer_highjump < 8)
    input_buffer_highjump++
if (input_attack_buffer > 0)
    input_attack_buffer--
if (input_finisher_buffer > 0)
    input_finisher_buffer--
if (input_up_buffer > 0)
    input_up_buffer--
if (input_down_buffer > 0)
    input_down_buffer--
if (input_buffer_walljump > 0)
    input_buffer_walljump--
if (input_buffer_slap < 8)
    input_buffer_slap++
if (key_particles == 1)
    create_particle((x + random_range(-25, 25)), (y + random_range(-35, 25)), particle.keyparticles, 0)
if (inv_frames == 0 && hurted == 0 && state != (16 << 0))
    image_alpha = 1
if (state == (80 << 0) or (state == (92 << 0) && sprite_index == spr_playerN_noisebombspinjump) or state == (20 << 0) or state == (77 << 0) or state == (47 << 0) or state == (24 << 0) or state == (38 << 0) or state == (48 << 0) or state == (51 << 0) or state == (62 << 0) or state == (73 << 0) or state == (62 << 0) or state == (121 << 0) or state == (108 << 0) or state == (97 << 0))
    attacking = 1
else
    attacking = 0
if (state == (74 << 0) or state == (81 << 0) or state == (83 << 0) or state == (82 << 0))
    grabbing = 1
else
    grabbing = 0
if ((state == (198 << 0) && vsp >= 0) or sprite_index == spr_player_Sjumpcancel or sprite_index == spr_swingding or sprite_index == spr_tumble or state == (34 << 0) or state == (211 << 0) or state == (210 << 0) or state == (70 << 0) or (state == (71 << 0) && (sprite_index == spr_shotgunjump2 or sprite_index == spr_shotgunjump3)) or state == (97 << 0) or state == (184 << 0) or state == (185 << 0) or state == (41 << 0) or state == (80 << 0) or state == (124 << 0) or state == (31 << 0) or state == (121 << 0) or (state == (92 << 0) && sprite_index == spr_playerN_noisebombspinjump) or state == (108 << 0) or state == (9 << 0) or state == (254 << 0) or state == (10 << 0) or state == (19 << 0) or state == (254 << 0) or state == (77 << 0) or state == (63 << 0) or state == (97 << 0) or state == (73 << 0) or state == (20 << 0) or (state == (76 << 0) && sprite_index == spr_piledriver) or state == (47 << 0) or state == (48 << 0) or state == (38 << 0) or state == (187 << 0) or state == (24 << 0) or state == (21 << 0) or state == (201 << 0) or state == (197 << 0) or state == (259 << 0) or state == (265 << 0) or ratmount_movespeed == 12 or state == (165 << 0) or state == (153 << 0))
    instakillmove = 1
else
    instakillmove = 0
if (state == (198 << 0) && vsp < 0)
    stunmove = 1
else
    stunmove = 0
if (flash == 1 && alarm[0] <= 0)
    alarm[0] = (0.15 * room_speed)
if (state != (93 << 0))
    hooked = 0
if (state != (121 << 0) && state != (105 << 0))
    autodash = 0
if ((state != (92 << 0) && state != (101 << 0) && state != (23 << 0)) or vsp < 0)
    fallinganimation = 0
if (state != (111 << 0) && state != (0 << 0) && state != (105 << 0) && state != (92 << 0))
    facehurt = 0
if (state != (0 << 0) && state != (105 << 0))
    machslideAnim = 0
if (state != (0 << 0) && state != (191 << 0))
{
    idle = 0
    dashdust = 0
}
if (state != (103 << 0) && state != (26 << 0) && state != (92 << 0) && state != (19 << 0) && state != (42 << 0) && state != (0 << 0) && state != (104 << 0) && state != (121 << 0) && state != (122 << 0) && state != (47 << 0) && state != (66 << 0) && state != (38 << 0))
    momemtum = 0
if (state != (97 << 0) && state != (99 << 0))
    a = 0
if (state != (62 << 0))
    facestompAnim = 0
if (state != (108 << 0) && state != (62 << 0) && state != (76 << 0) && state != (111 << 0))
    superslam = 0
if (state != (104 << 0))
    machpunchAnim = 0
if (ladderbuffer > 0)
    ladderbuffer--
if (state != (92 << 0))
    stompAnim = 0
if (state == (121 << 0) or state == (104 << 0) or ratmount_movespeed == 12)
{
    if (macheffect == 0)
    {
        macheffect = 1
        toomuchalarm1 = 6
        with (create_mach3effect(x, y, sprite_index, (image_index - 1)))
        {
            playerid = other.object_index
            image_xscale = other.xscale
        }
    }
}
if ((!(state == (121 << 0))) && (!(state == (104 << 0))) && ratmount_movespeed < 12)
    macheffect = 0
if (toomuchalarm1 > 0)
{
    toomuchalarm1 -= 1
    if (toomuchalarm1 <= 0 && (state == (121 << 0) or state == (104 << 0) or ratmount_movespeed == 12))
    {
        with (create_mach3effect(x, y, sprite_index, (image_index - 1)))
        {
            playerid = other.object_index
            image_xscale = other.xscale
        }
        toomuchalarm1 = 6
    }
}
if ((y > (room_height + 300) or y < -800) && (!(place_meeting(x, y, obj_verticalhallway))) && (!verticalhallway) && room != custom_lvl_room && state != (89 << 0) && state != (186 << 0))
{
    x = roomstartx
    y = roomstarty
    visible = true
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    if (state == (17 << 0))
    {
        state = (16 << 0)
        sprite_index = spr_ghostidle
    }
    state = (146 << 0)
    visible = false
    hsp = 0
    vsp = 0
    scr_soundeffect(sfx_groundpound)
    with (instance_create(x, (y + 540), obj_technicaldifficulty))
    {
        playerid = other.id
        if (!other.isgustavo)
            sprite = choose(264, 896, 2780)
        else
            sprite = 2787
    }
    with (obj_ghostfollow)
    {
        x = xstart
        y = ystart
    }
    vsp = 10
}
if (character == "S")
{
    if (state == (101 << 0) or state == (100 << 0))
        state = (0 << 0)
}
if (character != "M")
{
    if (!(scr_solid_player(x, y)))
    {
        if (state != (260 << 0) && state != (35 << 0) && state != (34 << 0) && (!((state == (106 << 0) && sprite_index == spr_tumbleend))) && state != (116 << 0) && state != (115 << 0) && sprite_index != spr_player_breakdancesuper && sprite_index != spr_player_barrelslipnslide && sprite_index != spr_player_barrelroll && sprite_index != spr_bombpepintro && sprite_index != spr_knightpepthunder && state != (59 << 0) && state != (100 << 0) && state != (67 << 0) && state != (68 << 0) && state != (33 << 0) && state != (72 << 0) && sprite_index != spr_player_crouchshoot && state != (99 << 0) && state != (102 << 0) && state != (61 << 0) && state != (65 << 0) && state != (107 << 0) && state != (101 << 0) && state != (30 << 0) && state != (29 << 0) && state != (5 << 0))
            mask_index = spr_player_mask
        else
            mask_index = spr_crouchmask
    }
    else
        mask_index = spr_crouchmask
}
else
    mask_index = spr_pepperman_mask
if (state == (46 << 0) or sprite_index == spr_knightpepstart or sprite_index == spr_knightpepthunder or state == (90 << 0) or state == (61 << 0) or state == (112 << 0) or state == (7 << 0) or state == (98 << 0) or state == (95 << 0) or state == (89 << 0) or state == (186 << 0) or state == (152 << 0) or state == (146 << 0) or place_meeting(x, y, obj_secretportal) or place_meeting(x, y, obj_secretportalstart))
    cutscene = 1
else
    cutscene = 0
if (((place_meeting(x, y, obj_door) && (!(place_meeting(x, y, obj_doorblocked)))) or place_meeting(x, y, obj_taxi) or place_meeting(x, y, obj_dialognpc) or place_meeting(x, y, obj_dresser) or place_meeting(x, y, obj_keydoor) or place_meeting(x, y, obj_filedoor) or place_meeting(x, y, obj_optiondoor) or (place_meeting(x, y, obj_exitgate) && global.panic == true)) && (!instance_exists(obj_uparrow)) && scr_solid(x, (y + 1)) && state == (0 << 0) && obj_player1.spotlight == 1)
{
    with (instance_create(x, y, obj_uparrow))
        playerid = other.object_index
}
if (movespeed >= 16 && state == (121 << 0) && (!instance_exists(speedlineseffectid)))
{
    with (instance_create(x, y, obj_speedlines))
    {
        playerid = other.object_index
        other.speedlineseffectid = id
    }
}
with (obj_ratblock)
    scr_ratblock_destroy()
scr_collide_destructibles()
if (state != (17 << 0) && state != (186 << 0) && state != (208 << 0) && state != (18 << 0) && state != (150 << 0) && state != (4 << 0) && state != (112 << 0) && state != (97 << 0) && state != (7 << 0) && state != (95 << 0) && state != (118 << 0) && state != (90 << 0) && state != (98 << 0) && state != (39 << 0) && state != (64 << 0) && state != (46 << 0) && state != (89 << 0))
    scr_collide_player()
if (state == (150 << 0) or state == (186 << 0) or state == (208 << 0))
{
    x += hsp
    y += vsp
}
if (state == (118 << 0))
    scr_collide_player()
if (state != (95 << 0))
    image_blend = c_white
prevstate = state
prevsprite = sprite_index
