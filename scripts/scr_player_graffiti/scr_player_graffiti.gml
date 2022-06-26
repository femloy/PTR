function scr_player_graffiti()
{
    hsp = 0
    vsp = (-grav)
    image_speed = 0.5
    if (floor(image_index) == (image_number - 1))
    {
        state = (0 << 0)
        if tauntstoredisgustavo
            state = (191 << 0)
        if (global.graffiticount >= global.graffitimax)
            instance_create(x, y, obj_key)
    }
    exit;
}

