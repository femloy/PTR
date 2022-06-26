if ((!global.pizzadelivery) && global.pizzasdelivered < 5 && global.panic == false)
{
    if (!global.failcutscene)
    {
        if (global.pizzasdelivered <= 0)
            scene_info = [[cutscene_set_sprite, obj_gustavo, 2255, 0.35, -1], [cutscene_gustavo_start], [cutscene_wait, 30], [cutscene_set_sprite, obj_gustavo, 2246, 0.35, -1], [cutscene_wait, 10], [cutscene_move_player, 324, (obj_gustavo.x - 48), 6, 16], [cutscene_set_sprite, obj_player1, 2235, 0.35, 1], [cutscene_set_sprite, obj_gustavo, 2247, 0.35, -1], [cutscene_gustavo_end]]
        else
            scene_info = [[cutscene_set_sprite, obj_gustavo, 2246, 0.35, -1]]
    }
    else
        scene_info = [[cutscene_gustavofail_start], [cutscene_wait, 20], [cutscene_set_sprite, obj_gustavo, 2250, 0.35, -1], [cutscene_waitfor_sprite, obj_gustavo], [cutscene_set_sprite, obj_gustavo, 2251, 0.35, -1], [cutscene_wait, 50], [cutscene_set_sprite, obj_gustavo, 2252, 0.35, -1], [cutscene_set_sprite, obj_player1, 2238, 0.35, 1], [cutscene_waitfor_sprite, obj_gustavo], [cutscene_set_sprite, obj_gustavo, 2253, 0.35, -1], [cutscene_set_hsp, obj_gustavo, -12], [cutscene_set_sprite, obj_player1, 2242, 0.35, 1], [cutscene_waitfor_sprite, obj_player1], [cutscene_set_sprite, obj_player1, 2243, 0.35, 1], [cutscene_check_collision, obj_gustavo, obj_player1], [cutscene_set_hsp, obj_gustavo, 0], [cutscene_gustavofail_end, 100], [cutscene_move_actor, obj_gustavo, obj_gustavo.xstart, obj_gustavo.ystart, 0.05], [cutscene_set_sprite, obj_gustavo, 2246, 0.35, -1]]
}
else
    scene_info = [[cutscene_wait, 2]]
