with (obj_player)
{
    if (state == (32 << 0) && place_meeting((x + hsp), y, other))
    {
        other.destroy = 1
        instance_destroy(other)
    }
}
