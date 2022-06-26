image_speed = 0.35
switch state
{
    case (0 << 0):
        sprite_index = spr_sirnose_idle
        if (cooldown > 0)
            cooldown--
        else
        {
            with (obj_pizzaball)
            {
                if (state != (148 << 0) && distance_to_pos(x, y, other.x, other.y, 200, 150))
                {
                    state = (264 << 0)
                    other.state = (264 << 0)
                    other.hsp = hsp
                    other.vsp = vsp
                    other.ballID = id
                }
            }
        }
        break
    case (264 << 0):
        with (ballID)
        {
            depth = 0
            sprite_index = spr_pizzaball_roll
            sit = 0
            x = Approach(x, other.x, 8)
            y = Approach(y, other.y, 8)
            if (state != (148 << 0))
            {
                other.hsp = Approach(hsp, 0, 1)
                other.vsp = Approach(vsp, 0, 1)
            }
            else
                sprite_index = spr_pizzaball_stun
            hsp = other.hsp
            vsp = other.vsp
            if (state != (264 << 0) && state != (148 << 0))
            {
                other.state = (0 << 0)
                other.cooldown = 200
            }
            if (x != other.x or y != other.y)
            {
                if (x != other.x)
                    other.image_xscale = sign((other.x - x))
                other.sprite_index = spr_sirnose_suck
            }
            else
                other.sprite_index = spr_sirnose_idle
        }
        break
}

