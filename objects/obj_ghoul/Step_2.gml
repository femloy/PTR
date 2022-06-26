event_inherited()
if (state == (138 << 0))
{
    if (!(scr_solid(x, y)))
        scr_collide()
    else
    {
        x += hsp
        y += vsp
    }
}
