function scr_player_golf()
{
    landAnim = 0
    jumpAnim = 0
    image_speed = 0.35
    global.combotime = 60
    global.heattime = 60
    if (sprite_index == spr_golfidle)
    {
        move = (key_left + key_right)
        if (move != 0)
            xscale = move
        if key_slap2
        {
            sprite_index = spr_golfswing
            image_index = 0
        }
    }
    if (sprite_index == spr_golfswing && floor(image_index) == (image_number - 1))
        state = (0 << 0)
    if (instance_exists(golfid) && golfid.state != (148 << 0) && golfid.state != (156 << 0))
        state = (0 << 0)
    exit;
}

