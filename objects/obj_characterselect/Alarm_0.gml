with (instance_create(x, y, obj_fadeout))
{
    obj_player1.targetRoom = hub_loadingscreen
    obj_player1.targetDoor = "A"
    obj_player1.state = (0 << 0)
    if (global.coop == true)
    {
        obj_player2.state = (0 << 0)
        obj_player2.targetDoor = "A"
    }
}
gamesave_async_load()
