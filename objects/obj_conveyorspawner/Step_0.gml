if (delay > 0)
    delay--
else
{
    delay = delaymax
    pos++
    if (pos >= array_length(objectlist))
        pos = 0
    with (instance_create(x, (y - 32), objectlist[pos]))
    {
        switch object_index
        {
            case obj_dashpad:
                image_xscale = other.dir
                break
            case 487:
                use_collision = 1
                break
            case 456:
                use_collision = 1
                break
        }

    }
}
