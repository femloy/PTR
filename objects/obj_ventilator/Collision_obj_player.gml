with (other)
{
    vsp = Approach(vsp, -5, 5)
    jumpstop = 1
    if (state == (105 << 0))
    {
        state = (92 << 0)
        if (sprite_index == spr_mach3boost or sprite_index == spr_machslideboost)
            xscale *= -1
        sprite_index = spr_machfreefall
    }
}
