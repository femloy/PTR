with (obj_player)
{
    var dis = abs((x - other.x))
    if (!instance_exists(obj_dialogcontroller))
    {
        if (!other.warned)
        {
            if (dis < 300)
            {
                with (other)
                {
                    dialog[0] = dialog_create("Not one step closer!", -4, vigilante_add_battle)
                    do_dialog(dialog)
                    dialog = -4
                    warned = 1
                }
            }
        }
        else if (dis < 200)
        {
            if (state == (17 << 0))
            {
                with (possessID)
                {
                    state = (138 << 0)
                    stunned = 50
                }
                state = (0 << 0)
            }
            with (other)
            {
                scr_hurtplayer(other)
                waitforhurt = 1
            }
        }
    }
}
if (waitforhurt && (!instance_exists(obj_dialogcontroller)))
{
    var b = 0
    with (obj_player)
    {
        if (state == (107 << 0))
            b = 1
    }
    if (!b)
    {
        waitforhurt = 0
        dialog[0] = dialog_create("You gotta fight me!", -4, vigilante_add_battle)
        do_dialog(dialog)
        dialog = -4
        warned = 1
    }
}
