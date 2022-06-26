if (instance_exists(baddieID) && baddieID.stun == 1 && (other.state == (42 << 0) or other.state == (80 << 0) or other.instakillmove == 1))
{
    with (other)
    {
        sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch)
        image_index = 0
        state = (91 << 0)
        movespeed = 3
        vsp = -3
        instance_destroy(other)
    }
    scr_soundeffect(sfx_killenemy)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_bangeffect)
    instance_destroy(baddieID)
    instance_destroy()
}
