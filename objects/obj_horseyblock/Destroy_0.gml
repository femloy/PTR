if (!in_saveroom(id))
{
	create_particle(x, y, particle.genericpoofeffect)
	ds_list_add(global.saveroom, id)
}
