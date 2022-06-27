if (room == rm_editor)
    exit;
var targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1)
if (bombreset > 0)
    bombreset--
if (state == (134 << 0))
{
    if (!chasing)
    {
        sprite_index = idlespr
        if (collision_line(x, y, targetplayer.x, targetplayer.y, obj_solid, false, true) == -4 && ((image_xscale < 0 && targetplayer.x < x) or (image_xscale > 0 && targetplayer.x > x)) && targetplayer.y < (y + threshold_y) && targetplayer.y > (y - threshold_y))
            targetplayer = instance_nearest(x, y, obj_player)
        if (targetplayer.x > (x - 150) && targetplayer.x < (x + 150) && y <= (targetplayer.y + 60) && y >= (targetplayer.y - 60))
        {
            chasing = 1
            state = (128 << 0)
            attack_count = attack_max
            if (x != targetplayer.x)
                image_xscale = (-(sign((x - targetplayer.x))))
            sprite_index = walkspr
            image_index = 0
            bombreset = attackreset
        }
    }
    else
    {
        state = (141 << 0)
        sprite_index = walkspr
        image_index = 0
    }
}
else if (state == (141 << 0))
{
    if (sprite_index == spr_shrimp_throw)
        sprite_index = spr_shrimp_walk
    if (abs((x - targetplayer.x)) < 64)
    {
        if (grounded && vsp > -1)
            hsp = 0
        else if (!grounded)
            hsp = (image_xscale * chasespeed)
    }
    else if grounded
    {
        if (x != targetplayer.x && grounded)
            image_xscale = (-(sign((x - targetplayer.x))))
        hsp = (image_xscale * chasespeed)
    }
    if (bombreset <= 0 && grounded)
    {
        if (targetplayer.x > (x - attackthreshold_x) && targetplayer.x < (x + attackthreshold_x) && targetplayer.y > (y - attackthreshold_y) && targetplayer.y < (y + attackthreshold_y))
        {
            state = (128 << 0)
            hsp = 0
            attack_count = attack_max
        }
    }
    var inst_front = collision_line(x, (y + 25), (x + (sign(hsp) * 78)), (y + 25), obj_solid, false, true)
    var inst_up = collision_line((x + (sign(hsp) * 96)), (y + 25), (x + (sign(hsp) * 96)), ((y - 78) + 50), obj_platform, false, true)
    var inst_down = collision_line((x + (sign(hsp) * 16)), y, (x + (sign(hsp) * 16)), (y + 64), obj_solid, false, true)
    var inst_down2 = collision_line((x + (sign(hsp) * 16)), y, (x + (sign(hsp) * 16)), (y + 64), obj_platform, false, true)
    if (image_index > (image_number - 1))
    {
        if (sprite_index == spr_shrimp_jump)
        {
            sprite_index = spr_shrimp_fall
            image_index = 0
        }
        else if (sprite_index == spr_shrimp_land)
        {
            sprite_index = spr_shrimp_walk
            image_index = 0
        }
    }
    if (grounded && sprite_index == spr_shrimp_fall)
    {
        sprite_index = spr_shrimp_land
        image_index = 0
    }
    if ((inst_front != -4 or inst_up != -4 or (inst_down == -4 && inst_down2 == -4)) && targetplayer.y <= (y + 32) && grounded && state != (128 << 0))
    {
        vsp = -11
        sprite_index = spr_shrimp_jump
        image_index = 0
        hsp = (image_xscale * chasespeed)
    }
}
if (state == (128 << 0))
{
    bombreset = attackreset
    if (attack_count > 0)
    {
        if (sprite_index != spr_shrimp_punch)
        {
            sprite_index = spr_shrimp_punch
            image_index = 0
        }
        attack_count--
    }
    else
    {
        state = (80 << 0)
        attackspeed = attackspeed_max
        hsp = (image_xscale * attackspeed)
    }
}
if (state == (80 << 0))
{
    if (!instance_exists(punchinst))
    {
        punchinst = instance_create(x, y, obj_forkhitbox)
        with (punchinst)
            ID = other.id
    }
    if (alarm[4] == -1)
        alarm[4] = 7
    hsp = (image_xscale * attackspeed)
    if (attackspeed > 0)
        attackspeed -= deccel
    else
        attackspeed = 0
    if (attackspeed == 0)
    {
        bombreset = attackreset
        state = (134 << 0)
        sprite_index = walkspr
        image_index = 0
    }
    if place_meeting((x + sign(hsp)), y, obj_destructibles)
    {
        var num = instance_place_list((x + sign(hsp)), y, 332, global.instancelist, 0)
        for (var i = 0; i < num; i++)
            instance_destroy(ds_list_find_value(global.instancelist, i))
        ds_list_clear(global.instancelist)
    }
}
else if (flash && alarm[4] == -1)
    alarm[4] = 7
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
        chasing = 1
        scr_enemy_stun()
        break
    case (129 << 0):
        scr_pizzagoblin_throw()
        break
    case (4 << 0):
        chasing = 1
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
if (elite && ragecooldown <= 0)
{
    var player = instance_nearest(x, y, obj_player)
    if (state == (134 << 0) or state == (128 << 0))
    {
        if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60))
        {
            image_xscale = (-(sign((x - player.x))))
            sprite_index = spr_shrimp_knife
            image_index = 0
            flash = 1
            shot = 0
            alarm[4] = 5
            state = (125 << 0)
            create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
            ragecooldown = 100
        }
    }
}
if (ragecooldown > 0)
    ragecooldown--
scr_scareenemy()
if (sprite_index == scaredspr && state == (126 << 0))
    invincible = 0
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
