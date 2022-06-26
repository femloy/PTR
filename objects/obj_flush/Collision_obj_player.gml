if (state == (223 << 0))
{
    state = (224 << 0)
    image_index = 0
    switch type
    {
        case 0:
            sprite_index = spr_flush_pizzatransition
            break
        case 1:
            sprite_index = spr_flush_skulltransition
            break
        case 2:
            sprite_index = spr_flush_rattransition
            break
    }

    var _found = 0
    with (obj_flush)
    {
        if (state == (223 << 0) && trigger == other.trigger)
            _found = 1
    }
    if (!_found)
    {
        with (obj_flush)
        {
            if (trigger == other.trigger)
                instance_destroy()
        }
    }
}
