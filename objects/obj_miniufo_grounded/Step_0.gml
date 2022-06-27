if (room == rm_editor)
    exit;
switch state
{
    case (126 << 0):
        scr_enemy_idle()
        break
    case (130 << 0):
        scr_enemy_turn()
        break
    case (134 << 0):
        if (!grounded)
            sprite_index = spr_ufogrounded_fall
        if (sprite_index != spr_ufogrounded_fall && sprite_index != spr_ufogrounded_land)
        {
            invincible = 0
            scr_enemy_walk()
        }
        else if (sprite_index == spr_ufogrounded_fall)
        {
            hsp = 0
            if grounded
            {
                sprite_index = spr_ufogrounded_land
                image_index = 0
            }
        }
        else
        {
            if (image_index > 11)
                hsp = sign(image_xscale)
            if (floor(image_index) == (image_number - 1))
            {
                sprite_index = spr_ufogrounded_walk
                invincible = 0
            }
        }
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

if (state != (134 << 0))
    invincible = 0
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
var targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1)
if (bombreset > 0)
    bombreset--
if (x != targetplayer.x && state != (129 << 0) && bombreset == 0 && grounded)
{
    if (targetplayer.x > (x - 400) && targetplayer.x < (x + 400) && y <= (targetplayer.y + 20) && y >= (targetplayer.y - 20))
    {
        if ((state == (134 << 0) or state == (126 << 0)) && (!scr_solid_line(targetplayer)))
        {
            sprite_index = spr_ufogrounded_shoot
            image_index = 0
            image_xscale = (-(sign((x - targetplayer.x))))
            state = (129 << 0)
        }
    }
}
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
