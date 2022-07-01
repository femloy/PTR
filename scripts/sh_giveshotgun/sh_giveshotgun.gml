function sh_giveshotgun()
{
	if !WC_debug
		return "You do not have permission to use this command";
	if !instance_exists(obj_player)
		return "The player is not in the room";
	
	with obj_player
	{
		if shotgunAnim
		{
			shotgunAnim = false;
			return "Removed shotgun";
		}
		else
		{
			shotgunAnim = true;
			scr_soundeffect(sfx_shotgungot);
			state = states.shotgun;
			image_index = 0;
			sprite_index = spr_shotgunpullout;
		}
	}
}
function meta_giveshotgun()
{
	return {
		description: "gives or takes a shotgun from the player",
	}
}

