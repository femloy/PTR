if other.instakillmove
    instance_destroy()
else if (other.state == (108 << 0))
{
    other.xscale = sign(image_xscale)
    other.state = (32 << 0)
    other.movespeed = abs(hsp)
    other.sprite_index = spr_player_pizzacar
    explode = 0
    instance_destroy()
}
else
{
    instance_destroy()
    scr_hurtplayer(other)
}
