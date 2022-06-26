function cutscene_gustavo_start()
{
    var _id = id
    with (obj_cutscene_handler)
    {
        if (id < _id)
            instance_destroy()
    }
    if ((!instance_exists(obj_fadeout)) && obj_player1.state != (119 << 0) && obj_player1.state != (95 << 0) && obj_player1.state != (107 << 0))
    {
        with (obj_player1)
        {
            visible = true
            image_alpha = 1
            state = (146 << 0)
            sprite_index = spr_idle
            image_speed = 0.35
            xscale = 1
            hsp = 0
            vsp = 0
        }
        with (obj_gustavo)
        {
            state = (146 << 0)
            if (!global.failcutscene)
                sprite_index = spr_gustavo_makepizza
            else
                sprite_index = spr_gustavo_idle
            image_speed = 0.35
            image_xscale = -1
        }
        cutscene_end_action()
    }
    exit;
}

