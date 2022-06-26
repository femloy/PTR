if (sprite_index != spr_mortspawn && sprite_index != spr_mortfall)
{
    with (other)
    {
        if (state != (11 << 0) && state != (12 << 0) && state != (13 << 0) && state != (14 << 0) && state != (190 << 0))
        {
            repeat (6)
                create_debris(x, y, spr_feather)
            mort = 1
            instance_create_unique(x, y, obj_mortfollow)
            movespeed = hsp
            state = (11 << 0)
            tv_push_prompt_once(tv_create_prompt("This is the mort powerup text", (2 << 0), 2654, 3), "mort")
            instance_destroy(other)
        }
    }
}
