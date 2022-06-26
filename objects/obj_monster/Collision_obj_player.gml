if (state != (217 << 0) && other.state != (146 << 0) && (!other.cutscene) && other.state != (112 << 0))
{
    if ((!global.panic) && (!instance_exists(obj_jumpscare)))
    {
        with (obj_player)
        {
            state = (146 << 0)
            hsp = 0
            vsp = 0
            targetRoom = other.targetRoom
            if (targetRoom != room && targetRoom != lastroom)
                targetDoor = other.targetDoor
            lastroom = room
            hallway = savedhallway
            if hallway
                hallwaydirection = (-savedhallwaydirection)
            verticalhallway = savedverticalhallway
            if verticalhallway
                vhallwaydirection = (-savedvhallwaydirection)
        }
        if ((!oktoberfest) && ds_list_find_index(global.saveroom, room_get_name(room)) == -1)
            ds_list_add(global.saveroom, room_get_name(room))
        with (instance_create(x, y, obj_jumpscare))
        {
            switch other.object_index
            {
                case obj_robotmonster:
                    monsterid = 0
                    break
                case 826:
                    monsterid = 1
                    break
                case 751:
                    monsterid = 2
                    break
                case 10:
                    monsterid = 3
                    break
            }

            if (other.oktoberfest && random(100) <= 10)
                oktoberfest = 1
        }
    }
    else if (global.panic && (!instance_exists(obj_jumpscare)))
    {
        with (obj_monster)
        {
            state = (217 << 0)
            x = xstart
            y = ystart
        }
        with (instance_create(x, y, obj_jumpscare))
            monsterid = 4
    }
}
