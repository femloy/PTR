for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
    var b = ds_list_find_value(global.afterimage_list, i)
    with (b)
    {
        if visible
        {
            var a = other.alpha[identifier]
            if (identifier == (3 << 0))
            {
                a = alpha
                shader_set(shd_firemouth_afterimage)
            }
            else if (identifier == (4 << 0))
            {
                a = alpha
                shader_set(shd_blue_afterimage)
            }
            else if (identifier == (5 << 0))
            {
                a = alpha
                if instance_exists(playerid)
                {
                    if (playerid != noone && playerid.object_index != obj_pepgoblin)
                    {
                        shader_set(global.Pal_Shader)
                        pal_swap_set(playerid.spr_palette, playerid.paletteselect, 0)
                    }
                }
            }
            draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, image_blend, a)
            if (identifier == (3 << 0) or identifier == (4 << 0) or (identifier == (5 << 0) && playerid != -4))
                shader_reset()
        }
    }
}
