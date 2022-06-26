targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : 324)
if (obj_bosscontroller.state == (144 << 0))
    exit;
if (hp <= 0 && state != (145 << 0) && state != (162 << 0))
{
    if ((!thrown) && (!destroyable))
        boss_destroy(lastplayerid)
}
image_speed = 0.35
if (knightbuffer > 0)
    knightbuffer--
switch phase
{
    case 0:
        normal_func = boss_pizzaface_phase1normal
        break
    case 1:
        normal_func = boss_pizzahead_phase2normal
        break
    case 2:
        normal_func = boss_pizzahead_phase3normal
        break
}

switch state
{
    case (145 << 0):
        grav = 0.5
        break
    case (0 << 0):
        grav = 0.5
        normal_func()
        break
    case (230 << 0):
        grav = 0.5
        boss_pizzaface_ram()
        break
    case (226 << 0):
        grav = 0.5
        boss_pizzaface_moustache()
        break
    case (228 << 0):
        grav = 0.5
        boss_pizzaface_eyes()
        break
    case (227 << 0):
        grav = 0.5
        boss_pizzaface_mouth()
        break
    case (229 << 0):
        grav = 0.5
        boss_pizzaface_nose()
        break
    case (231 << 0):
        boss_pizzaface_phase2transition()
        break
    case (232 << 0):
        boss_pizzahead_look()
        break
    case (233 << 0):
        boss_pizzahead_fishing()
        break
    case (235 << 0):
        boss_pizzahead_bombrun()
        break
    case (236 << 0):
        boss_pizzahead_npcthrow()
        break
    case (237 << 0):
        boss_pizzahead_portraitthrow()
        break
    case (238 << 0):
        boss_pizzahead_enguarde()
        break
    case (239 << 0):
        boss_pizzahead_sexypicture()
        break
    case (240 << 0):
        boss_pizzahead_pullinglevel()
        break
    case (241 << 0):
        boss_pizzahead_eat()
        break
    case (242 << 0):
        boss_pizzahead_surprisebox()
        break
    case (243 << 0):
        boss_pizzahead_spinningrun()
        break
    case (244 << 0):
        boss_pizzahead_spinningkick()
        break
    case (245 << 0):
        boss_pizzahead_spinningpunch()
        break
    case (246 << 0):
        boss_pizzahead_groundpunch()
        break
    case (247 << 0):
        boss_pizzahead_bigkick()
        break
    case (248 << 0):
        boss_pizzahead_slamhead()
        break
    case (249 << 0):
        boss_pizzahead_slamhead2()
        break
    case (134 << 0):
        grav = 0.5
        if grounded
            state = (0 << 0)
        invincible = 1
        inv_timer = 2
        break
    case (61 << 0):
        grav = 0.5
        state_boss_chainsaw()
        break
    case (84 << 0):
        grav = 0.5
        state_boss_taunt()
        invincible = 1
        inv_timer = 2
        break
    case (147 << 0):
        grav = 0.5
        state_boss_parry()
        invincible = 1
        inv_timer = 2
        break
    case (137 << 0):
        grav = 0.5
        scr_enemy_hit()
        stunned = 30
        break
    case (138 << 0):
        grav = 0.5
        state_boss_stun()
        break
}

if (phase == 0 && state != (230 << 0))
    invincible = 1
else
    invincible = 0
attacking = (state == (230 << 0) or state == (229 << 0) or state == (244 << 0) or state == (245 << 0) or state == (246 << 0) or state == (248 << 0) or state == (249 << 0))
colliding = state != (230 << 0)
if (phase > 0)
{
    mask_index = spr_pizzahead_giddy
    stunfallspr = spr_pizzahead_giddy
    walkspr = spr_pizzahead_giddy
}
