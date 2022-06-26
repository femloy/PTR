function scr_player_portal()
{
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_pizzaportalentrancestart)
    {
        instance_create(x, y, obj_pizzaportalfade)
        state = (108 << 0)
        grav = 0.5
    }
    mach2 = 0
    exit;
}

