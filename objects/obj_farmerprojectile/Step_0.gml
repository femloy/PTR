x += hsp
y += vsp
var num = collision_line_list(x, y, xprevious, yprevious, 380, 0, 1, global.instancelist, 0)
if (num > 0)
{
    var i = 0
    while (i < num)
    {
        var b = ds_list_find_value(global.instancelist, i)
        var t = 0
        with (b)
        {
            if (state == (0 << 0))
            {
                state = (8 << 0)
                if b.b.func(other.id, other)
                    t = 1
                else
                {
                    state = (0 << 0)
                    t = 0
                }
            }
        }
        if t
        {
            instance_destroy()
            break
        }
        else
        {
            i++
            continue
        }
    }
}
ds_list_clear(global.instancelist)
