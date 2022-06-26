image_speed = 0.35
depth = -10
switch state
{
    case (217 << 0):
        sprite_index = spr_introidle
        image_speed = 0.35
        break
    case (218 << 0):
        if (sprite_index != spr_intro)
        {
            sprite_index = spr_intro
            image_index = 0
        }
        if (floor(image_index) == (image_number - 1))
            state = (220 << 0)
        break
    case (219 << 0):
        sprite_index = spr_monstertomato_idle
        x = (camera_get_view_x(view_camera[0]) + 480)
        y = (camera_get_view_y(view_camera[0]) + yy)
        switch substate
        {
            case (135 << 0):
                yy += 2
                if (yy > 440)
                {
                    var pid = scr_puppet_detect()
                    trace(pid)
                    if (pid != noone)
                    {
                        playerid = pid
                        substate = (141 << 0)
                    }
                    else
                        substate = (92 << 0)
                }
                break
            case (92 << 0):
                yy -= 3
                if (yy < -100)
                {
                    destroy = 0
                    with (obj_monstertrackingrooms)
                    {
                        sound_buffer = 0
                        monster_pos[other.monsterid].x = last_puppet_pos.x
                        monster_pos[other.monsterid].y = last_puppet_pos.y
                    }
                    state = (217 << 0)
                }
                break
            case (141 << 0):
                yy -= 10
                if (yy < -100)
                    scr_puppet_appear(playerid)
                break
        }

        break
    case (220 << 0):
        playerid = instance_nearest(x, y, obj_player)
        sprite_index = spr_monstertomato_chase
        var dir = point_direction(x, y, playerid.x, playerid.y)
        if (!((x > (playerid.x - 8) && x < (playerid.x + 8) && y > (playerid.y - 8) && y < (playerid.y + 8))))
        {
            x += lengthdir_x(6, dir)
            y += lengthdir_y(6, dir)
        }
        if (x != playerid.x)
            image_xscale = sign((playerid.x - x))
        break
}

if (state != (217 << 0))
    inactivebuffer = 900
depth = (state == (219 << 0) ? 100 : -6)
