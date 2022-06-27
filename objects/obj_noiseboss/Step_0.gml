if (room == rm_editor)
    exit;
targetplayer = instance_nearest(x, y, obj_player)
wastedhits = (8 - elitehit)
if (elitehit <= 2)
    attackpool = [(174 << 0), (130 << 0), (72 << 0), (72 << 0), (72 << 0)]
else if (elitehit <= 4)
    attackpool = [(174 << 0), (174 << 0), (174 << 0), (130 << 0)]
else if (elitehit <= 6)
    attackpool = [(130 << 0)]
switch state
{
    case (134 << 0):
        scr_noise_walk()
        break
    case (92 << 0):
        scr_noise_jump()
        break
    case (80 << 0):
        scr_noise_punch()
        break
    case (174 << 0):
        scr_noise_shield()
        break
    case (72 << 0):
        scr_noise_pistol()
        break
    case (137 << 0):
        scr_enemy_hit()
        break
    case (138 << 0):
        scr_enemy_stun()
        break
    case (4 << 0):
        scr_enemy_grabbed()
        break
    case (154 << 0):
        scr_enemy_pummel()
        break
    case (155 << 0):
        scr_enemy_staggered()
        break
}

if (state != (108 << 0) && state != (111 << 0))
    hit = 0
if (state == (138 << 0))
{
    movespeed = 0
    if thrown
    {
        savedthrown = true
        placedtraps = 0
        jumpbuffer = 1
        attacked = 0
        with (obj_noisetrap)
            instance_destroy()
    }
    if (grounded && vsp > 0 && savedthrown)
    {
        stunned = 1
        idle_timer = 1
    }
}
else
    savedthrown = false
if (state == (138 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state == (92 << 0) or (state == (174 << 0) && substate == (92 << 0)))
{
    use_collision = 0
    x += hsp
    y += vsp
    if (vsp < 20)
        vsp += grav
}
else
    use_collision = 1
if ((state == (72 << 0) && substate == (66 << 0)) or (state == (174 << 0) && substate == (174 << 0)) or (state == (134 << 0) && ((!placedtraps) or ((!obj_player1.brick) && (!instance_exists(obj_brickball))))) or state == (80 << 0) or state == (138 << 0) or (!use_collision))
    invincible = 1
else
    invincible = 0
if (state != (138 << 0))
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != (4 << 0))
    depth = 0
if (state != (138 << 0))
    thrown = false
if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index
        mask_index = other.sprite_index
        baddieID = other.id
        other.boundbox = 1
    }
}
