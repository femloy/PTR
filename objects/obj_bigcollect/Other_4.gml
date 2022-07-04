if (global.timeattack == 1)
	instance_destroy()
if (in_saveroom(id))
	instance_destroy()
if (global.snickchallenge == 1)
	instance_destroy()

if check_race()
	instance_destroy(id, false);
