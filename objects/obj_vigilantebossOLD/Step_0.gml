targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : 324)
if (hp <= 0 && state != (145 << 0) && state != (162 << 0))
{
    if ((!thrown) && (!destroyable))
        boss_destroy(lastplayerid)
}
if ((state == (103 << 0) or state == (105 << 0) or state == (102 << 0) or state == (82 << 0) or state == (80 << 0) or state == (166 << 0) or state == (42 << 0)) && alarm[0] <= 0)
    alarm[0] = 6
if (chooseparry_buffer > 0)
    chooseparry_buffer--
if (important && honor && nexthonor && phase > 3 && state != (160 << 0))
{
    var ch = 0
    with (obj_player)
    {
        if (state == (41 << 0))
            ch = 1
    }
    if (instance_exists(obj_shotgunbullet) or ch)
    {
        nexthonor = 0
        with (obj_tv)
        {
            showtext = 1
            message = "NO HONOR"
            alarm[0] = 200
        }
    }
}
switch phase
{
    case 4:
    case 5:
    case 6:
        normal_func = boss_vigilante_normal_phase4
        break
    default:
        normal_func = boss_vigilante_normal
}

switch state
{
    case (145 << 0):
        grav = 0.5
        state_boss_arenaround()
        honor = nexthonor
        break
    case (0 << 0):
        grav = 0.5
        normal_func()
        break
    case (149 << 0):
        grav = 0.5
        boss_vigilante_float()
        break
    case (1 << 0):
        grav = 0.5
        boss_vigilante_revolver()
        break
    case (103 << 0):
        grav = 0.5
        boss_vigilante_mach1()
        break
    case (102 << 0):
        grav = 0.5
        boss_vigilante_crouchslide()
        break
    case (105 << 0):
        grav = 0.5
        boss_vigilante_machslide()
        break
    case (106 << 0):
        grav = 0.5
        state_boss_bump()
        break
    case (92 << 0):
        grav = 0.5
        boss_vigilante_jump()
        break
    case (2 << 0):
        grav = 0.5
        boss_vigilante_dynamite()
        break
    case (128 << 0):
        grav = 0.5
        boss_vigilante_charge()
        break
    case (80 << 0):
        grav = 0.5
        boss_vigilante_punch()
        break
    case (164 << 0):
        grav = 0.5
        boss_vigilante_groundpunchstart()
        break
    case (122 << 0):
        grav = 0.5
        boss_vigilante_freefallprep()
        break
    case (108 << 0):
        grav = 0.5
        boss_vigilante_freefall()
        break
    case (111 << 0):
        grav = 0.5
        boss_vigilante_freefallland()
        break
    case (166 << 0):
        grav = 0.5
        boss_vigilante_millionpunch()
        break
    case (82 << 0):
        grav = 0.5
        boss_vigilante_uppunch()
        break
    case (42 << 0):
        grav = 0.5
        boss_vigilante_handstandjump()
        break
    case (158 << 0):
        grav = 0.5
        boss_vigilante_superattackstart()
        break
    case (160 << 0):
        grav = 0.5
        boss_vigilante_superattack()
        break
    case (134 << 0):
        grav = 0.5
        state_boss_walk(boss_vigilante_decide_attack)
        inv_timer = 2
        invincible = 1
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
        normalattack_cooldown = normalattack_max[(phase - 1)]
        break
    case (137 << 0):
        grav = 0.5
        scr_enemy_hit()
        stunned = targetstunned
        break
    case (138 << 0):
        grav = 0.5
        state_boss_stun()
        break
}

if (hitstate == (160 << 0) or state == (160 << 0))
{
    with (lastplayerid)
    {
        if (state != (137 << 0) && state != (156 << 0))
        {
            if (sprite_index == spr_player_pistolshot && image_index > (image_number - 1))
                sprite_index = spr_player_pistolidle
            if (sprite_index != spr_player_pistolshot && sprite_index != spr_idle && other.state == (160 << 0) && other.duel_buffer > 0)
                sprite_index = spr_idle
        }
    }
}
attacking = (state == (1 << 0) or state == (103 << 0) or state == (128 << 0) or state == (80 << 0) or state == (164 << 0) or state == (166 << 0) or state == (108 << 0) or state == (82 << 0) or state == (42 << 0) or state == (160 << 0) or state == (158 << 0) or state == (102 << 0))
