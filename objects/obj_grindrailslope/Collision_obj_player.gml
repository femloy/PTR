if ((other.y > other.yprevious or (other.xscale == sign(image_xscale) && other.y < bbox_bottom)) && other.state != (84 << 0) && other.state != (106 << 0))
{
    with (other)
    {
        if (!scr_transformationcheck())
            exit;
        while place_meeting(x, y, obj_grindrailslope)
            y--
    }
    if (!other.isgustavo)
    {
        if (other.movespeed < 10)
            other.movespeed = 10
        other.state = (78 << 0)
    }
    else
    {
        other.y = (y + 8)
        other.state = (202 << 0)
    }
}
