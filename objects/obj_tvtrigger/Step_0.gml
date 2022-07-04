if check_race()
	exit;

if (prompt_array != -4 && prompt_condition != -4 && prompt_condition())
{
	if (!in_saveroom(id))
	{
		tv_push_prompt_array(prompt_array)
		ds_list_add(global.saveroom, id)
		instance_destroy()
	}
}
