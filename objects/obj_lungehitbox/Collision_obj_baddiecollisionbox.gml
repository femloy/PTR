var _baddieID = other.baddieID
if (!instance_exists(_baddieID))
    exit;
if (_baddieID.state != (4 << 0) && (!_baddieID.invincible) && _baddieID.hittable && _baddieID.state != (17 << 0))
{
    with (playerid)
    {
        if ((floor(image_index) < 4 or (global.attackstyle == 3 && image_index < 6)) && (state == (43 << 0) or state == (42 << 0)) && state != (61 << 0) && _baddieID.state != (137 << 0))
        {
            var lag = 5
            var baddie_id = _baddieID.id
            movespeed = 6
            if (ds_list_find_index(hitlist, baddie_id) == -1)
            {
                ds_list_add(hitlist, baddie_id)
                with (_baddieID)
                {
                    hp -= 0.5
                    instance_create(x, y, obj_bangeffect)
                    state = (137 << 0)
                    image_xscale = (-other.xscale)
                    hit_connected = 1
                    hithsp = (((other.x + (((other.movespeed + 0.5) * 60) * other.xscale)) - x) / 60)
                    hitvsp = (((other.y - 180) - y) / 60)
                    trace([hithsp, hitvsp])
                    hitLag = lag
                    hitX = x
                    hitY = y
                    invtime = (lag + 5)
                    flash = 1
                    if (!important)
                    {
                        global.combotime = 60
                        global.heattime = 60
                    }
                }
                hit_connected = 1
                lunge_hits++
                finisher_hits++
                lunge_hit_buffer = 100
                if (state == (42 << 0))
                {
                    state = (43 << 0)
                    randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, 557, 556, 555, spr_punch])
                    image_index = 0
                }
                tauntstoredstate = state
                tauntstoredsprite = sprite_index
                tauntstoredmovespeed = movespeed
                tauntstoredvsp = 0
                state = (61 << 0)
                hitLag = lag
                hitX = x
                if hit_connected
                    hitvsp = 0
                else
                    hitvsp = vsp
                hitY = y
                scr_soundeffect(sfx_killingblow)
                var debriscount = floor((lunge_hits / 5))
                repeat (2 + debriscount)
                {
                    with (create_debris(x, y, spr_slapstar))
                        vsp = irandom_range(-6, -11)
                }
                instance_create(other.x, other.y, obj_parryeffect)
            }
        }
    }
}
