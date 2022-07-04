if (!in_saveroom(id))
{
	ds_list_add(global.saveroom, id)
	instance_create(x, y, obj_ratrunaway)
}
