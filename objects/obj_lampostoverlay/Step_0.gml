if instance_exists(ID)
{
	x = ID.x;
	y = ID.y;
	image_xscale = ID.image_xscale;
	image_yscale = ID.image_yscale;
	image_index = ID.image_index + 2;
}
else
	instance_destroy();
