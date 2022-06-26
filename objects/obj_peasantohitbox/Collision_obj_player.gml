with (other)
{
    if (character == "V")
        scr_hurtplayer(id)
    else if (state != (121 << 0) && (state != (61 << 0) or tauntstoredstate != (121 << 0)) && state != (3 << 0) && state != (89 << 0) && state != (31 << 0) && state != (186 << 0))
    {
        var _pindex = (object_index == obj_player1 ? 0 : 1)
        GamepadSetVibration(_pindex, 1, 1, 0.85)
        state = (9 << 0)
        vsp = -25
        sprite_index = spr_fireass
        image_index = 0
        if (!audio_is_playing(sfx_scream5))
            scr_soundeffect(sfx_scream5)
    }
}
