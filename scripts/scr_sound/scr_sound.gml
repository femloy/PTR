function scr_sound()
{
	var snd = argument[irandom(argument_count - 1)]
	global.music = audio_play_sound(snd, 10, true)
	audio_sound_gain(global.music, 0.6 * global.option_music_volume, 0)
}

function scr_music(snd)
{
	var m = audio_play_sound(snd, 10, true)
	audio_sound_gain(m, global.option_music_volume, 0)
	return m;
}

function set_master_gain(gain)
{
	if game_is_compiled()
		gain /= 5;
	audio_master_gain(gain);
}
