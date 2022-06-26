if active
{
    with (obj_player)
    {
        state = (146 << 0)
        hsp = 0
        vsp = 0
        visible = false
    }
}
if (floor(image_index) == (image_number - 1))
{
    switch sprite_index
    {
        case spr_pizzaportal_appear:
            sprite_index = spr_pizzaportalentrancestart
            break
        case 1645:
            sprite_index = spr_pizzaportal_disappear
            with (obj_player)
            {
                state = (0 << 0)
                visible = true
            }
            active = 0
            break
        case 1806:
            instance_destroy()
            break
    }

}
