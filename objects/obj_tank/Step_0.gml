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
if (state == (138 << 0) && lasthp != hp && (!tired) && grounded)
{
    tired = 1
    stunned = 10
    lasthp = hp
    killprotection = 0
}
if (state != (138 << 0))
    birdcreated = 0
if (stuntouchbuffer > 0)
    stuntouchbuffer--
if ((!instance_exists(spawnenemyID)) && state == (134 << 0))
{
    state = (126 << 0)
    sprite_index = spr_tank_spawnenemy
    image_index = 0
    with (instance_create(x, (y - 18), content))
    {
        important = 1
        other.spawnenemyID = id
    }
}
var player = instance_nearest(x, y, obj_player)
if (bombreset > 0)
    bombreset--
if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60))
{
    if (state != (125 << 0) && bombreset <= 0 && (global.stylethreshold >= 3 or elite) && state == (134 << 0))
    {
        state = (125 << 0)
        sprite_index = spr_tank_chargestart
        if (x != player.x)
            image_xscale = (-(sign((x - player.x))))
        ragebuffer = 100
        image_index = 0
        image_speed = 0.5
        flash = 1
        alarm[4] = 5
        bombreset = 200
        create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
    }
    else if (x != player.x && state != (125 << 0) && grounded && bombreset <= 0)
    {
        if (state == (134 << 0))
        {
            state = (129 << 0)
            hsp = 0
            sprite_index = spr_tank_shoot
        }
    }
}
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (hitboxcreate == 0 && state == (125 << 0))
{
    hitboxcreate = 1
    with (instance_create(x, y, obj_minijohn_hitbox))
        ID = other.id
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
        baddieID = other.id
        other.boundbox = 1
    }
}
