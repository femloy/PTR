if (place_meeting(x, y, other) && other.state != (5 << 0) && other.state != (84 << 0) && other.state != (106 << 0) && other.y > other.yprevious && other.y < y)
{
    if (!other.isgustavo)
    {
        other.y = (y - 49)
        other.state = (78 << 0)
    }
    else if (other.state != (202 << 0))
    {
        with (other)
        {
            if (brick == 1)
            {
                with (instance_create(x, y, obj_brickcomeback))
                    wait = 1
            }
            brick = 0
        }
        other.y = (y + 8)
        other.state = (202 << 0)
    }
}
