trigger = 1
func = function(argument0)
{
    if (!active)
    {
        if (argument0.state == (111 << 0))
            active = 1
    }
    exit;
}

