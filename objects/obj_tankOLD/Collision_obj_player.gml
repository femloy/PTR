var baddie = id
if (state != (141 << 0))
{
    with (other)
    {
        if (y < other.y && attacking == 0 && sprite_index != spr_player_mach2jump && ((state == (3 << 0) && vsp > 0) or state == (92 << 0) or state == (103 << 0) or state == (79 << 0)) && vsp > 0 && other.vsp >= 0 && sprite_index != spr_stompprep)
        {
            scr_soundeffect(sfx_stompenemy)
            image_index = 0
            if key_jump2
            {
                instance_create(x, (y + 50), obj_stompeffect)
                stompAnim = 1
                vsp = -14
                if (state == (92 << 0))
                    sprite_index = spr_stompprep
            }
            else
            {
                instance_create(x, (y + 50), obj_stompeffect)
                stompAnim = 1
                vsp = -9
                if (state == (92 << 0))
                    sprite_index = spr_stompprep
            }
        }
        if (y >= other.y && other.thrown == false && other.stuntouchbuffer == 0 && other.vsp > 0 && state != (106 << 0) && other.state != (141 << 0))
        {
            scr_soundeffect(sfx_bumpwall)
            if (state != (51 << 0) && state != (103 << 0) && state != (102 << 0))
                movespeed = 0
            var _xs = sign((x - baddie.x))
            if (floor(_xs) == 0)
                _xs = xscale
            hsp = (3 * _xs)
            state = (106 << 0)
            xscale = (-_xs)
            sprite_index = spr_bump
            vsp = -4
        }
    }
}
else
{
    with (other)
    {
        if (state != (59 << 0))
        {
            state = (59 << 0)
            sprite_index = spr_squished
            image_index = 0
            scr_losepoints()
        }
    }
}
