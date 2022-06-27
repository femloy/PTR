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
    case (106 << 0):
        sprite_index = spr_badrat_stun
        if (grounded && vsp > 0)
        {
            state = (134 << 0)
            sprite_index = walkspr
        }
        break
}

var targetplayer = instance_nearest(x, y, obj_player)
if (cooldown > 0)
    cooldown--
if (state == (134 << 0) && cooldown <= 0)
{
    if (targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y > (y - 50) && targetplayer.y < (y + 50))
    {
        state = (80 << 0)
        sprite_index = spr_badrat_attack1
        image_index = 0
        if (x != targetplayer.x)
            image_xscale = sign((targetplayer.x - x))
    }
}
if (state == (80 << 0))
{
    var mv = 8
    image_speed = 0.35
    if (sprite_index == spr_badrat_attack1)
    {
        hsp = 0
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_badrat_attack2
            cooldown = 30
        }
    }
    else if (sprite_index == spr_badrat_attack2)
    {
        hsp = (image_xscale * mv)
        vsp = 0
        if (!instance_exists(hitboxID))
        {
            hitboxID = instance_create(x, y, obj_forkhitbox)
            hitboxID.ID = id
        }
        if (cooldown > 0)
            cooldown--
        else if (grounded or (place_meeting((x + sign(hsp)), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_slope)))))
            sprite_index = spr_badrat_attack2end
    }
    else if (sprite_index == spr_badrat_attack2end)
    {
        hsp = (image_xscale * mv)
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_badrat_attack3
            instance_destroy(hitboxID)
        }
    }
    else
    {
        hsp = Approach(hsp, 0, 0.2)
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = walkspr
            state = (134 << 0)
            instance_destroy(hitboxID)
            cooldown = 80
        }
    }
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
if place_meeting(x, y, obj_canonexplosion)
    instance_destroy()
if (state != (4 << 0))
    depth = 0
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
if (state != (138 << 0))
    thrown = false
