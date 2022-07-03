if (image_index == 1 && global.panic == false && room != war_13)
{
	with (obj_player)
	{
		if (state == states.comingoutdoor && floor(image_index) == (image_number - 2))
		{
			scr_soundeffect(sfx_groundpound)
			GamepadSetVibration(0, 1, 1, 0.9)
			GamepadSetVibration(1, 1, 1, 0.9)
			with (obj_player1)
			{
				lastroom = room
				sprite_index = spr_Timesup
				image_index = 0
				with (obj_camera)
				{
					shake_mag = 10
					shake_mag_acc = (30 / room_speed)
				}
			}
			if (global.coop == true)
			{
				with (obj_player2)
				{
					lastroom = room
					sprite_index = spr_Timesup
					image_index = 0
					with (obj_camera)
					{
						shake_mag = 10
						shake_mag_acc = (30 / room_speed)
					}
				}
			}
			other.image_index = 0
			ds_list_add(global.saveroom, other.id)
		}
	}
}
if drop && dropstate != states.idle
	exit;

with obj_player
{
	if (grounded && x > (other.x - 160) && x < (other.x + 160) && key_up && (state == states.normal or state == states.mach1 or state == states.mach2 or state == states.mach3) && (global.panic == true or global.snickchallenge == 1 or room == war_13))
	{
		var ex = x
		var ey = y
		var cx = camera_get_view_x(view_camera[0])
		var cy = camera_get_view_y(view_camera[0])
		
		rankpos_x = ex - cx
		rankpos_y = ey - cy
		
		if global.timeattack
			obj_timeattack.stop = true
		
		targetDoor = "none"
		obj_camera.alarm[2] = -1
		
		var roomname = room_get_name(room)
		var namestring = string_letters(roomname)
		
		if !check_race()
		{
			scr_savescore(global.leveltosave)
			gamesave_async_save()
		}
		else
		{
			audio_stop_sound(obj_music.music)
			audio_stop_sound(sfx_escaperumble)
			switch global.racerank
			{
				default: global.rank = "d"; scr_soundeffect(mu_rankd); break;
				case 1: global.rank = "c"; scr_soundeffect(mu_rankc); break;
				case 2: global.rank = "b"; scr_soundeffect(mu_rankb); break;
				case 3: global.rank = "a"; scr_soundeffect(mu_ranka); break;
				case 4: global.rank = "s"; scr_soundeffect(mu_ranks); break;
			}
		}
		
		if global.combo > 0
		{
			global.combotime = 0
			global.combo = 0
			obj_camera.alarm[4] = -1
			for (var i = 0; i < global.comboscore; i += 10)
				create_collect(x + irandom_range(-60, 60), y - 100 + irandom_range(-60, 60), choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect))
			global.comboscore = 0
		}
		with instance_create_unique(x, y, obj_endlevelfade)
		{
			player = other.id
			alarm[0] = 235
		}
		
		state = states.door
		sprite_index = spr_lookdoor
		with obj_player
		{
			state = states.door
			sprite_index = spr_lookdoor
			if global.coop
				visible = true
		}
		
		image_index = 0
		global.panic = false
		global.snickchallenge = false
	}
}
