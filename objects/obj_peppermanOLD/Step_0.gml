targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1)
if (obj_bosscontroller.state == (144 << 0))
    exit;
if (hp <= 0 && state != (145 << 0) && state != (162 << 0))
{
    if ((!thrown) && (!destroyable))
        boss_destroy(lastplayerid)
}
if (chooseparry_buffer > 0)
    chooseparry_buffer--
switch phase
{
    case 1:
    case 2:
        normal_func = boss_pepperman_normal
        break
    case 3:
    case 4:
    case 5:
    case 6:
        normal_func = boss_pepperman_phase3normal
        break
}

switch state
{
    case (145 << 0):
        grav = 0.5
        state_boss_arenaround()
        break
    case (0 << 0):
        grav = 0.5
        normal_func()
        break
    case (92 << 0):
        grav = 0.5
        boss_pepperman_jump()
        invincible = 1
        inv_timer = 2
        break
    case (108 << 0):
        grav = 0.5
        boss_pepperman_freefall()
        break
    case (111 << 0):
        grav = 0.5
        boss_pepperman_freefallland()
        break
    case (122 << 0):
        grav = 0.5
        boss_pepperman_freefallprep()
        break
    case (153 << 0):
        grav = 0.5
        boss_pepperman_shoulderbash()
        break
    case (157 << 0):
        grav = 0.5
        boss_pepperman_supershoulderbash()
        break
    case (158 << 0):
        grav = 0.5
        boss_pepperman_superattackstart()
        break
    case (159 << 0):
        grav = 0.5
        boss_pepperman_superattackcharge()
        break
    case (76 << 0):
        grav = 0.5
        boss_pepperman_superslam()
        break
    case (162 << 0):
        grav = 0.5
        boss_pepperman_fistmatch()
        break
    case (163 << 0):
        grav = 0.5
        boss_pepperman_fistmatchend()
        break
    case (83 << 0):
        grav = 0.5
        boss_pepperman_shoulder()
        break
    case (161 << 0):
        grav = 0.5
        boss_pepperman_shoulderturn()
        break
    case (134 << 0):
        grav = 0.5
        state_boss_walk(boss_pepperman_decide_attack)
        invincible = 1
        inv_timer = 2
        break
    case (128 << 0):
        grav = 0.5
        boss_pepperman_charge()
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
        stunned = targetstunned
        break
    case (138 << 0):
        grav = 0.5
        state_boss_stun()
        break
}

xscale = image_xscale
colliding = (!((state == (76 << 0) or state == (162 << 0) or state == (158 << 0) or state == (159 << 0))))
attacking = (state == (153 << 0) or state == (108 << 0) or state == (122 << 0) or state == (157 << 0) or state == (83 << 0) or state == (76 << 0) or state == (162 << 0) or state == (158 << 0) or state == (159 << 0) or state == (134 << 0))
