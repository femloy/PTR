function cutscene_set_player_normal()
{
    with (obj_player)
    {
        if check_player_coop()
            state = (0 << 0)
    }
    cutscene_end_action()
    exit;
}

