function cutscene_set_player_actor()
{
    with (obj_player)
    {
        if check_player_coop()
        {
            state = (146 << 0)
            image_speed = 0.35
        }
    }
    cutscene_end_action()
    exit;
}

