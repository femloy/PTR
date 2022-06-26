var _found = 0
with (obj_player)
{
    if (state == (11 << 0) or state == (12 << 0) or state == (13 << 0) or state == (14 << 0))
        _found = 1
}
if _found
    image_alpha = 1
else
    image_alpha = 0.5
