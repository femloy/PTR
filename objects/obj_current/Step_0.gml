if place_meeting(x, (y - 1), obj_player)
{
    with (obj_player)
    {
        if (state != (148 << 0) && state != (91 << 0) && state != (186 << 0) && state != (210 << 0) && state != (211 << 0))
        {
            if place_meeting(x, (y + 1), other)
            {
                if (state != (113 << 0) && state != (114 << 0) && state != (116 << 0) && state != (115 << 0))
                {
                    state = (94 << 0)
                    sprite_index = spr_currentplayer
                }
                else
                {
                    state = (116 << 0)
                    if (sprite_index != spr_player_barrelslipnslide)
                        sprite_index = spr_player_barrelroll
                }
                xscale = sign(other.image_xscale)
                movespeed = 20
            }
        }
        else
        {
            vsp = -6
            image_index = 0
        }
    }
}
