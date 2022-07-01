if (special_prompts == -4 && room != Realtitlescreen && room != characterselect)
{
	special_prompts = ds_map_create()
	ini_open(concat("saveData", global.currentsavefile, ".ini"))
	ds_map_set(special_prompts, "knight", ini_read_real("Prompts", "knight", 0))
	ds_map_set(special_prompts, "boxxedpep", ini_read_real("Prompts", "boxxedpep", 0))
	ds_map_set(special_prompts, "mort", ini_read_real("Prompts", "mort", 0))
	ds_map_set(special_prompts, "squished", ini_read_real("Prompts", "squished", 0))
	ds_map_set(special_prompts, "skateboard", ini_read_real("Prompts", "skateboard", 0))
	ds_map_set(special_prompts, "cheeseball", ini_read_real("Prompts", "cheeseball", 0))
	ds_map_set(special_prompts, "shotgun", ini_read_real("Prompts", "shotgun", 0))
	ds_map_set(special_prompts, "ghost", ini_read_real("Prompts", "ghost", 0))
	ds_map_set(special_prompts, "firemouth", ini_read_real("Prompts", "firemouth", 0))
	ds_map_set(special_prompts, "fireass", ini_read_real("Prompts", "fireass", 0))
	ds_map_set(special_prompts, "bombpep", ini_read_real("Prompts", "bombpep", 0))
	ds_map_set(special_prompts, "rocket", ini_read_real("Prompts", "rocket", 0))
	ini_close()
}
if (room == Realtitlescreen)
{
	if (special_prompts != -4)
		ds_map_destroy(special_prompts)
	special_prompts = -4
}

switch room
{
	case entrance_1: global.srank = 11500; break;
	case medieval_1: global.srank = 10300; break;
	case chateau_1: global.srank = 9300; break;
	case ruin_1: global.srank = 11200; break;
	case ufo_1: global.srank = 10950; break;
	case desert_1: global.srank = 13400; break;
	case farm_1: global.srank = 10300; break;
	case graveyard_1: global.srank = 11855; break;
	case dungeon_1: global.srank = 10300; break;
	case strongcold_10: global.srank = 9000; break;
	case dragonlair_1: global.srank = 4500; break;
	case beach_1: global.srank = 14000; break;
	case forest_1: global.srank = 14000; break;
}
global.arank = global.srank - global.srank / 4
global.brank = global.srank - (global.srank / 4) * 2
global.crank = global.srank - (global.srank / 4) * 3
if room == custom_lvl_room
	alarm[1] = 4
