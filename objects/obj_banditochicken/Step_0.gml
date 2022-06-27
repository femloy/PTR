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
        scr_enemy_walk()
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
    case (128 << 0):
        scr_enemy_charge()
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
var targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1)
if (targetplayer.x > (x - 400) && targetplayer.x < (x + 400) && y <= (targetplayer.y + 160) && y >= (targetplayer.y - 160))
{
    if (state == (134 << 0) or state == (126 << 0))
        activated = 1
}
if ((!activated) && (state == (134 << 0) or state == (126 << 0)))
    sprite_index = spr_banditochicken_sleep
if ((state == (134 << 0) or state == (126 << 0)) && activated == 1 && sprite_index != spr_banditochicken_wake && sprite_index != spr_banditochicken_scared)
{
    movespeed = 0
    image_xscale = (-(sign((x - targetplayer.x))))
    image_index = 0
    sprite_index = spr_banditochicken_wake
}
if (sprite_index == spr_banditochicken_wake && floor(image_index) == (image_number - 1))
{
    image_xscale *= -1
    sprite_index = spr_banditochicken_chase
    state = (128 << 0)
    movespeed = 8
    with (instance_create(x, y, obj_jumpdust))
        image_xscale = other.image_xscale
}
if (state == (128 << 0) && bonebuffer > 0)
    bonebuffer--
if (grounded && jumping < 40 && state == (128 << 0))
    jumping++
if (state == (128 << 0) && grounded && jumping >= 40)
{
    vsp = -11
    jumping = 0
    instance_create(x, y, obj_highjumpcloud2)
}
if (bonebuffer == 0)
{
    with (instance_create(x, y, obj_banditobomb))
    {
        vsp = -9
        image_xscale = other.image_xscale
        hsp = 0
        instance_create(x, y, obj_genericpoofeffect)
        var old_y = y
        var t = 0
        while (y < room_height)
        {
            if place_meeting(x, y, obj_solid)
            {
                y++
                continue
            }
            else
            {
                t = 1
                break
            }
        }
        if (!t)
            y = old_y
    }
    bonebuffer = 100
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
