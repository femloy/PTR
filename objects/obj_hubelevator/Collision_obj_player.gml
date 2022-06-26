if (state != (18 << 0) && other.grounded && other.key_up2)
{
    if other.isgustavo
        isgustavo = 1
    else
        isgustavo = 0
    state = (18 << 0)
    playerid = other.id
    other.state = (146 << 0)
    other.key_up2 = 0
    other.movespeed = 0
    other.hsp = 0
    other.sprite_index = other.spr_idle
    other.image_speed = 0.35
}
