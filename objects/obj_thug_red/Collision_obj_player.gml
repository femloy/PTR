var player = other.id
var baddie = id
if (state == (80 << 0) && image_index > 8 && image_index < 12)
    scr_hurtplayer(player)
else
{
    with (other)
    {
        if (instakillmove == 1 && baddie.state != (4 << 0) && baddie.thrown == false && (!baddie.invincible))
        {
            if (state == (121 << 0) && sprite_index != spr_mach3hit && (character == "P" or character == "V"))
            {
                if (fightball == 0)
                    sprite_index = spr_mach3hit
                image_index = 0
            }
            if (state == (104 << 0) && grounded)
            {
                machpunchAnim = 1
                image_index = 0
            }
            if (state != (107 << 0))
                baddie.grabbedby = 1
            else
                baddie.grabbedby = 2
            scr_soundeffect(sfx_punch)
            if (state == (121 << 0))
                instance_destroy(baddie)
            else
            {
                var _hsp_multi = 2
                baddie.hsp = (sign((baddie.x - x)) * _hsp_multi)
                if (baddie.hsp == 0)
                    baddie.hsp = ((-baddie.image_xscale) * _hsp_multi)
                baddie.vsp = -8
                baddie.stunned = baddie.inv_max
                baddie.state = (138 << 0)
                baddie.inv_stun = 1
                baddie.inv_timer = baddie.inv_max
                baddie.hp--
                if (baddie.hp <= 0)
                    instance_destroy(baddie)
            }
            if (!baddie.important)
            {
                global.hit += 1
                global.combotime = 60
                global.heattime = 60
            }
            if ((!grounded) && state != (108 << 0) && key_jump2)
            {
                if (state == (104 << 0) or (state == (121 << 0) && fightball == 0))
                    sprite_index = spr_mach2jump
                suplexmove = 0
                vsp = -11
            }
        }
    }
}
