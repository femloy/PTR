with (other)
{
    if (((!instakillmove) or state == (104 << 0)) && state != (106 << 0) && other.state == (134 << 0) && state != (61 << 0))
    {
        scr_soundeffect(sfx_bumpwall)
        vsp = -4
        hsp = (-3 * xscale)
        state = (106 << 0)
        sprite_index = spr_bump
        image_index = 0
        other.state = (106 << 0)
        other.sprite_index = spr_clownmato_bounce
        other.image_index = 0
    }
}
