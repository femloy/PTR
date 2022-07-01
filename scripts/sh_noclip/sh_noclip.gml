function sh_noclip()
{
	if !WC_debug
		return "You do not have permission to use this command";
	
	isOpen = false;
	with obj_player1
		state = states.debugstate;
}
function meta_noclip()
{
	return {
		description: "set the player's state to states.debugstate"
	}
}
