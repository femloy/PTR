with (other)
{
    if (state != (184 << 0) && state != (146 << 0) && state != (185 << 0) && state != (186 << 0))
    {
        xscale = other.image_xscale
        state = (184 << 0)
        tv_push_prompt_once(tv_create_prompt("This is the rocket transformation text", (2 << 0), 135, 3), "rocket")
        sprite_index = spr_rocketstart
        image_index = 0
        if (movespeed < 8)
            movespeed = 8
        x = other.x
        y = (other.y + 4)
    }
}
