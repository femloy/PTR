function scr_resumemusic()
{
	with obj_music
	{
		if obj_music.secret
		{
			audio_sound_gain(secretmusicID, global.option_music_volume, 0)
			audio_sound_gain(musicID, global.option_music_volume, 0)
			audio_pause_sound(musicID)
		}
		else
		{
			audio_sound_gain(musicID, global.option_music_volume, 0)
			audio_stop_sound(secretmusicID)
		}
	}
}
