with (other)
{
    if (state != (4 << 0))
    {
        if place_meeting(x, (y - 1), obj_solid)
            ventilator_vsp = 5
        if place_meeting(x, (y + 1), obj_solid)
            ventilator_vsp = -5
        vsp = ventilator_vsp
    }
}
