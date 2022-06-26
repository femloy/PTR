global.levelcomplete = 1
scr_playerreset()
with (obj_player)
{
    targetDoor = "A"
    targetRoom = rm_levelselect
    room = rm_levelselect
    x = -100
    y = -100
    state = (18 << 0)
    image_blend = c_white
}
