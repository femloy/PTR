if (!global.panic)
{
    with (obj_player1)
    {
        lastroom = room
        state = (0 << 0)
        room_goto(targetRoom)
        if (targetDoor == "S")
        {
            targetDoor = lastTargetDoor
            lastTargetDoor = "S"
        }
    }
}
else
{
    with (obj_player)
    {
        if check_player_coop()
            state = (225 << 0)
    }
    instance_destroy()
}
