with (instance_place((x - 1), y, obj_player))
{
    if (state == (11 << 0) && other.eaten == 0)
    {
        movespeed = abs(movespeed)
        other.eaten = 1
        grav = 0.5
        state = (0 << 0)
    }
}
with (instance_place((x + 1), y, obj_player))
{
    if (state == (11 << 0) && other.eaten == 0)
    {
        movespeed = abs(movespeed)
        other.eaten = 1
        grav = 0.5
        state = (0 << 0)
    }
}
if eaten
{
    x = -100
    y = -100
    sprite_index = spr_corneaten
    if (ds_list_find_index(global.saveroom, id) == -1)
        ds_list_add(global.saveroom, id)
}
