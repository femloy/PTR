if instance_exists(ID)
{
    x = ID.x
    if (ID.object_index == obj_bigcheese)
        y = (ID.y - 60)
    else
        y = (ID.y - 40)
    if (ID.state != (138 << 0) or ID.stunned < 100)
    {
        ID.birdcreated = 0
        instance_destroy()
    }
}
