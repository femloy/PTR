ds_list_destroy(baddielist)
if (!in_saveroom(id))
{
	ds_list_add(global.saveroom, id)
	global.kungfu = 0
}
