countdown--;
if countdown == 0
{
	audio_resume_sound(obj_music.musicID);
	with obj_racebarrier
		instance_destroy();
}
if countdown == -1
	instance_destroy();
alarm[0] = 60;
