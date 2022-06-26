if (room == rm_editor)
    exit;
switch state
{
    case (126 << 0):
        if (sprite_index != spr_soldier_idleend)
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
switch state
{
    case (126 << 0):
        if bush
        {
            var col = collision_line(x, y, player.x, player.y, obj_solid, false, true)
            var col2 = collision_line(x, y, player.x, player.y, obj_slope, false, true)
            var colX = (player.x > (x - threshold_x) && player.x < (x + threshold_x))
            var colY = (player.y > (y - threshold_y) && player.y < (y + threshold_y))
            if (sprite_index != scaredspr && col == -4 && col2 == -4 && colX && colY)
            {
                if (x != player.x)
                    image_xscale = sign((player.x - x))
                bush = 0
                sprite_index = spr_soldier_idleend
                image_index = 0
            }
        }
        else if (sprite_index == spr_soldier_idleend && floor(image_index) == (image_number - 1))
        {
            state = (134 << 0)
            sprite_index = spr_soldier_walk
        }
        break
    case (128 << 0):
        hsp = Approach(hsp, 0, 0.5)
        if (sprite_index == spr_soldier_shootstart && floor(image_index) == (image_number - 1))
            sprite_index = spr_soldier_shoot
        if (sprite_index != spr_soldier_shootstart)
        {
            if (bullet_count > 0)
            {
                if can_fire
                {
                    can_fire = 0
                    alarm[5] = fire_max
                    bullet_count--
                    sprite_index = spr_soldier_shoot
                    image_index = 0
                    hsp -= (image_xscale * recoil_spd)
                    with (instance_create(x, y, obj_enemybullet))
                        image_xscale = other.image_xscale
                }
            }
            else if (floor(image_index) == (image_number - 1))
            {
                sprite_index = walkspr
                attack_cooldown = attack_max
                state = (134 << 0)
            }
        }
        break
    case (134 << 0):
        if (attack_cooldown > 0)
            attack_cooldown--
        else
        {
            col = collision_line(x, y, player.x, player.y, obj_solid, false, true)
            col2 = collision_line(x, y, player.x, player.y, obj_slope, false, true)
            colX = (player.x > (x - threshold_x) && player.x < (x + threshold_x))
            colY = (player.y > (y - threshold_y) && player.y < (y + threshold_y))
            if (sprite_index != scaredspr && col == -4 && col2 == -4 && colX && colY)
            {
                if (x != player.x)
                    image_xscale = sign((player.x - x))
                sprite_index = spr_soldier_shootstart
                image_index = 0
                state = (128 << 0)
                bullet_count = bullet_max
                can_fire = 1
            }
        }
        break
}

if elite
{
    if (state == (134 << 0))
    {
        if (player.x > (x - 200) && player.x < (x + 200) && y <= (player.y + 60) && y >= (player.y - 60))
        {
            if (state != (125 << 0) && ragebuffer == 0)
            {
                hitboxcreate = 0
                state = (125 << 0)
                sprite_index = spr_soldier_knife
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
