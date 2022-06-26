with (other)
{
    if (state != (97 << 0) && state != (186 << 0) && state != (146 << 0))
    {
        if (state == (47 << 0) or state == (48 << 0) or state == (38 << 0))
        {
            with (instance_create(x, y, obj_knightdebris))
                image_index = 0
            with (instance_create(x, y, obj_knightdebris))
                image_index = 1
            with (instance_create(x, y, obj_knightdebris))
                image_index = 2
            with (instance_create(x, y, obj_knightdebris))
                image_index = 3
            with (instance_create(x, y, obj_knightdebris))
                image_index = 4
            with (instance_create(x, y, obj_knightdebris))
                image_index = 5
        }
        if (state == (51 << 0))
            instance_create(x, y, obj_bombexplosion)
        x = other.x
        instance_create(x, (y - 20), obj_bangeffect)
        if (other.image_yscale == 1)
        {
            sprite_index = spr_superspringplayer
            state = (97 << 0)
            vsp = -10
        }
        else
        {
            state = (108 << 0)
            vsp = 10
            sprite_index = spr_player_rockethitwall
        }
        other.image_index = 0
        other.sprite_index = spr_presentbox_activate
    }
}
