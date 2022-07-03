audio_stop_sound(sfx_killenemy);
scr_soundeffect(sfx_killenemy);
with instance_create(x + 32, y + 32, obj_sausageman_dead)
	sprite_index = spr_racebarrierdead;
ds_list_add(global.saveroom, id);
