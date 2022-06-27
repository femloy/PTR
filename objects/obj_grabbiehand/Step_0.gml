switch state
{
    case (0 << 0):
        break
    case (8 << 0):
        if (floor(image_index) == (image_number - 1))
        {
            state = (135 << 0)
            sprite_index = spr_grabbiehand_fall
        }
        break
    case (135 << 0):
        var spd = 12
        shootdir = angle_rotate(shootdir, point_direction(x, y, targetplayer.x, targetplayer.y), turnspeed)
        hsp = lengthdir_x(spd, shootdir)
        vsp = lengthdir_y(spd, shootdir)
        if (hsp != 0)
            image_xscale = sign(hsp)
        if grounded
        {
            state = (138 << 0)
            stunned = 50
            hsp = 0
            vsp = 0
            sprite_index = spr_grabbiehand_catch
        }
        scr_collide()
        break
    case (138 << 0):
        if (stunned > 0)
            stunned--
        else if grounded
        {
            state = (7 << 0)
            sprite_index = spr_grabbiehand_idle
            grounded = false
        }
        if grounded
            hsp = 0
        scr_collide()
        break
    case (7 << 0):
        var _dir = point_direction(x, y, xstart, ystart)
        x = Approach(x, xstart, abs(lengthdir_x(8, _dir)))
        y = Approach(y, ystart, abs(lengthdir_y(8, _dir)))
        if (x > (xstart - 8) && x < (xstart + 8) && y > (ystart - 8) && y < (ystart + 8))
        {
            state = (0 << 0)
            x = xstart
            y = ystart
        }
        break
    case (55 << 0):
        sprite_index = spr_grabbiehand_catch
        if (!reverse)
            vsp = -14
        else
            vsp = 14
        hsp = 0
        with (playerid)
        {
            hsp = 0
            vsp = 0
            x = other.x
            y = other.y
            xscale = other.image_xscale
            if (object_index != obj_pizzagoblinbomb)
            {
                state = (106 << 0)
                if (boxxed == 0)
                    sprite_index = spr_player_catched
                else
                    sprite_index = spr_boxxedpep_air
            }
        }
        if (scr_solid(x, (y - 1)) or (reverse && scr_solid(x, (y + 1))) or place_meeting(x, y, obj_verticalhallway) or place_meeting(x, y, obj_hallway))
        {
            if (playerid == obj_player1.id)
            {
                with (playerid)
                {
                    movespeed = tauntstoredmovespeed
                    vsp = 0
                    sprite_index = tauntstoredsprite
                    state = tauntstoredstate
                }
            }
            sprite_index = spr_grabbiehand_idle
            state = (7 << 0)
            if fake
                instance_destroy()
        }
        scr_collide()
        break
    default:

}

