if place_meeting(x, (y - 1), obj_player)
{
    with (obj_player)
    {
        if (state != (186 << 0) && place_meeting(x, (y + 1), other))
        {
            if (state == (47 << 0))
                state = (38 << 0)
            else if (state != (38 << 0) && state != (99 << 0))
            {
                if (state != (105 << 0) && state != (5 << 0) && state != (42 << 0) && state != (103 << 0) && state != (104 << 0) && state != (121 << 0))
                {
                    if (icedir != (-xscale) && move != 0)
                    {
                        if (prevmovespeed != 0)
                            icemovespeed = prevmovespeed
                        else
                            icemovespeed = 8
                        icedir = (-xscale)
                        savedicedir = (-xscale)
                    }
                    if (prevmove != move && move == 0)
                    {
                        icemovespeed = (-((prevmovespeed - previcemovespeed)))
                        icedir = (-xscale)
                    }
                }
                else if (state == (105 << 0))
                {
                    if (prevstate != state)
                    {
                        icedir = xscale
                        icemovespeed = floor((abs(movespeed) * 0.5))
                    }
                }
                else if (state == (5 << 0))
                    icemovespeed = 0
            }
        }
    }
}
