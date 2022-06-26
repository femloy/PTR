if used
    image_index = 1
else
    image_index = 0
var s = 16
if place_meeting(x, (y - s), obj_player)
{
    with (obj_player)
    {
        var by = 4
        if (state == (121 << 0))
            by = 10
        var bx = 8
        if (state == (121 << 0) or state == (201 << 0))
            bx = 18
        if ((state == (104 << 0) or state == (201 << 0) or state == (211 << 0) or state == (5 << 0) or state == (121 << 0) or state == (187 << 0)) && y <= (other.y + by) && xscale == sign(other.image_xscale) && place_meeting(x, (y + s), other))
        {
            vsp = -12
            movespeed = 14
            sprite_index = spr_player_rampjump
            image_index = 0
            if isgustavo
            {
                sprite_index = spr_player_ratmountwalljump
                state = (203 << 0)
            }
            else
                state = (187 << 0)
            if (!other.used)
            {
                ramp = 1
                other.used = 1
            }
            ramp_buffer = 16
            trace("trickjump")
        }
    }
}
