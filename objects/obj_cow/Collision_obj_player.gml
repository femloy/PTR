with (other)
{
    if (state != (190 << 0) && vsp > 0 && (!(place_meeting(x, yprevious, other))))
    {
        if (state == (11 << 0) or state == (12 << 0) or state == (13 << 0))
            has_mort = 1
        else
            has_mort = 0
    }
}
