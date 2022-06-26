var tx = playerid.x
var ty = (playerid.y - 60)
var acc = 0.1
switch state
{
    case (0 << 0):
        x = lerp(x, tx, acc)
        y = lerp(y, ty, acc)
        if (alarm[0] == -1 && x > (tx - 8) && x < (tx + 8) && y > (ty - 8) && y < (ty + 8))
        {
            alarm[0] = 50
            x = tx
            y = ty
            state = (8 << 0)
        }
        break
    case (8 << 0):
        x = lerp(x, tx, 0.2)
        y = lerp(y, ty, 0.2)
        break
    case (92 << 0):
        x += 4
        y -= 8
        if (!(bbox_in_camera(view_camera[0], 10)))
            instance_destroy()
        break
}

