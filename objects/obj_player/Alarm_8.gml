if (state == (107 << 0))
{
    state = (0 << 0)
    movespeed = 0
    if scr_solid(x, y)
    {
        var ty = try_solid(0, 1, 312, 32)
        if (ty != -1)
            y += ty
    }
}
else if (state == (196 << 0))
{
    state = (191 << 0)
    movespeed = 0
}
