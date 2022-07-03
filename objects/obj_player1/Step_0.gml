if (room == rm_editor)
{
	visible = false
	exit;
}
if (room == custom_lvl_room)
{
	if place_meeting(x, y, par_camera_editor)
	{
		cam = instance_place(x, y, par_camera_editor)
		cam_width = instance_place(x, y, par_camera_editor).width
		cam_height = instance_place(x, y, par_camera_editor).height
		with (obj_camera)
			bound_camera = 1
	}
	else
	{
		cam = -4
		cam_width = 0
		cam_height = 0
		instance_activate_all()
		with (obj_camera)
			bound_camera = 0
	}
}
scr_getinput()
event_inherited()

// race mode blocks
var traveldis = x - xprevious;
for(var i = 0; i < abs(traveldis); i++)
{
	if place_meeting(xprevious + i * sign(traveldis), y, obj_lapblockparent)
		lapindex = instance_place(xprevious + i * sign(traveldis), y, obj_lapblockparent);
}
if instance_exists(lapindex)
{
	if instance_exists(lapindex.nextobj)
		lapdis = 1 - (distance_to_object(lapindex.nextobj) / lapindex.disnext);
	else
		lapdis = 0;
	racepos = floor((lapindex.index + lapdis) * 100);
}
if global.panic
{
	instance_deactivate_object(obj_lapblock);
	instance_activate_object(obj_lapblockescape);
}
