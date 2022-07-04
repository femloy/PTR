if (!in_saveroom(id))
{
	ds_list_add(global.saveroom, id)
	repeat (4)
		create_debris(x, y, spr_mortcubedebris)
}
