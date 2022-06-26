if (!other.grabbable)
    exit;
if (state != (34 << 0))
{
    if (state == (42 << 0) or state == (43 << 0) or state == (80 << 0))
    {
        if (other.state == (0 << 0) && scr_transformationcheck() && (!cutscene) && state != (52 << 0) && (state == (42 << 0) or state == (80 << 0) or state == (43 << 0)))
        {
            state = (52 << 0)
            image_index = 0
            sprite_index = spr_haulingstart
            other.defused = 1
            bombgrabID = other.id
            movespeed = 6
            with (other)
            {
                state = (4 << 0)
                playerid = other.id
            }
            tv_push_prompt_once(tv_create_prompt("This is the bomb transformation text", (2 << 0), 2590, 3), "bombpep")
        }
    }
}
else if (other.kickbuffer <= 0)
{
    other.vsp = -9
    other.movespeed = 7
    other.image_xscale = xscale
    other.kickbuffer = 15
    other.y--
    other.defused = 1
}
