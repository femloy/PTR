function scr_room_updated(r)
{
	if (r == room or (room == live_blank_room && live_live_room == r))
	{
		with (obj_player)
		{
			hallway = savedhallway
			hallwaydirection = savedhallwaydirection
			vhallwaydirection = savedvhallwaydirection
			verticalhallway = savedverticalhallway
		}
		room_goto_live(r)
	}
}
