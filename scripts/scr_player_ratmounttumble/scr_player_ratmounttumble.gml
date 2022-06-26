function scr_player_ratmounttumble()
{
    hsp = (xscale * movespeed)
    move = (key_left + key_right)
    sprite_index = spr_player_ratmountwalljump
    image_speed = ((-abs(movespeed)) / 15)
    if (!key_attack)
        movespeed = Approach(movespeed, 0, 1)
    if (scr_slope() && hsp != 0)
        scr_player_addslopemomentum(0.25, 0.25)
    if (abs(hsp) <= 2)
        state = (191 << 0)
    if ((place_meeting((x + hsp), y, obj_solid) && (!(scr_solid_slope((x + hsp), y))) && (!(place_meeting((x + hsp), y, obj_rollblock))) && (!(place_meeting((x + hsp), y, obj_rattumble))) && (!(place_meeting((x + hsp), y, obj_destructibles)))) or place_meeting(x, y, obj_timedgate))
    {
        state = (196 << 0)
        vsp = -5
        movespeed = 3
    }
    if key_jump
        input_buffer_jump = 0
    if ((!jumpstop) && vsp < 0.5 && (!key_jump2))
    {
        vsp /= 10
        jumpstop = 1
    }
    if (key_jump && brick && key_up)
    {
        state = (197 << 0)
        sprite_index = spr_lonegustavo_jumpstart
        image_index = 0
        image_speed = 0.35
        gustavokicktimer = 5
        brick = 0
        movespeed = hsp
        with (instance_create(x, (y + 50), obj_ratmountgroundpound))
        {
            image_xscale = other.xscale
            image_index = 0
        }
    }
    if (input_buffer_jump < 8 && grounded)
    {
        particle_set_scale((4 << 0), xscale, 1)
        create_particle(x, y, particle.highjumpcloud2, 0)
        scr_soundeffect(sfx_jump)
        vsp = -11
        jumpstop = 0
    }
    exit;
}

