if (other.id != baddieID && other.state != (5 << 0) && other.state != (138 << 0))
{
    with (other)
    {
        stunstate = 1
        stuntimer = stunmax
        stunned = 0
        state = (5 << 0)
        vsp = -6
        stunstate = 1
    }
}
