targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1)
if (hp <= 0 && state != (145 << 0))
{
    if ((!destroyed) && (!thrown) && (!destroyable))
        boss_destroy(lastplayerid)
}
if (chooseparry_buffer > 0)
    chooseparry_buffer--
if ((state == (42 << 0) or state == (102 << 0) or state == (167 << 0) or state == (171 << 0) or state == (173 << 0) or (state == (58 << 0) && pogochargeactive) or state == (77 << 0)) && alarm[0] <= 0)
    alarm[0] = 6
switch state
{
    case (145 << 0):
        grav = 0.5
        state_boss_arenaround()
        movespeed = 0
        inv_timer = 2
        invincible = 1
        break
    case (0 << 0):
        grav = 0.5
        boss_noise_normal()
        break
    case (106 << 0):
        grav = 0.5
        state_boss_bump()
        break
    case (42 << 0):
        grav = 0.5
        boss_noise_handstandjump()
        break
    case (102 << 0):
        grav = 0.5
        boss_noise_crouchslide()
        break
    case (77 << 0):
        grav = 0.5
        boss_noise_skateboard()
        break
    case (167 << 0):
        grav = 0.5
        boss_noise_skateboardturn()
        break
    case (92 << 0):
        grav = 0.5
        boss_noise_jump()
        break
    case (74 << 0):
        grav = 0.5
        boss_noise_throwing()
        break
    case (58 << 0):
        grav = 0.5
        boss_noise_pogo()
        break
    case (170 << 0):
        grav = 0.5
        boss_noise_jetpackstart()
        break
    case (171 << 0):
        grav = 0.5
        boss_noise_jetpack()
        break
    case (173 << 0):
        grav = 0.5
        boss_noise_jetpackspin()
        break
    case (134 << 0):
        grav = 0.5
        state_boss_walk(boss_noise_do_attack)
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

angry = phase > 6
attacking = (state == (42 << 0) or state == (102 << 0) or state == (77 << 0) or state == (167 << 0) or state == (58 << 0) or state == (170 << 0) or state == (171 << 0) or state == (173 << 0) or state == (74 << 0))
