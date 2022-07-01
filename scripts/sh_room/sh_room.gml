function sh_room(args)
{
	if !WC_debug
		return "You do not have permission to use this command";
	if array_length(args) < 2
		return "The current room is " + room_get_name(room) + " (" + string(room) + ")";
	
	var roomgoto = args[1];
	
	if string_is_number(roomgoto)
	{
		roomgoto = real(roomgoto);
		if !room_exists(roomgoto)
			return "The room " + string(roomgoto) + " doesn't exist";
	}
	else if asset_get_type(roomgoto) != asset_room
		return "The asset " + roomgoto + " is not a room";
	
	var door = "NONE";
	if array_length(args) >= 3
		door = args[2];
	
	with obj_player
		targetDoor = door;
	
	room_goto(asset_get_index(roomgoto));
	scr_soundeffect(sfx_door);
}
function meta_room()
{
	return {
		description: "travel to a room",
		arguments: ["targetRoom", "<targetDoor>"],
		suggestions: [
			function()
			{
				var room_array = [];
				for(var i = 0; room_exists(i); i++)
					array_push(room_array, room_get_name(i));
				array_sort(room_array, true);
				return room_array;
			},
			["A", "B", "C", "D", "E"]
		],
		argumentDescriptions: [
			"room to travel to, input as name or index",
			"(optional) door index to place the player at"
		],
	}
}
