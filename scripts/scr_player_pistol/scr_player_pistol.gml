function scr_player_pistol()
{
    move = (key_right + key_left)
    hsp = (xscale * movespeed)
    if (movespeed < 10)
        movespeed += 0.15
    if (floor(image_index) == (image_number - 1) && grounded && key_attack)
        state = (104 << 0)
    else if (floor(image_index) == (image_number - 1))
        state = (0 << 0)
    if (key_jump && grounded && (!key_down))
    {
        jumpstop = 0
        vsp = -11
        state = (5 << 0)
        sprite_index = spr_mach2jump
    }
    if (scr_solid((x + xscale), y) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) or scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x + xscale), y, obj_destructibles))))
    {
        var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
        if _bump
        {
            jumpstop = 1
            state = (92 << 0)
            vsp = -4
            sprite_index = spr_suplexbump
            instance_create((x + (xscale * 10)), (y + 10), obj_bumpeffect)
        }
    }
    if (key_down && grounded && global.attackstyle != 2)
    {
        grav = 0.5
        sprite_index = spr_crouchslip
        machhitAnim = 0
        state = (102 << 0)
        movespeed += 3
    }
    if (state != (106 << 0) && move != xscale && move != 0)
    {
        image_index = 0
        if (!grounded)
        {
            sprite_index = spr_suplexcancel
            jumpAnim = 1
            grav = 0.5
            state = (92 << 0)
        }
        else
        {
            state = (0 << 0)
            grav = 0.5
        }
    }
    image_speed = 0.35
    if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 4)
        instance_create(x, y, obj_slidecloud)
    exit;
}

