with (obj_player1)
{
    if (shotgunAnim == 1)
    {
        if (state != (0 << 0) && state != (100 << 0) && state != (71 << 0) && state != (111 << 0) && state != (92 << 0) && state != (42 << 0))
            other.visible = true
        else
            other.visible = false
    }
    other.x = (x - (20 * xscale))
    other.y = y
    other.image_xscale = (-xscale)
}
if (room == rank_room)
    visible = false
