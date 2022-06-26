if (fadealpha > 1)
{
    fadein = 1
    if instance_exists(obj_player)
    {
        if (custom_level == 0)
        {
            with (obj_player)
            {
                if place_meeting(x, y, obj_goldendoor)
                    game_restart()
            }
            if (room != obj_player1.targetRoom or roomreset)
            {
                scr_room_goto(obj_player1.targetRoom)
                with (obj_player)
                {
                    if (state == (7 << 0) or state == (152 << 0))
                    {
                        visible = true
                        state = (0 << 0)
                    }
                }
            }
            if (global.coop == true)
            {
                if (room != obj_player2.targetRoom or roomreset)
                    scr_room_goto(obj_player1.targetRoom)
                with (obj_player)
                {
                    if (state == (7 << 0))
                        state = (0 << 0)
                }
                with (obj_player2)
                {
                    if instance_exists(obj_coopplayerfollow)
                        state = (186 << 0)
                }
            }
        }
    }
}
if (fadein == 0)
    fadealpha += 0.1
else if (fadein == 1)
    fadealpha -= 0.1
if instance_exists(obj_player)
{
    with (obj_player1)
    {
        if (other.fadein == 1 && (obj_player1.state == (112 << 0) or obj_player1.state == (98 << 0)) && (sprite_index == spr_victory or place_meeting(x, y, obj_door) or place_meeting(x, y, obj_startgate)))
        {
            state = (95 << 0)
            image_index = 0
            if (global.coop == true)
            {
                obj_player2.state = (95 << 0)
                obj_player2.image_index = 0
            }
        }
        if (other.fadein == 1 && obj_player1.state == (112 << 0) && (obj_player1.sprite_index == spr_downpizzabox or obj_player1.sprite_index == spr_uppizzabox))
        {
            state = (101 << 0)
            if (global.coop == true)
                obj_player2.state = (101 << 0)
        }
    }
    if instance_exists(obj_player2)
    {
        with (obj_player2)
        {
            if (other.fadein == 1 && (obj_player2.state == (112 << 0) or obj_player2.state == (98 << 0)) && (place_meeting(x, y, obj_door) or place_meeting(x, y, obj_startgate)))
            {
                state = (95 << 0)
                image_index = 0
                if (global.coop == true)
                {
                    obj_player1.state = (95 << 0)
                    obj_player1.image_index = 0
                }
            }
            if (other.fadein == 1 && obj_player2.state == (112 << 0) && (obj_player2.sprite_index == spr_downpizzabox or obj_player2.sprite_index == spr_uppizzabox))
            {
                state = (101 << 0)
                if (global.coop == true)
                    obj_player1.state = (101 << 0)
            }
        }
    }
    with (obj_player2)
    {
        if instance_exists(obj_coopplayerfollow)
            state = (186 << 0)
    }
}
if (fadein == 1 && fadealpha < 0)
    instance_destroy()
