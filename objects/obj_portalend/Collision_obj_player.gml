if (obj_player.state != (39 << 0) && global.panic == true)
{
    obj_player.hsp = 0
    sprite_index = spr_pizzaportalend
    image_index = 0
    obj_player.state = (39 << 0)
    obj_player.grav = 0
    obj_player.visible = false
}
