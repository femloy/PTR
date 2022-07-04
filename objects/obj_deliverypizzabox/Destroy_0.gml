if (!in_saveroom(id))
{
	ds_list_add(global.saveroom, id)
	instance_create_unique(0, 0, obj_deliverytimer)
	with (obj_deliverytimer)
	{
		minutes = other.minutes
		seconds = other.seconds
	}
}
