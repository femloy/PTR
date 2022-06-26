if ((other.state == (42 << 0) or other.state == (43 << 0)) && state != (148 << 0))
{
    var _player = other.id
    var _pizzaball = id
    with (_player)
    {
        if scr_transformationcheck()
        {
            if (state != (148 << 0))
            {
                golfid = _pizzaball
                image_speed = 0.35
                image_index = 0
                sprite_index = spr_golfidle
                other.y = y
                hsp = 0
                movespeed = 0
                slopespeed = 0
                state = (148 << 0)
                _pizzaball.state = (148 << 0)
                _pizzaball.player = id
                if (xscale > 0)
                    _pizzaball.m_angle = 0
                else
                    _pizzaball.m_angle = 180
                with (obj_camera)
                    targetgolf = _pizzaball
            }
        }
    }
}
