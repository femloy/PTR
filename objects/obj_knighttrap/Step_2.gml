switch state
{
    case (80 << 0):
        if (attackbuffer > 0)
            attackbuffer--
        else
            state = (0 << 0)
        break
}

if (!(place_meeting(x, y, obj_trapghost)))
{
    sprite_index = spr_kingghost_spike
    state = (0 << 0)
}
if (cooldown > 0 && state != (80 << 0))
    cooldown--
