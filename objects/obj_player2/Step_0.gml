if (room == rm_editor)
{
    visible = false
    exit;
}
scr_getinput2()
event_inherited()
if (!global.coop)
{
    obj_player1.spotlight = 1
    x = -1000
    y = 500
    state = (18 << 0)
    if instance_exists(obj_coopflag)
        instance_destroy(obj_coopflag)
    if instance_exists(obj_cooppointer)
        instance_destroy(obj_cooppointer)
}
else if (key_start && (!fightball) && obj_player1.state != (121 << 0) && obj_player1.state != (4 << 0))
    state = (186 << 0)
if ((!visible) && state == (95 << 0))
{
    coopdelay++
    image_index = 0
    if (coopdelay == 50)
    {
        visible = true
        coopdelay = 0
    }
}
