if (room == rm_editor)
    exit;
targetplayer = instance_nearest(x, y, obj_player)
switch state
{
    case (126 << 0):
        scr_enemy_idle()
        break
    case (130 << 0):
        scr_enemy_turn()
        break
    case (134 << 0):
        if (targetplayer.x > (x - 700) && targetplayer.x < (x + 700) && targetplayer.y < (y + 500) && targetplayer.y > (y - 500))
        {
            if (grounded && x != targetplayer.x)
                image_xscale = sign((targetplayer.x - x))
            if (cooldown > 0)
                cooldown--
            if (targetplayer.x > (x - 100) && targetplayer.x < (x + 100) && grounded)
            {
                hsp = Approach(hsp, 0, 0.5)
                if (cooldown <= 0)
                {
                    state = (80 << 0)
                    sprite_index = spr_pepclone_attack
                    image_index = 0
                    shot = 0
                }
            }
            else
                hsp = (image_xscale * 6)
            if (state != (80 << 0))
            {
                if grounded
                {
                    if (hsp != 0)
                        sprite_index = walkspr
                    else
                        sprite_index = idlespr
                }
                else if (sprite_index != spr_player_jump && sprite_index != spr_player_fall)
                    sprite_index = spr_player_fall
                else if (sprite_index == spr_player_jump && floor(image_index) == (image_number - 1))
                    sprite_index = spr_player_fall
                var inst_front = collision_line(x, (y + 25), (x + (sign(hsp) * 78)), (y + 25), obj_solid, false, true)
                var inst_down = collision_line((x + (sign(hsp) * 16)), y, (x + (sign(hsp) * 16)), (y + 64), obj_solid, false, true)
                var inst_down2 = collision_line((x + (sign(hsp) * 16)), y, (x + (sign(hsp) * 16)), (y + 64), obj_platform, false, true)
                var inst_up = collision_line((x + (sign(hsp) * 96)), (y + 25), (x + (sign(hsp) * 96)), ((y - 78) + 50), obj_platform, false, true)
                if ((((!(place_meeting(x, (y + 1), obj_slope))) && (inst_front != -4 or inst_up != -4)) or (inst_down == -4 && inst_down2 == -4)) && targetplayer.y <= (y + 32) && grounded && state != (128 << 0))
                {
                    vsp = -11
                    sprite_index = spr_player_jump
                    image_index = 0
                }
            }
        }
        break
    case (80 << 0):
        hsp = Approach(hsp, 0, 1)
        if ((!shot) && floor(image_index) > 14)
        {
            shot = 1
            hitboxID = instance_create(x, y, obj_forkhitbox)
            with (hitboxID)
            {
                ID = other.id
                sprite_index = spr_weeniesquire_hitbox
            }
        }
        if (floor(image_index) > 23)
            instance_destroy(hitboxID)
        if (floor(image_index) == (image_number - 1))
        {
            state = (134 << 0)
            instance_destroy(hitboxID)
            cooldown = 100
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
