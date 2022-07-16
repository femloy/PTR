function scr_collectsprite(collect = 0, character = "")
{
	if character == ""
	{
		character = instance_exists(obj_player1) ? ((obj_player1.spotlight or !instance_exists(obj_player2) or !global.coop) ? obj_player1.character : obj_player2.character) : "P";
		if character == "P" && safe_get(obj_player1, "ispeppino") == false
			character = "N";
	}
	
	var collect_array = [spr_shroomcollect, spr_cheesecollect, spr_tomatocollect, spr_sausagecollect, spr_pineapplecollect];
	switch collect
	{
		case 0: // normal collectibles
			if character == "N"
				collect_array = [spr_halloweencollectibles1, spr_halloweencollectibles2, spr_halloweencollectibles3, spr_halloweencollectibles4, spr_halloweencollectibles5];
			if character == "S"
				collect_array = [spr_snickcollectible1];
			break;
		
		case 1: // big collectibles
			collect_array = [spr_pizzacollect1, spr_pizzacollect2, spr_pizzacollect3, spr_pizzacollect4, spr_pizzacollect5];
			if character == "N"
				collect_array = [spr_pizzacollect1halloween, spr_pizzacollect2halloween, spr_pizzacollect3halloween];
			if character == "S"
				collect_array = [spr_snickcollectible2];
			break;
		
		case 2: // giant collectibles
			collect_array = [spr_giantpizza];
			if character == "N"
				collect_array = [spr_giantpizzahalloween];
			if character == "S"
				collect_array = [spr_snickcollectible3];
			break;
	}
	return collect_array[irandom(array_length(collect_array) - 1)];
}
