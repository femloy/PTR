if ds_list_find_index(global.baddieroom, id) != -1
or ds_list_find_index(global.saveroom, id) == -1
{
	instance_destroy(id, false);
	exit;
}

if escape == true
{
	var b = false;
	with obj_escapespawn
	{
		if baddieID == other.id && state != 0
			b = true;
	}
	if !b
	{
		instance_deactivate_object(id)
		with instance_create(x, y, obj_escapespawn)
			baddieID = other.id
	}
}
if elite
{
	hp += 1
	elitehp = hp
}

// snap to ground
if room != custom_lvl_room
{
	for(i = y; i < y + 64; i++)
	{
		if scr_solid(x, i + 1)
		{
			y = i;
			break;
		}
	}
}
