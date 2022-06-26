with (obj_player1)
{
    if (character != "V")
    {
        if ((place_meeting((x + hsp), y, other) or place_meeting((x + xscale), y, other)) && (obj_player1.state == (121 << 0) or obj_player1.state == (184 << 0) or obj_player1.state == (38 << 0) or obj_player1.state == (153 << 0)))
        {
            playerindex = 0
            instance_destroy(other)
        }
    }
}
if (place_meeting(x, (y + 1), obj_player1) or place_meeting(x, (y - 1), obj_player1) or place_meeting((x - 1), y, obj_player1) or place_meeting((x + 1), y, obj_player1))
{
    if (place_meeting(x, (y - 1), obj_player1) && obj_player1.state == (108 << 0) && obj_player1.freefallsmash >= 10)
    {
        with (instance_place(x, (y - 1), obj_player1))
        {
            if (character == "M")
            {
                state = (92 << 0)
                vsp = -7
                sprite_index = spr_jump
            }
        }
        playerindex = 0
        instance_destroy()
    }
    if (place_meeting(x, (y - 1), obj_player1) && (obj_player1.state == (47 << 0) or obj_player1.state == (19 << 0)))
    {
        playerindex = 0
        instance_destroy()
        tile_layer_delete_at(1, x, y)
    }
}
with (obj_player2)
{
    if ((place_meeting((x + hsp), y, other) or place_meeting((x + xscale), y, other)) && (obj_player2.state == (121 << 0) or obj_player2.state == (38 << 0) or obj_player2.state == (153 << 0)))
    {
        playerindex = 1
        instance_destroy(other)
    }
}
if (place_meeting(x, (y + 1), obj_player2) or place_meeting(x, (y - 1), obj_player2) or place_meeting((x - 1), y, obj_player2) or place_meeting((x + 1), y, obj_player2))
{
    if (place_meeting(x, (y - 1), obj_player2) && obj_player2.state == (108 << 0) && obj_player2.freefallsmash >= 10)
    {
        playerindex = 1
        instance_destroy()
    }
    if (place_meeting(x, (y - 1), obj_player2) && (obj_player2.state == (47 << 0) or obj_player2.state == (19 << 0)))
    {
        playerindex = 1
        instance_destroy()
        tile_layer_delete_at(1, x, y)
    }
}
