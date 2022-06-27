if (room == rm_editor)
    exit;
var targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1)
if (bombreset > 0)
    bombreset--
if (state == (134 << 0))
{
    if (!chasing)
    {
        targetplayer = instance_nearest(x, y, obj_player)
        if (targetplayer.x > (x - 1900) && targetplayer.x < (x + 1900) && y <= (targetplayer.y + 540) && y >= (targetplayer.y - 540))
        {
            chasing = 1
            image_index = 0
            sprite_index = walkspr
            if (x != targetplayer.x)
                image_xscale = (-(sign((x - targetplayer.x))))
            state = (129 << 0)
            hsp = 0
        }
    }
    else
    {
        state = (141 << 0)
        sprite_index = walkspr
        image_index = 0
    }
}
else if (state == (141 << 0))
{
    if (abs((x - targetplayer.x)) < 78)
    {
        if (grounded && vsp > -1)
            hsp = 0
        else if (!grounded)
            hsp = (image_xscale * chasespeed)
    }
    else
    {
        if (x != targetplayer.x && grounded)
            image_xscale = (-(sign((x - targetplayer.x))))
        hsp = (image_xscale * chasespeed)
    }
    var inst_front = collision_line(x, (y + 25), (x + (sign(hsp) * 78)), (y + 25), obj_solid, false, true)
    if (bombreset == 0)
    {
        if (targetplayer.x > (x - attackthreshold_x) && targetplayer.x < (x + attackthreshold_x) && targetplayer.y > (y - attackthreshold_y) && targetplayer.y < (y + attackthreshold_y) && (inst_front == noone or (inst_front != noone && x > inst_front.x && targetplayer.x > inst_front.x) or (inst_front != noone && x < inst_front.x && targetplayer.x < inst_front.x)))
        {
            state = (128 << 0)
            hsp = 0
            attack_count = attack_max
        }
    }
    var inst_down = collision_line((x + (sign(hsp) * 16)), y, (x + (sign(hsp) * 16)), (y + 64), obj_solid, false, true)
    var inst_down2 = collision_line((x + (sign(hsp) * 16)), y, (x + (sign(hsp) * 16)), (y + 64), obj_platform, false, true)
    var inst_up = collision_line((x + (sign(hsp) * 96)), (y + 25), (x + (sign(hsp) * 96)), ((y - 78) + 50), obj_platform, false, true)
    if ((inst_front != noone or inst_up != -4 or (inst_down == -4 && inst_down2 == -4)) && targetplayer.y <= (y + 32) && grounded && state != (128 << 0))
        vsp = -11
}
if (state == (128 << 0))
{
    if (attack_count > 0)
        attack_count--
    else
    {
        image_index = 0
        sprite_index = spr_shrimp_throw
        state = (129 << 0)
        hsp = 0
    }
}
switch state
{
    case (126 << 0):
        scr_enemy_idle()
        break
    case (130 << 0):
        scr_enemy_turn()
        break
    case (134 << 0):
        scr_enemy_walk()
        break
    case (136 << 0):
        scr_enemy_land()
        break
    case (137 << 0):
        scr_enemy_hit()
        break
    case (138 << 0):
        chasing = 1
        scr_enemy_stun()
        break
    case (129 << 0):
        scr_pizzagoblin_throw()
        break
    case (4 << 0):
        chasing = 1
        scr_enemy_grabbed()
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
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
scr_scareenemy()
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
