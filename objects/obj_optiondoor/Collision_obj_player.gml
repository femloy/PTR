var _actor = 0
with (obj_player)
{
    if (state == (146 << 0))
        _actor = 1
}
if _actor
    exit;
with (other)
{
    if (key_up && grounded && (!instance_exists(obj_option)) && (state == (0 << 0) or state == (103 << 0) or state == (104 << 0) or state == (58 << 0) or state == (121 << 0) or state == (99 << 0)))
    {
        instance_create(x, y, obj_option)
        state = (146 << 0)
    }
}
