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
        if (!idle)
            scr_enemy_walk()
        else
        {
            sprite_index = idlespr
            hsp = 0
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

scr_scareenemy()
if (state != (134 << 0))
    idle = 0
if (state == (134 << 0))
{
    var x1 = 270
    playerid = instance_nearest(x, y, obj_player)
    var t = (playerid.x > (x - x1) && playerid.x < (x + x1) && playerid.y > (y - 100) && playerid.y < (y + 100))
    if (cooldown > 0)
        cooldown--
    else if (t && collision_line(x, y, playerid.x, playerid.y, obj_solid, false, true) == -4)
    {
        var b = id
        with (obj_farmerbaddie)
        {
            if ((id == b or distance_to_object(other) < 300) && state != (4 << 0) && state != (138 << 0) && state != (137 << 0) && state != (266 << 0))
            {
                state = (92 << 0)
                sprite_index = ragespr
                vsp = -5
                hsp = 0
                if (other.playerid.x != x)
                    image_xscale = sign((other.playerid.x - x))
                if (id != b)
                    leaderID = b
                else
                    leaderID = noone
            }
        }
    }
}
else if (state == (92 << 0))
{
    if (grounded && vsp > 0)
    {
        state = (80 << 0)
        sprite_index = ragespr
        attackspeed = 8
    }
}
else if (state == (80 << 0))
{
    if (object_index != obj_farmerbaddie3 && (!instance_exists(hitboxID)))
    {
        with (instance_create(x, y, obj_forkhitbox))
        {
            ID = other.id
            other.hitboxID = id
        }
    }
    x1 = 450
    playerid = instance_nearest(x, y, obj_player)
    t = (playerid.x > (x - x1) && playerid.x < (x + x1) && playerid.y > (y - 400) && playerid.y < (y + 400))
    hsp = (image_xscale * attackspeed)
    var q = outofsight
    if (leaderID == noone)
    {
        if ((!t) or collision_line(x, y, playerid.x, playerid.y, obj_solid, true, false) != -4)
            outofsight = 1
        if t
            outofsight = 0
    }
    else if (instance_exists(leaderID) && leaderID.state == (80 << 0))
        outofsight = leaderID.outofsight
    else
        leaderID = noone
    if outofsight
    {
        if (q != outofsight)
            waitbuffer = 30
        if (waitbuffer > 0)
            waitbuffer--
        else
            attackspeed = Approach(attackspeed, 0, 0.1)
    }
    else
        attackspeed = Approach(attackspeed, attackmaxspeed, 1)
    if (attackspeed <= 0)
    {
        cooldown = 60
        state = (134 << 0)
        idle = 0
        hsp = 0
        sprite_index = walkspr
    }
    if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))))
        image_xscale *= -1
}
if (state != (80 << 0) && hitboxID != noone && instance_exists(hitboxID))
{
    instance_destroy(hitboxID)
    hitboxID = -4
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
