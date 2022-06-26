mask_index = spr_player_mask
switch state
{
    case (0 << 0):
        launch_buffer = 120
        break
    case (17 << 0):
        switch substate
        {
            case (0 << 0):
                var moveH = (playerid.key_left + playerid.key_right)
                var moveV = (playerid.key_down - playerid.key_up)
                if (moveH != 0 or moveV != 0)
                {
                    moveX = moveH
                    moveY = moveV
                }
                hsp = 0
                vsp = 0
                angle += 32
                if (launch_buffer > 0)
                    launch_buffer--
                else
                    substate = (92 << 0)
                break
            case (92 << 0):
                var spd = 24
                hsp = (moveX * spd)
                vsp = (moveY * spd)
                angle += 64
                with (obj_destructibles)
                {
                    if place_meeting((x - other.hsp), (y - other.vsp), other)
                        instance_destroy()
                }
                with (obj_metalblock)
                {
                    if place_meeting((x - other.hsp), (y - other.vsp), other)
                        instance_destroy()
                }
                if place_meeting((x + hsp), (y + vsp), obj_solid)
                {
                    instance_destroy()
                    with (playerid)
                    {
                        state = (16 << 0)
                        visible = true
                    }
                    state = (0 << 0)
                }
                break
        }

        break
}

scr_collide()
event_inherited()
