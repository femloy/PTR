if (room == Titlescreen && obj_player.state == (18 << 0))
{
    obj_player1.sprite_index = spr_player_machfreefall
    obj_player1.state = (84 << 0)
    obj_player1.movespeed = 6
    obj_player1.vsp = 5
    obj_player1.xscale = 1
    obj_player1.player_x = 50
    obj_player1.player_y = 50
}
if (obj_player.state == (119 << 0))
{
    if (!global.pizzadelivery)
    {
        with (instance_create((obj_stopsign.x - 480), obj_stopsign.y, obj_taxidud))
            playerid = 324
    }
    else
    {
        with (instance_create((obj_checkpoint.x - 480), (obj_checkpoint.y - 50), obj_taxidud))
            playerid = 324
        with (obj_player)
        {
            x = obj_checkpoint.x
            y = (obj_checkpoint.y - 50)
        }
    }
}
if (obj_player.state == (152 << 0))
{
    with (obj_player)
    {
        visible = true
        state = (0 << 0)
    }
}
