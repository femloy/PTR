with (other)
{
    if (state != (186 << 0) && state != (9 << 0))
    {
        scr_soundeffect(sfx_scream5)
        image_index = 0
        state = (9 << 0)
        vsp = -21
        sprite_index = spr_scaredjump1
        scr_monster_activate()
    }
}
