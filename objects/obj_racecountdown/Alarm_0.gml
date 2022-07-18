countdown--;
if countdown == 0
{
	with obj_music
		musicID = scr_music(music);
	with obj_racebarrier
		instance_destroy();
}
if countdown == -1
	instance_destroy();
alarm[0] = 60;
