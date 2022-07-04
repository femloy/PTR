if (in_saveroom(id))
	instance_destroy()
else
{
	inst = instance_create(x, y, obj_mach3solid)
	with (inst)
	{
		sprite_index = spr_car_solid
		mask_index = spr_car_solid
	}
}
