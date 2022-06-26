if (state != (138 << 0))
{
    if (!other.isgustavo)
    {
        if (other.state != (121 << 0) or (!other.launched))
        {
            if (state != (206 << 0))
            {
                sprite_index = spr_hamkuff_chain1
                state = (206 << 0)
                playerid = other.id
            }
        }
        else
        {
            scr_soundeffect(sfx_punch)
            instance_destroy()
        }
    }
    else if (other.brick && state != (206 << 0))
    {
        other.brick = 0
        state = (206 << 0)
        sprite_index = spr_hamkuff_chain1
        state = (206 << 0)
        with (other)
        {
            state = (196 << 0)
            xscale = (-other.image_xscale)
            vsp = -10
        }
        with (instance_create(other.x, other.y, obj_brickcomeback))
        {
            trapped = 1
            baddieID = other.id
            other.playerid = id
        }
    }
    else if (other.state == (259 << 0))
    {
        scr_soundeffect(sfx_punch)
        instance_destroy()
    }
    else
    {
        with (other)
        {
            state = (196 << 0)
            xscale = other.image_xscale
            vsp = -10
        }
    }
}
