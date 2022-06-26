var _obj = id
with (other)
{
    if (scr_transformationcheck() or state == (5 << 0))
    {
        if ((state != (106 << 0) or sprite_index != spr_player_catched) && (state != (5 << 0) or xscale != _obj.image_xscale) && state != (47 << 0) && state != (38 << 0) && state != (84 << 0) && state != (186 << 0))
        {
            state = (5 << 0)
            xscale = sign(other.image_xscale)
            mask_index = spr_crouchmask
            movespeed = 14
            vsp = 0
            sprite_index = spr_tumble
            other.image_index = 0
            other.sprite_index = spr_goblinbot_kick
            var _max = 45
            y = (other.y - _max)
            if place_meeting(x, y, obj_platform)
                y--
            if scr_solid(x, y)
            {
                var i = 0
                while (i <= _max)
                {
                    if scr_solid(x, y)
                    {
                        x += xscale
                        i++
                        continue
                    }
                    else
                        break
                }
            }
            if scr_solid(x, y)
            {
                i = 0
                while (i <= _max)
                {
                    if scr_solid(x, y)
                    {
                        y--
                        i++
                        continue
                    }
                    else
                        break
                }
            }
        }
    }
}
