prevpillar_on_camera = pillar_on_camera
if instance_exists(obj_hungrypillar)
{
	with obj_hungrypillar
		other.pillar_on_camera = bbox_in_camera(view_camera[0], 0)
}
else
	pillar_on_camera = false

if prevpillar_on_camera != pillar_on_camera
{
	if pillar_on_camera
	{
		audio_sound_gain(pillarmusicID, global.option_music_volume, 2000)
		audio_sound_gain(musicID, 0, 2000)
	}
	else
	{
		audio_sound_gain(pillarmusicID, 0, 2000)
		audio_sound_gain(musicID, global.option_music_volume, 2000)
	}
}

if global.panic
{
	if music != mu_pizzatime && music != mu_finalescape
	{
		music = mu_pizzatime
		audio_stop_sound(musicID)
		musicID = scr_music(music)
		
		if pillarmusicID != -4
			audio_stop_sound(pillarmusicID)
		pillarmusicID = -4
	}
}
