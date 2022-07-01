if player == 1
{
	if got && obj_player1.state != states.gottreasure
		instance_destroy()
}
if player == 2
{
	if got && obj_player2.state != states.gottreasure
		instance_destroy()
}

if player == 0
{
	with obj_player
	{
		if state != states.gotoplayer && place_meeting(x, y, other)
		{
			treasure_x = x
			treasure_y = y
			treasure_room = room
			global.combotime = 60
			
			if grounded
			{
				ds_list_add(global.saveroom, other.id)
				global.treasure = true
				hsp = 0
				vsp = 0
					
				if !other.got
				{
					other.alarm[0] = 150
					state = states.gottreasure
					scr_soundeffect(sfx_secretfound)
				}
				other.got = true
					
				other.x = x - 18
				other.y = y - 35
				other.effectid = instance_create(other.x + 18, other.y, obj_treasureeffect)
					
				obj_tv.showtext = true
				obj_tv.message = "YOU GOT A TOWER SECRET TREASURE!!!"
				obj_tv.alarm[0] = 200
				other.player = object_index == obj_player1 ? 1 : 2
			}
		}
	}
}
