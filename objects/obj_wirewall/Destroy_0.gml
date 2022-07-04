if (!in_saveroom(id))
{
	instance_create((x + 16), y, obj_debris)
	instance_create((x + 16), y, obj_debris)
	instance_create((x + 16), y, obj_debris)
	instance_create((x + 16), y, obj_debris)
	ds_list_add(global.saveroom, id)
}
