if (state == (150 << 0))
{
    if (floor(image_index) >= 6)
    {
        with (playerid)
        {
            visible = true
            state = (108 << 0)
            vsp = 10
            sprite_index = spr_player_rockethitwall
            if place_meeting(x, y, obj_solid)
            {
                while place_meeting(x, y, obj_solid)
                    y--
            }
            var p = (object_index == obj_player1 ? 0 : 1)
            GamepadSetVibration(p, 1, 1, 0.9)
        }
    }
    with (playerid)
    {
        if (!(place_meeting(x, y, other.id)))
        {
            with (other)
            {
                playerid = -1
                state = (0 << 0)
            }
        }
    }
}
