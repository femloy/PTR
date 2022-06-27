if (room == rm_editor)
    exit;
switch state
{
    case (126 << 0):
        scr_enemy_idle()
        break
    case (128 << 0):
        scr_enemy_charge()
        break
    case (130 << 0):
        scr_enemy_turn()
        break
    case (134 << 0):
        scr_enemy_walk()
        if (!instance_exists(coneID))
        {
            coneID = instance_create(x, y, obj_patrolcone)
            coneID.baddieID = id
        }
        if (alarm[5] != -1)
            hsp = 0
        break
    case (136 << 0):
        scr_enemy_land()
        break
    case (137 << 0):
        scr_enemy_hit()
        break
    case (138 << 0):
        scr_enemy_stun()
        break
    case (129 << 0):
        scr_pizzagoblin_throw()
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
    case (125 << 0):
        scr_enemy_rage()
        break
}

if (state == (138 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != (138 << 0))
    birdcreated = 0
if (state == (134 << 0) && y > ystart && (!(scr_solid(x, (y - 1)))))
    y--
if (state == (134 << 0) && y < ystart && (!(scr_solid(x, (y + 1)))))
    y++
if (state == (138 << 0))
    grav = 0.5
else
    grav = 0
if (cooldown > 0)
    cooldown--
if (state == (134 << 0))
{
    if (!patrolfound)
    {
        if (cooldown <= 0 && alarm[5] == -1 && instance_exists(coneID) && coneID.collision)
        {
            patroltimer = patroltimermax
            patrolfound = 1
            alarm[5] = 60
        }
    }
    else if (alarm[5] == -1)
        alarm[5] = 60
}
else if (state == (138 << 0) or state == (4 << 0) or state == (137 << 0))
    alarm[5] = -1
if (state == (134 << 0) && point_in_camera(x, y, view_camera[0]))
{
    var p = 0
    with (obj_player)
    {
        if (state == (84 << 0) && sprite_index == spr_taunt)
            p = 1
    }
    if p
    {
        patroltimer = 0
        alarm[5] = 1
    }
}
if (state == (80 << 0))
{
    hsp = 0
    if (floor(image_index) == (image_number - 1))
    {
        state = (134 << 0)
        sprite_index = walkspr
        cooldown = 100
    }
}
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != (4 << 0))
    depth = 0
if (state == (138 << 0) or state == (134 << 0))
    movespeed = 0
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
