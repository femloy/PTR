with (other)
{
    if (character == "V")
        scr_hurtplayer(object_index)
    else if scr_transformationcheck()
    {
        if (instance_exists(other.baddieID) && sprite_index != spr_tumbleend && state != (5 << 0) && state != (47 << 0) && state != (38 << 0) && state != (147 << 0))
        {
            scr_losepoints()
            state = (5 << 0)
            xscale = other.baddieID.image_xscale
            movespeed = 10
            vsp = 0
            sprite_index = spr_tumble
            if (other.baddieID.object_index == obj_pepbat)
                other.baddieID.hit = 1
        }
    }
}
