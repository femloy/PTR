if (in_saveroom(id))
	instance_destroy()
if (global.snickchallenge == 1)
	instance_destroy()
if (global.timeattack == 1)
	instance_destroy()

if check_race()
{
	instance_change(obj_destroyable, false);
	event_perform(ev_create, 0);
}
