if (other.instakillmove or other.state == (42 << 0))
{
    with (other)
    {
        scr_pummel()
        instance_destroy(other)
    }
}
