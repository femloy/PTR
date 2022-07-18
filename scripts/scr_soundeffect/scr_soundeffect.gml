function scr_soundeffect()
{
	var snd = argument[irandom((argument_count - 1))]
	var snd_id = audio_play_sound(snd, 1, false)
	sfx_gain(snd_id);
	return snd_id;
}

function sfx_gain(snd) {
	audio_sound_gain(snd, global.option_sfx_volume, 0)
}
