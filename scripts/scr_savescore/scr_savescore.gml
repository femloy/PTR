function scr_savescore(argument0)
{
	if global.srank <= 0
		global.rank = "eggplant";
	else if global.collect + global.collectN >= global.srank
	{
		global.rank = "s"
		if !global.combodropped
			global.rank = "p"
	}
	else if global.collect + global.collectN > global.arank
		global.rank = "a"
	else if global.collect + global.collectN > global.brank
		global.rank = "b"
	else if global.collect + global.collectN > global.crank
		global.rank = "c"
	else
		global.rank = "d"
	
	switch global.rank
	{
		case "s": case "p": scr_soundeffect(mu_ranks); break;
		case "a": scr_soundeffect(mu_ranka); break;
		case "b": scr_soundeffect(mu_rankb); break;
		case "c": scr_soundeffect(mu_rankc); break;
		default: scr_soundeffect(mu_rankd); break;
	}
	audio_stop_sound(obj_music.music)
	audio_stop_sound(sfx_escaperumble)
	
	ini_open_from_string(obj_savesystem.ini_str)
	if (ini_read_real("Highscore", argument0, 0) < global.collect)
		ini_write_real("Highscore", argument0, global.collect)
	if ini_read_real("Treasure", argument0, 0) == 0
		ini_write_real("Treasure", argument0, global.treasure)
	
	if global.secretfound > 3
		global.secretfound = 3
	if (ini_read_real("Secret", argument0, 0) < global.secretfound)
		ini_write_string("Secret", argument0, global.secretfound)
	
	if (ini_read_real("Toppin", (argument0 + "1"), 0) == 0)
		ini_write_real("Toppin", (argument0 + "1"), global.shroomfollow)
	if (ini_read_real("Toppin", (argument0 + "2"), 0) == 0)
		ini_write_real("Toppin", (argument0 + "2"), global.cheesefollow)
	if (ini_read_real("Toppin", (argument0 + "3"), 0) == 0)
		ini_write_real("Toppin", (argument0 + "3"), global.tomatofollow)
	if (ini_read_real("Toppin", (argument0 + "4"), 0) == 0)
		ini_write_real("Toppin", (argument0 + "4"), global.sausagefollow)
	if (ini_read_real("Toppin", (argument0 + "5"), 0) == 0)
		ini_write_real("Toppin", (argument0 + "5"), global.pineapplefollow)
	
	ini_write_string("Ranks", argument0, global.rank)
	obj_savesystem.ini_str = ini_close()
}
