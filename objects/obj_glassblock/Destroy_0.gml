if (!in_saveroom(id))
{
	instance_create((x + random_range(-10, 10)), (y + random_range(-10, 10)), obj_glassdebris)
	instance_create((x + random_range(-10, 10)), (y + random_range(-10, 10)), obj_glassdebris)
	instance_create((x + random_range(-10, 10)), (y + random_range(-10, 10)), obj_glassdebris)
	instance_create((x + random_range(-10, 10)), (y + random_range(-10, 10)), obj_glassdebris)
	instance_create((x + random_range(-10, 10)), (y + random_range(-10, 10)), obj_glassdebris)
	instance_create((x + random_range(-10, 10)), (y + random_range(-10, 10)), obj_glassdebris)
	tile_layer_delete_at(1, x, y)
	ds_list_add(global.saveroom, id)
}
