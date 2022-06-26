if (playerid > -1)
    exit;
if (state != (0 << 0))
    exit;
if (other.state == (107 << 0))
    exit;
if (other.state == (186 << 0))
    exit;
if (object_index != obj_tubeenter && other.state != (150 << 0))
    exit;
var _offset_x = (32 * image_xscale)
var _offset_y = (14 * image_yscale)
with (other)
{
    if (other.object_index == obj_tubeenter && other.stored_spd == 0)
    {
        if (abs(hsp) < other.movespeed)
            hsp = other.movespeed
        if (abs(vsp) < other.movespeed)
            vsp = other.movespeed
        other.stored_spd = max(abs(hsp), abs(vsp))
        trace(other.stored_spd)
    }
    state = (150 << 0)
    hsp = 0
    movespeed = 0
    vsp = 0
    tube_vsp = 0
    x = Approach(x, (other.xstart + _offset_x), other.approach_spd)
    y = Approach(y, (other.ystart + _offset_y), other.approach_spd)
    if (y > (other.y + _offset_y))
        tube_vsp = (-other.approach_spd)
}
if (floor(other.x) == (xstart + _offset_x) && floor(other.y) == (ystart + _offset_y))
{
    other.x = (xstart + _offset_x)
    other.y = (ystart + _offset_y)
    image_index = 0
    playerid = other.id
    image_speed = 0.5
    other.state = (150 << 0)
    other.tube_vsp = 0
    state = (150 << 0)
}
