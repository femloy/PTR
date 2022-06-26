for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
    var b = ds_list_find_value(global.afterimage_list, i)
    with (b)
    {
        for (var l = 0; l < array_length(alarm); l++)
        {
            if (alarm[l] >= 0)
                alarm[l]--
        }
        switch identifier
        {
            case (1 << 0):
                if ((!((playerid.state == (92 << 0) && playerid.sprite_index == spr_playerN_noisebombspinjump))) && playerid.pizzapepper == 0 && playerid.state != (191 << 0) && playerid.sprite_index != spr_player_barrelroll && playerid.state != (55 << 0) && playerid.state != (147 << 0) && playerid.state != (41 << 0) && playerid.state != (80 << 0) && playerid.state != (41 << 0) && playerid.state != (31 << 0) && playerid.state != (102 << 0) && playerid.state != (4 << 0) && playerid.pogochargeactive == 0 && playerid.state != (20 << 0) && playerid.state != (121 << 0) && playerid.state != (37 << 0) && playerid.state != (19 << 0) && playerid.state != (128 << 0) && playerid.state != (104 << 0) && playerid.state != (42 << 0) && playerid.state != (105 << 0) && playerid.state != (75 << 0) && playerid.state != (63 << 0) && playerid.state != (73 << 0) && playerid.state != (76 << 0) && playerid.state != (65 << 0) && playerid.state != (61 << 0) && playerid.state != (97 << 0) && playerid.state != (33 << 0))
                    alarm[0] = 0
                if (playerid.state == (104 << 0) or playerid.state == (103 << 0) or playerid.state == (121 << 0))
                {
                    var p = 4
                    var m = (playerid.movespeed - p)
                    var t = (12 - p)
                    alpha = (m / t)
                    alpha = clamp(alpha, 0, 1)
                }
                visible = playerid.visible
                with (playerid)
                {
                    if (place_meeting(x, y, obj_secretportal) or place_meeting(x, y, obj_secretportalstart))
                        other.visible = false
                }
                break
            case (2 << 0):
                x += hsp
                y += vsp
                break
            case (3 << 0):
            case (4 << 0):
                alpha -= 0.05
                if (alpha <= 0 && alarm[0] != 0)
                    alarm[0] = 0
                break
            case (5 << 0):
                alpha -= 0.15
                if (alpha <= 0 && alarm[0] != 0)
                    alarm[0] = 0
                if (playerid != noone && instance_exists(playerid))
                    visible = playerid.visible
                break
        }

        if (alarm[1] == 0)
        {
            other.alpha[identifier] = 0
            alarm[2] = 3
        }
        if (alarm[2] == 0)
        {
            other.alpha[identifier] = 1
            if (identifier == (1 << 0))
                other.alpha[identifier] = alpha
            alarm[2] = 3
        }
        if (alarm[0] == 0)
        {
            b = undefined
            ds_list_delete(global.afterimage_list, i)
            i--
        }
    }
}
