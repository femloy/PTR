if (state == (134 << 0) && (!other.brick) && other.state == (259 << 0))
{
    var s = other.state
    scr_hurtplayer(other)
    if (s != other.state)
    {
        if (state == (134 << 0))
        {
            state = (80 << 0)
            sprite_index = spr_playerN_spin
            image_index = 0
        }
    }
}
