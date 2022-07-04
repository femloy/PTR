if place_meeting(x, y, obj_player) && !in_saveroom(id)
{
	ds_list_add(global.saveroom, id)
	visited = true
}
else if in_saveroom(id)
	visited = true

if visited && sprite_index != spr_pepperdoor
	sprite_index = spr_doorvisited
if john && global.panic
	sprite_index = spr_doorblocked
