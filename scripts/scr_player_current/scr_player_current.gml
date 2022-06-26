function scr_player_current()
{
    if (!(place_meeting(x, y, obj_current)))
        state = (0 << 0)
    sprite_index = spr_player_slipnslide
    image_speed = 0.35
    exit;
}

