if (!in_saveroom(id))
{
	with (instance_create(x, y, obj_debris))
	{
		sprite_index = other.sprite_index
		image_index = other.image_index
	}
	ds_list_add(global.saveroom, id)
}
