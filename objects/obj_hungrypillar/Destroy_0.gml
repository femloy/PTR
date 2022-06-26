if (room == rm_editor)
    exit;
if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == 0)
{
    with (obj_baddie)
    {
        if (escape == true)
        {
            visible = true
            instance_create(x, y, obj_genericpoofeffect)
        }
    }
    global.fill = 4000
    with (obj_tv)
        chunkmax = global.fill
    with (obj_escapecollect)
        image_alpha = 1
    with (obj_escapecollectbig)
        image_alpha = 1
    scr_soundeffect(sfx_escaperumble)
    obj_camera.alarm[1] = 60
    instance_create(x, y, obj_bangeffect)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    if (global.coop == true)
    {
        obj_player1.x = x
        obj_player2.x = x
        obj_player1.y = y
        obj_player2.y = y
    }
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    instance_destroy()
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = spr_hungrypillar_dead
    scr_soundeffect(sfx_killenemy)
    instance_create(x, (y + 600), obj_itspizzatime)
    global.panic = true
    switch room
    {
        case entrance_10:
            global.minutes = 2
            global.seconds = 30
            break
        case 424:
            global.minutes = 2
            global.seconds = 15
            break
        case 442:
            global.minutes = 2
            global.seconds = 59
            break
        case 462:
            global.minutes = 4
            global.seconds = 30
            break
        case 652:
            global.minutes = 3
            global.seconds = 15
            break
        case 661:
            global.minutes = 4
            global.seconds = 0
            break
        case 464:
            global.minutes = 0
            global.seconds = 59
            break
        case 262:
            global.minutes = 2
            global.seconds = 30
            break
        case 512:
            global.minutes = 3
            global.seconds = 59
            break
        case 535:
            global.minutes = 3
            global.seconds = 59
            break
        case 621:
            global.minutes = 3
            global.seconds = 12
            break
        case 582:
            global.minutes = 3
            global.seconds = 30
            break
        case 588:
            global.minutes = 3
            global.seconds = 30
            break
        case 632:
            global.minutes = 7
            global.seconds = 30
            break
        case 185:
            global.minutes = 5
            global.seconds = 30
            break
        case 203:
            global.minutes = 5
            global.seconds = 30
            break
        case 196:
            global.minutes = 5
            global.seconds = 30
            break
        case 280:
            global.minutes = 5
            global.seconds = 30
            break
        case 324:
            global.minutes = 6
            global.seconds = 30
            break
        case 341:
            global.minutes = 5
            global.seconds = 30
            break
        case 131:
            global.minutes = 6
            global.seconds = 30
            break
        case 184:
            global.minutes = 9
            global.seconds = 59
            break
        case 246:
            global.minutes = 3
            global.seconds = 30
            break
        case 776:
            global.minutes = 2
            global.seconds = 15
            break
        default:
            global.minutes = 5
            global.seconds = 30
            break
    }

    ds_list_add(global.saveroom, id)
}
