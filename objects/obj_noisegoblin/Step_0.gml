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
}

if (state == (138 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != (138 << 0))
    birdcreated = 0
scr_scareenemy()
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != (4 << 0))
    depth = 0
if (state != (138 << 0))
    thrown = 0
if (bombreset > 0)
    bombreset--
targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1)
if (sprite_index == spr_archergoblin_shoot)
    image_xscale = (-(sign((x - targetplayer.x))))
if (x != targetplayer.x && targetplayer.state != (51 << 0) && state != (129 << 0) && bombreset == 0 && grounded)
{
    if (targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && y <= (targetplayer.y + 200) && y >= (targetplayer.y - 200))
    {
        if (state == (134 << 0) or state == (126 << 0))
        {
            sprite_index = spr_archergoblin_shoot
            image_index = 0
            image_xscale = (-(sign((x - targetplayer.x))))
            state = (129 << 0)
        }
    }
}
if instance_exists(obj_player2)
{
    if (x != obj_player2.x && obj_player2.state != (51 << 0) && state != (129 << 0) && bombreset == 0 && grounded)
    {
        if (obj_player2.x > (x - 200) && obj_player2.x < (x + 200) && y <= (obj_player2.y + 200) && y >= (obj_player2.y - 200))
        {
            if (state == (134 << 0) or state == (126 << 0))
            {
                sprite_index = spr_archergoblin_shoot
                image_index = 0
                image_xscale = (-(sign((x - obj_player2.x))))
                state = (129 << 0)
            }
        }
    }
}
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
