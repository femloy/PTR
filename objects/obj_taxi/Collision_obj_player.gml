with (other)
{
    if (key_up && grounded && ((state == (191 << 0) && brick) or state == (0 << 0) or state == (103 << 0) or state == (104 << 0) or state == (58 << 0) or state == (121 << 0) or state == (99 << 0)) && (!instance_exists(obj_noisesatellite)) && (!instance_exists(obj_fadeout)) && state != (119 << 0) && ((obj_player1.spotlight == 1 && object_index == obj_player1) or (obj_player1.spotlight == 0 && object_index == obj_player2)))
    {
        with (other)
        {
            instance_create(x, y, obj_genericpoofeffect)
            obj_player1.visible = false
            obj_player1.sprite_index = obj_player1.spr_idle
            obj_player1.hsp = 0
            obj_player1.vsp = 0
            obj_player1.state = (119 << 0)
            scr_soundeffect(sfx_taxi2)
            playerid = 324
            sprite_index = spr_taximove
            hsp = 10
            obj_player1.cutscene = 1
            if (global.coop == true)
            {
                obj_player2.sprite_index = obj_player2.spr_idle
                scr_soundeffect(sfx_taxi2)
                playerid = 323
                sprite_index = spr_taximove
                hsp = 10
                obj_player2.visible = false
                obj_player2.hsp = 0
                obj_player2.vsp = 0
                obj_player2.state = (119 << 0)
                obj_player2.cutscene = 1
            }
        }
    }
}
