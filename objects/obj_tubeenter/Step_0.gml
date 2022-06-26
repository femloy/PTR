if (state == (150 << 0))
{
    if (floor(image_index) >= 11)
    {
        with (playerid)
        {
            state = (150 << 0)
            tube_id = other.id
            if (other.stored_spd == 0)
                other.stored_spd = 1
            hsp = (other.hsp * other.stored_spd)
            vsp = (other.vsp * other.stored_spd)
            tube_vsp = (other.vsp * other.stored_spd)
            stored_spd = 0
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
