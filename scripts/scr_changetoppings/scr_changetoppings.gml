function scr_changetoppings()
{
	var spot = obj_player1.spotlight ? obj_player1 : obj_player2;
	if !instance_exists(spot)
	{
		spot = obj_player1;
		if !instance_exists(spot)
			exit;
	}
	
	with obj_collect
	{
		if !in_saveroom(id)
		{
			var spriteprev = sprite_index;
			sprite_index = scr_collectsprite(0, spot.character);
			
			if spriteprev != sprite_index
			{
				instance_create(x + sprite_width / 2, y + sprite_height / 2, obj_cloudeffect)
				repeat 3
					instance_create(x + sprite_width / 2 + random_range(-5, 5), y + sprite_height / 2 + random_range(-5, 5), obj_cloudeffect)
			}
		}
	}
	with (obj_bigcollect)
	{
		if (!in_saveroom(id))
		{
			if ((obj_player1.character == "P" && obj_player1.spotlight == 1) or (obj_player2.character == "P" && obj_player1.spotlight == 0))
				sprite_index = choose(spr_pizzacollect1, spr_pizzacollect2, spr_pizzacollect3)
			if ((obj_player1.character == "N" && obj_player1.spotlight == 1) or (obj_player2.character == "N" && obj_player1.spotlight == 0))
				sprite_index = choose(spr_pizzacollect1halloween, spr_pizzacollect2halloween, spr_pizzacollect3halloween)
			instance_create((x + (sprite_width / 2)), (y + (sprite_height / 2)), obj_cloudeffect)
			repeat (3)
				instance_create(((x + (sprite_width / 2)) + random_range(-10, 10)), ((y + (sprite_height / 2)) + random_range(-5, 5)), obj_cloudeffect)
		}
	}
	with (obj_giantcollect)
	{
		if (!in_saveroom(id))
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
		if (!in_saveroom(id))
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
		if (!in_saveroom(id))
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
}
