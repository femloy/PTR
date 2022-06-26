with (other)
{
    if (character == "V")
        scr_hurtplayer(object_index)
    else if scr_transformationcheck()
    {
        if (state != (10 << 0) && state != (147 << 0) && hurted == 0)
        {
            tv_push_prompt_once(tv_create_prompt("This is the firemouth transformation text", (2 << 0), 1139, 3), "firemouth")
            is_firing = 0
            hsp = 0
            movespeed = 0
            state = (10 << 0)
            image_index = 0
            sprite_index = spr_firemouthintro
            state = (10 << 0)
            bombpeptimer = 3
            instance_destroy(other)
        }
    }
}
