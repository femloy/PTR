if (!in_saveroom(id))
{
	ds_list_add(global.saveroom, id)
	if (object_index == obj_escapecollectbig)
		ds_list_add(global.escaperoom, id)
}
scr_ghostcollectible()
