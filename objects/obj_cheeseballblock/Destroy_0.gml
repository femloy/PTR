if (!in_saveroom(id))
{
	repeat (4)
		create_debris((x + 32), (y + 32), spr_cheeseballblockdebris)
	ds_list_add(global.saveroom, id)
}
