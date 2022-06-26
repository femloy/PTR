if (state != (74 << 0) && state != (138 << 0) && state != (4 << 0))
{
    if (other.state == (134 << 0))
    {
        golfid = other.id
        shot = 0
        state = (74 << 0)
        sprite_index = spr_golfburger_golf
        image_index = 0
        if (shootdir == 0)
            image_xscale = choose(-1, 1)
        else
            image_xscale = shootdir
    }
    else if (other.state == (156 << 0))
        instance_destroy()
}
