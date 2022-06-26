if (instance_exists(ID) && ID.object_index == obj_badrat && other.state == (5 << 0))
    exit;
var h = other.hurted
scr_hurtplayer(other)
if (h == 0 && other.hurted)
    instance_create(round(((x + other.x) / 2)), round(((y + other.y) / 2)), obj_parryeffect)
