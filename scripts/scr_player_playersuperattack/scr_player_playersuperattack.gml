function scr_player_playersuperattack()
{
    image_speed = 0.5
    switch superattackstate
    {
        case (8 << 0):
            sprite_index = spr_rageidle
            with (bossID)
            {
                hsp = 0
                vsp = 0
                x = hitX
                y = hitY
            }
            hsp = 0
            vsp = 0
            x = hitX
            y = hitY
            if (hitLag > 0)
                hitLag--
            else
                superattackstate = (92 << 0)
            break
        case (92 << 0):
            sprite_index = spr_grab
            var dir = point_direction(x, y, bossID.x, bossID.y)
            var spd = 20
            hsp = 0
            vsp = 0
            hsp = lengthdir_x(spd, dir)
            vsp = lengthdir_y(spd, dir)
            if place_meeting(x, y, bossID)
            {
                superattackstate = (80 << 0)
                randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, 557, 556, 555, spr_punch])
                punchcount = 10
                image_index = 0
            }
            break
        case (80 << 0):
            vsp = 0
            hsp = (xscale * 2)
            with (bossID)
            {
                x = other.x
                y = other.y
                hsp = other.hsp
                image_xscale = (-other.xscale)
            }
            if (floor(image_index) == (image_number - 1))
            {
                if (punchcount > 0)
                {
                    punchcount--
                    randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, 557, 556, 555, spr_punch])
                    image_index = 0
                    scr_soundeffect(sfx_killingblow)
                    with (bossID)
                    {
                        boss_hurt_noplayer(25)
                        state = (252 << 0)
                    }
                }
                else
                {
                    with (bossID)
                    {
                        boss_hurt_noplayer(30)
                        state = (137 << 0)
                        hitX = x
                        hitY = y
                        hitvsp = -11
                        stunned = 10
                        image_xscale = (-other.xscale)
                        hithsp = ((-image_xscale) * 12)
                        movespeed = abs(hsp)
                        hitLag = 10
                    }
                    scr_soundeffect(sfx_killingblow)
                    superattackstate = (79 << 0)
                    sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5)
                    image_index = 0
                    finishingblow = 0
                }
            }
            break
        case (79 << 0):
            if (image_index < 7)
            {
                hsp = 0
                vsp = 0
            }
            else if (!finishingblow)
            {
                finishingblow = 1
                vsp = -4
                hsp = ((-xscale) * 4)
            }
            if (floor(image_index) == (image_number - 1))
                state = (0 << 0)
            break
    }

    exit;
}

