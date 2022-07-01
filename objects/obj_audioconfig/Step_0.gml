scr_getinput()
if (updown_buffer > 0)
{
	updown_buffer--
	if (!key_up2 && !key_down2 && (!keyboard_check_pressed(vk_up)) && (!keyboard_check_pressed(vk_down)))
		updown_buffer = 0
}
else
{
	if ((key_up2 or keyboard_check_pressed(vk_up)) && audio_select > -1)
	{
		updown_buffer = updown_max
		audio_select -= 1
		scr_soundeffect(sfx_step)
	}
	if ((key_down2 or keyboard_check_pressed(vk_down)) && audio_select < 2)
	{
		updown_buffer = updown_max
		audio_select += 1
		scr_soundeffect(sfx_step)
	}
}

if (key_jump or keyboard_check_pressed(vk_return))
{
	switch audio_select
	{
		case -1:
			set_audio_config()
			with obj_option
			{
				visible = true
				key_jump = false
				buffer = 15
			}
			instance_destroy()
			scr_soundeffect(sfx_step)
			break
		
		default:
			set_audio_config()
			break
	}

}

if (key_buffer > 0)
	key_buffer--
else
{
	var moveh = 0;
	if (!keyboard_check(vk_shift) && (-key_left or keyboard_check(vk_left)))
	or (-key_left2 or keyboard_check_pressed(vk_left))
		moveh = -1;
	if (!keyboard_check(vk_shift) && (-key_right or keyboard_check(vk_right)))
	or (-key_right2 or keyboard_check_pressed(vk_right))
		moveh = 1;
	
	switch audio_select
	{
		case 0: audiosaved_master += moveh; break;
		case 1: audiosaved_music += moveh; break;
		case 2: audiosaved_sfx += moveh; break;
	}
	
	if keyboard_check_pressed(ord("R"))
	{
		switch audio_select
		{
			case 0: audiosaved_master = 100; break;
			case 1: audiosaved_music = 60; break;
			case 2: audiosaved_sfx = 100; break;
		}
	}
}
audiosaved_master = clamp(audiosaved_master, 0, 100)
audiosaved_music = clamp(audiosaved_music, 0, 100)
audiosaved_sfx = clamp(audiosaved_sfx, 0, 100)
