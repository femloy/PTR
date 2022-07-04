if (room == rm_editor)
	exit;
if (!in_saveroom(id))
{
	ds_list_add(global.saveroom, id)
	if (object_index == obj_escapecollect)
		ds_list_add(global.escaperoom, id)
}
if (!gotowardsplayer)
	scr_ghostcollectible()
