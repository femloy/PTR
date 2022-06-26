function scr_changetoppings()
{
    with (obj_collect)
    {
        if (ds_list_find_index(global.saveroom, id) == -1)
        {
            if ((obj_player1.character == "P" && obj_player1.spotlight == 1) or (obj_player2.character == "P" && obj_player1.spotlight == 0))
                sprite_index = choose(1559, 1561, 1562, 1563, 1560)
            if ((obj_player1.character == "N" && obj_player1.spotlight == 1) or (obj_player2.character == "N" && obj_player1.spotlight == 0))
                sprite_index = choose(2080, 2082, 2086, 2087, 2088)
            instance_create((x + (sprite_width / 2)), (y + (sprite_height / 2)), obj_cloudeffect)
            repeat (3)
                instance_create(((x + (sprite_width / 2)) + random_range(-5, 5)), ((y + (sprite_height / 2)) + random_range(-5, 5)), obj_cloudeffect)
        }
    }
    with (obj_bigcollect)
    {
        if (ds_list_find_index(global.saveroom, id) == -1)
        {
            if ((obj_player1.character == "P" && obj_player1.spotlight == 1) or (obj_player2.character == "P" && obj_player1.spotlight == 0))
                sprite_index = choose(1555, 1556, 1558)
            if ((obj_player1.character == "N" && obj_player1.spotlight == 1) or (obj_player2.character == "N" && obj_player1.spotlight == 0))
                sprite_index = choose(1554, 1553, 1552)
            instance_create((x + (sprite_width / 2)), (y + (sprite_height / 2)), obj_cloudeffect)
            repeat (3)
                instance_create(((x + (sprite_width / 2)) + random_range(-10, 10)), ((y + (sprite_height / 2)) + random_range(-5, 5)), obj_cloudeffect)
        }
    }
    with (obj_giantcollect)
    {
        if (ds_list_find_index(global.saveroom, id) == -1)
        {
            if ((obj_player1.character == "P" && obj_player1.spotlight == 1) or (obj_player2.character == "P" && obj_player1.spotlight == 0))
                sprite_index = spr_giantpizza
            if ((obj_player1.character == "N" && obj_player1.spotlight == 1) or (obj_player2.character == "N" && obj_player1.spotlight == 0))
                sprite_index = spr_giantpizzahalloween
            instance_create((x + (sprite_width / 2)), (y + (sprite_height / 2)), obj_cloudeffect)
            repeat (5)
                instance_create(((x + (sprite_width / 2)) + random_range(-15, 15)), ((y + (sprite_height / 2)) + random_range(-5, 5)), obj_cloudeffect)
        }
    }
    with (obj_destroyable2)
    {
        if (ds_list_find_index(global.saveroom, id) == -1)
        {
            if ((obj_player1.character == "P" && obj_player1.spotlight == 1) or (obj_player2.character == "P" && obj_player1.spotlight == 0))
                sprite_index = spr_destroyable2
            if ((obj_player1.character == "N" && obj_player1.spotlight == 1) or (obj_player2.character == "N" && obj_player1.spotlight == 0))
                sprite_index = spr_halloweensmallblock
            instance_create((x + (sprite_width / 2)), (y + (sprite_height / 2)), obj_cloudeffect)
            repeat (3)
                instance_create(((x + (sprite_width / 2)) + random_range(-5, 5)), ((y + (sprite_height / 2)) + random_range(-5, 5)), obj_cloudeffect)
        }
    }
    with (obj_destroyable2_big)
    {
        if (ds_list_find_index(global.saveroom, id) == -1)
        {
            if ((obj_player1.character == "P" && obj_player1.spotlight == 1) or (obj_player2.character == "P" && obj_player1.spotlight == 0))
                sprite_index = spr_bigbreakable
            if ((obj_player1.character == "N" && obj_player1.spotlight == 1) or (obj_player2.character == "N" && obj_player1.spotlight == 0))
                sprite_index = spr_halloweenbigblock
            instance_create((x + (sprite_width / 2)), (y + (sprite_height / 2)), obj_cloudeffect)
            repeat (3)
                instance_create(((x + (sprite_width / 2)) + random_range(-10, 10)), ((y + (sprite_height / 2)) + random_range(-5, 5)), obj_cloudeffect)
        }
    }
    exit;
}

