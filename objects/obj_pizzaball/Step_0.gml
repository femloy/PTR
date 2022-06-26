if (room == rm_editor)
    exit;
if (state == (134 << 0) && grounded && vsp > 0 && obj_player.state == (111 << 0))
    scr_pizzaball_go_to_thrown(0, -10)
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
        scr_pizzaball_hit()
        break
    case (148 << 0):
        scr_pizzaball_golf()
        break
    case (156 << 0):
        scr_pizzaball_thrown()
        break
    case (138 << 0):
        scr_pizzaball_go_to_thrown(0, (vsp * 0.5))
        break
    case (129 << 0):
        scr_pizzagoblin_throw()
        break
    case (4 << 0):
        scr_pizzaball_grabbed()
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

if ((state == (134 << 0) or state == (126 << 0)) && sit)
{
    hsp = 0
    sprite_index = spr_pizzaball_idle1
}
if (state != (134 << 0))
    sit = 0
if (state == (138 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state == (156 << 0) && (!instance_exists(pointerID)))
{
    pointerID = instance_create(x, y, obj_objecticontracker)
    pointerID.sprite_index = spr_icon_pizzaball
    pointerID.objectID = id
}
if (state != (138 << 0))
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
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
if (state == (156 << 0))
{
    with (instance_place((x + xscale), y, obj_destructibles))
        instance_destroy()
    with (instance_place(((x + hsp) + xscale), y, obj_destructibles))
        instance_destroy()
    with (instance_place(x, ((y + vsp) + 1), obj_destructibles))
        instance_destroy()
    with (instance_place(x, ((y + vsp) - 1), obj_destructibles))
        instance_destroy()
    with (instance_place(x, (y + 1), obj_destructibles))
        instance_destroy()
    with (instance_place(x, (y - 1), obj_destructibles))
        instance_destroy()
}
