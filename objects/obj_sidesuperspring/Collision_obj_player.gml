with (other)
{
    if (state != (186 << 0))
    {
        if (state == (53 << 0) or state == (32 << 0) or state == (94 << 0) or state == (184 << 0) or state == (78 << 0) or state == (5 << 0) or state == (21 << 0) or state == (38 << 0) or state == (65 << 0) or state == (121 << 0) or state == (104 << 0))
        {
            other.sprite_index = spr_sidespringblock_bounce
            other.image_index = 0
            if (xscale != other.image_xscale)
                xscale = other.image_xscale
        }
    }
}
