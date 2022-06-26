if place_meeting(x, (y - 1), obj_player)
{
    var _dir = sign(image_xscale)
    with (obj_player)
    {
        if (state != (37 << 0) && (icemovespeed < 2 or place_meeting(x, (y + 1), obj_iceblock)) && place_meeting(x, (y + 1), other) && scr_slope())
        {
            icemovespeed = 2
            icedir = (-_dir)
        }
        if (state == (37 << 0))
            icemovespeed = 0
    }
}
