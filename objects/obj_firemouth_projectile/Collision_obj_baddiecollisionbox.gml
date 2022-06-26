with (other)
{
    if (instance_exists(baddieID) && baddieID.state != (4 << 0) && baddieID.object_index != obj_tank && (!baddieID.invincible))
    {
        instance_destroy()
        instance_destroy(baddieID)
    }
}
instance_destroy()
