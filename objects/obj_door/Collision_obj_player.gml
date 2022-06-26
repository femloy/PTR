if locked
    exit;
var _actor = 0
with (obj_player)
{
    if (state == (146 << 0))
        _actor = 1
}
if _actor
    exit;
if global.horse
    exit;
if (john && global.panic)
    exit;
if (!(place_meeting(x, y, obj_doorblocked)))
{
    with (other)
    {
        if (key_up && (!instance_exists(obj_jumpscare)) && grounded && ((state == (191 << 0) && brick) or state == (0 << 0) or state == (103 << 0) or state == (104 << 0) or state == (58 << 0) or state == (121 << 0) or state == (99 << 0)) && y == (other.y + 50) && (!instance_exists(obj_noisesatellite)) && (!instance_exists(obj_fadeout)) && state != (112 << 0) && state != (95 << 0))
        {
            obj_player1.lastroom = room
            obj_player2.lastroom = room
            scr_soundeffect(sfx_door)
            obj_camera.chargecamera = 0
            ds_list_add(global.saveroom, id)
            if (object_index == obj_player1)
            {
                if obj_player1.isgustavo
                    obj_player1.sprite_index = spr_ratmount_enterdoor
                else
                    obj_player1.sprite_index = obj_player1.spr_lookdoor
            }
            if (object_index == obj_player2)
                obj_player2.sprite_index = obj_player2.spr_lookdoor
            obj_player1.targetDoor = other.targetDoor
            obj_player1.targetRoom = other.targetRoom
            obj_player2.targetDoor = other.targetDoor
            obj_player2.targetRoom = other.targetRoom
            with (obj_player)
            {
                image_index = 0
                if (state != (186 << 0))
                    state = (112 << 0)
                mach2 = 0
            }
            if (instance_exists(obj_player2) && global.coop == true)
            {
                if (object_index == obj_player2)
                {
                    obj_player1.x = obj_player2.x
                    obj_player1.y = obj_player2.y
                }
                if (object_index == obj_player1)
                {
                    obj_player2.x = obj_player1.x
                    obj_player2.y = obj_player1.y
                }
            }
            with (obj_player2)
            {
                if instance_exists(obj_coopplayerfollow)
                    state = (186 << 0)
            }
            other.visited = 1
            instance_create(x, y, obj_fadeout)
        }
    }
}
