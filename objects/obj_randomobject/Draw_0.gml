event_inherited()
if (state == (17 << 0) && substate == (0 << 0))
{
    var _angle = point_direction(0, 0, moveX, moveY)
    var t = 32
    var lx = lengthdir_x(t, _angle)
    var ly = lengthdir_y(t, _angle)
    draw_sprite(spr_ball_move, 0, (x + lx), (y + ly))
}
