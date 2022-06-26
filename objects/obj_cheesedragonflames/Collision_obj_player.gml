with (other)
{
    var b = 1
    for (i = 0; i < array_length(transformation); i += 1)
    {
        if (state == transformation[i])
            b = 0
    }
    if (b == 1)
    {
        state = (9 << 0)
        image_index = 0
        vsp = -25
        sprite_index = spr_fireass
        scr_soundeffect(sfx_scream5)
    }
}
