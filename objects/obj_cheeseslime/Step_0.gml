if (room == rm_editor)
    exit;
if snotty
    paletteselect = 1
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
    case (154 << 0):
        scr_enemy_pummel()
        break
    case (155 << 0):
        scr_enemy_staggered()
        break
    case (125 << 0):
        scr_enemy_rage()
        break
    case (17 << 0):
        scr_enemy_ghostpossess()
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
var player = instance_nearest(x, y, obj_player)
if elite
{
    var check = (image_xscale > 0 ? (player.x > x && player.x < (x + 200)) : (player.x < x && player.x > (x - 200)))
    if (state == (134 << 0))
    {
        if (check && y <= (player.y + 60) && y >= (player.y - 60))
        {
            if (state != (125 << 0) && ragebuffer == 0)
            {
                state = (125 << 0)
                sprite_index = ragespr
                if (x != player.x)
                    image_xscale = (-(sign((x - player.x))))
                ragebuffer = 100
                image_index = 0
                image_speed = 0.5
                flash = 1
                alarm[4] = 5
                create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
            }
        }
    }
    if (ragebuffer > 0)
        ragebuffer--
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
