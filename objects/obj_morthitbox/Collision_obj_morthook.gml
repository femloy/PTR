var mh_id = other.id
with (playerid)
{
    if (state != (14 << 0))
    {
        state = (14 << 0)
        morthookID = mh_id
        tauntstoredmovespeed = movespeed
        movespeed = 12
        jumpstop = 0
        instance_destroy(other)
    }
}
