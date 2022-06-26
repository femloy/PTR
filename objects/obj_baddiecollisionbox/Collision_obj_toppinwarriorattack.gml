if instance_exists(baddieID)
{
    if (baddieID.vsp > 0 && baddieID.state != (4 << 0))
    {
        instance_create(x, y, obj_bumpeffect)
        baddieID.stunned = 200
        if (other.x != baddieID.x)
            baddieID.image_xscale = (-(sign((baddieID.x - other.x))))
        baddieID.vsp = -5
        baddieID.hsp = (other.image_xscale * 2)
        baddieID.state = (138 << 0)
        baddieID.image_index = 0
    }
}
