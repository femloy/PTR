if (other.state != (186 << 0) && other.state != (61 << 0))
{
    if (other.state == (47 << 0) or other.state == (38 << 0) or other.state == (21 << 0))
    {
        repeat (8)
        {
            with (create_debris(x, y, spr_slimedebris))
            {
                vsp = random_range(-5, 0)
                hsp = random_range(-3, 3)
            }
        }
        instance_destroy()
    }
    else
    {
        tv_push_prompt_once(tv_create_prompt("This is the cheeseball transformation text", (2 << 0), 2240, 3), "cheeseball")
        other.xscale = image_xscale
        other.hsp = hsp
        other.vsp = vsp
        other.movespeed = 8
        other.x = x
        other.y = y
        other.state = (21 << 0)
        other.stop_buffer = other.stop_max
        repeat (8)
        {
            with (create_debris(x, y, spr_slimedebris))
            {
                vsp = random_range(-5, 0)
                hsp = random_range(-3, 3)
            }
        }
        instance_destroy()
    }
}
