function scr_enemy_lungeattack()
{
    hsp = ((-image_xscale) * 4)
    vsp = 0
    var _l = 0
    with (obj_player)
    {
        if (state == (43 << 0) && image_index <= 4)
            _l = 1
    }
    if (!_l)
        hitLag = 0
    if (hitLag > 0)
        hitLag--
    else
    {
        state = (138 << 0)
        hsp = hithsp
        vsp = hitvsp
        stunned = 200
    }
    exit;
}

