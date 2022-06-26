if ((!global.pizzadelivery) && global.pizzasdelivered < 5 && global.panic == false)
{
    if (!global.failcutscene)
    {
        if (global.pizzasdelivered <= 0)
            scene_info = [[cutscene_set_sprite, 791, 2255, 0.35, -1], [cutscene_gustavo_start], [cutscene_wait, 30], [cutscene_set_sprite, 791, 2246, 0.35, -1], [cutscene_wait, 10], [cutscene_move_player, 324, (obj_gustavo.x - 48), 6, 16], [cutscene_set_sprite, 324, 2235, 0.35, 1], [cutscene_set_sprite, 791, 2247, 0.35, -1], [cutscene_gustavo_end]]
        else
            scene_info = [[cutscene_set_sprite, 791, 2246, 0.35, -1]]
    }
    else
        scene_info = [[cutscene_gustavofail_start], [cutscene_wait, 20], [cutscene_set_sprite, 791, 2250, 0.35, -1], [cutscene_waitfor_sprite, 791], [cutscene_set_sprite, 791, 2251, 0.35, -1], [cutscene_wait, 50], [cutscene_set_sprite, 791, 2252, 0.35, -1], [cutscene_set_sprite, 324, 2238, 0.35, 1], [cutscene_waitfor_sprite, 791], [cutscene_set_sprite, 791, 2253, 0.35, -1], [cutscene_set_hsp, 791, -12], [cutscene_set_sprite, 324, 2242, 0.35, 1], [cutscene_waitfor_sprite, 324], [cutscene_set_sprite, 324, 2243, 0.35, 1], [cutscene_check_collision, 791, 324], [cutscene_set_hsp, 791, 0], [cutscene_gustavofail_end, 100], [cutscene_move_actor, 791, obj_gustavo.xstart, obj_gustavo.ystart, 0.05], [cutscene_set_sprite, 791, 2246, 0.35, -1]]
}
else
    scene_info = [[cutscene_wait, 2]]
