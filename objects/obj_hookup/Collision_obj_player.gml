with (other)
{
    if (key_up && ladderbuffer == 0 && (state == (9 << 0) or state == (0 << 0) or state == (58 << 0) or state == (104 << 0) or state == (121 << 0) or state == (103 << 0) or state == (57 << 0) or state == (92 << 0) or state == (60 << 0)) && state != (107 << 0) && state != (105 << 0) && state != (108 << 0) && state != (111 << 0))
    {
        other.hooked = 1
        hooked = 1
        mach2 = 0
        state = (93 << 0)
        x = (other.x + 16)
        y = (other.y + 40)
    }
}
