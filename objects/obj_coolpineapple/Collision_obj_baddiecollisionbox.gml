if (state != (147 << 0) && state != (84 << 0))
    exit;
var my_id = id
var other_baddie = other.id
var can_parry = 0
with (other_baddie)
{
    if (instance_exists(baddieID) && baddieID.thrown == true && baddieID != other.id)
        can_parry = 1
}
if (can_parry && state != (147 << 0) && other.baddieID != id)
{
    sprite_index = parryspr
    movespeed = 8
    state = (147 << 0)
    image_index = 0
}
