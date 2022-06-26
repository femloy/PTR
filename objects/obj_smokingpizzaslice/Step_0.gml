if (room == rm_editor)
    exit;
if (bombreset > 0)
    bombreset--
switch state
{
    case (134 << 0):
        if (substate_buffer > 0)
            substate_buffer--
        else
        {
            substate_buffer = substate_max
            var old_substate = substate
            while (substate == old_substate)
                substate = choose((134 << 0), (126 << 0), (130 << 0))
            if (substate == (134 << 0))
                image_xscale = choose(-1, 1)
            else if (substate == (130 << 0))
            {
                sprite_index = spr_pizzaslug_turn
                image_index = 0
                hsp = 0
            }
        }
        switch substate
        {
            case (134 << 0):
                image_speed = 0.35
                if (sprite_index != spr_pizzaslug_walk)
                {
                    image_index = 0
                    sprite_index = spr_pizzaslug_walk
                }
                scr_enemy_walk()
                break
            case (126 << 0):
                image_speed = 0.35
                hsp = 0
                sprite_index = spr_pizzaslug_idle
                break
            case (130 << 0):
                image_speed = 0.35
                substate_buffer = 5
                if (sprite_index == spr_pizzaslug_turn && floor(image_index) == (image_number - 1))
                {
                    image_xscale *= -1
                    substate_buffer = substate_max
                    substate = (126 << 0)
                    sprite_index = spr_pizzaslug_idle
                }
                break
            case (129 << 0):
                state = (129 << 0)
                substate_buffer = 0
                image_index = 0
                sprite_index = spr_pizzaslug_cough
                break
        }

        break
    case (126 << 0):
        scr_enemy_idle()
        break
    case (130 << 0):
        scr_enemy_turn()
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
var player = instance_nearest(x, y, obj_player)
if (state == (134 << 0))
{
    if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60) && ragecooldown == 0)
    {
        if (global.stylethreshold >= 3 or elite)
        {
            if (x != player.x)
                image_xscale = (-(sign((x - player.x))))
            image_speed = 0.6
            hsp = 0
            shot = 0
            sprite_index = spr_pizzaslug_rage
            image_index = 0
            state = (125 << 0)
            flash = 1
            alarm[4] = 5
            create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
        }
        else
        {
            if (x != player.x)
                image_xscale = (-(sign((x - player.x))))
            ragecooldown = 160
            state = (129 << 0)
            substate_buffer = 0
            image_index = 0
            sprite_index = spr_pizzaslug_cough
        }
    }
}
if (ragecooldown > 0)
    ragecooldown--
scr_scareenemy()
if (state != (4 << 0))
    depth = 0
if (state != (138 << 0))
    thrown = 0
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
