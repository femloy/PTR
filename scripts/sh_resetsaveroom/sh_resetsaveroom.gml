function sh_resetsaveroom()
{
	if !WC_debug
		return "You do not have permission to use this command";
	
	if variable_global_exists("saveroom") && ds_exists(global.saveroom, ds_type_list)
		ds_list_clear(global.saveroom);
	if variable_global_exists("baddieroom") && ds_exists(global.baddieroom, ds_type_list)
		ds_list_clear(global.baddieroom);
	if variable_global_exists("baddietomb") && ds_exists(global.baddietomb, ds_type_list) // april build
		ds_list_clear(global.baddietomb);
	if variable_global_exists("escaperoom") && ds_exists(global.escaperoom, ds_type_list) // eggplant build
		ds_list_clear(global.escaperoom);
	
	with obj_player
		targetDoor = "none";
	with all
		if !persistent && id != other.id then instance_destroy(id, false);
	
	room_restart();
				
	if !isOpen
	{
		with obj_tv
		{
			showtext = true;
			message = "SAVEROOM RESET";
			alarm[0] = 100;
		}
	}
	else
		return "Reset all level data, and restarted current room";
}
function meta_resetsaveroom()
{
	return {
		description: "completely resets a level",
	}
}
