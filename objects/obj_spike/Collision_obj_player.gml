if (other.state != (113 << 0))
{
    scr_hurtplayer(other)
    if fake
        instance_destroy()
}
else
{
    with (other)
    {
        state = (106 << 0)
        sprite_index = spr_bump
        image_index = 0
        hsp = (-6 * xscale)
        vsp = -4
        scr_soundeffect(sfx_loseknight)
        repeat (3)
            create_debris(x, y, spr_wooddebris)
    }
}
