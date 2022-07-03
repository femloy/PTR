if live_call() return live_result;
with obj_player
	state = states.titlescreen;
menu = 0;
sel = 0;
image_speed = 0.35;

consolelog = ds_list_create();
ds_list_add(consolelog, "test 123", "is it working?!??!??!");
typeline = 0;
