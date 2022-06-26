var thr = 20
if (!((captain_x > (captain_xto - thr) && captain_x < (captain_xto + thr) && captain_y > (captain_yto - thr) && captain_y < (captain_yto + thr))))
{
    var dir = point_direction(captain_x, captain_y, captain_xto, captain_yto)
    captain_x += lengthdir_x(5, dir)
    captain_y += lengthdir_y(5, dir)
}
switch state
{
    case (0 << 0):
        break
    case (8 << 0):
        if (floor(captain_index) == (sprite_get_number(captain_sprite) - 1))
        {
            captain_sprite = 1388
            state = (0 << 0)
            with (instance_create(crosshair_x, (camera_get_view_y(view_camera[0]) - 32), obj_frontcanonbomb))
                y_to = other.crosshair_y
        }
        break
    case (89 << 0):
        if (floor(captain_index) == (sprite_get_number(captain_sprite) - 1))
            instance_destroy()
        break
    default:

}

