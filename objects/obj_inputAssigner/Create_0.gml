player_input_device[0] = -2
player_input_device[1] = -2
device_selected[0] = 0
device_selected[1] = 0
press_start = 0
deactivated = 0
device_to_reconnect = 0
prevstate[0] = states.titlescreen
prevstate[1] = states.titlescreen
vibration[0][0] = 0
vibration[0][1] = 0
vibration[0][2] = 0
vibration[1][0] = 0
vibration[1][1] = 0
vibration[1][2] = 0

setVibration = function(player, leftmotor, rightmotor, dec)
{
	vibration[player][0] = leftmotor
	vibration[player][1] = rightmotor
	
	if dec != undefined
		vibration[player][2] = dec
}

function CheckUsedIndex(cont)
{
	for (var _x = 0; _x < 2; _x++)
	{
		if player_input_device[_x] == cont
			return true;
	}
	return false;
}

pausebg = noone;
instlist = [];
onpause = false;

var gp_num = gamepad_get_device_count();
for (var i = 0; i < gp_num; i++)
{
	if gamepad_is_connected(i)
	{
		player_input_device[0] = i;
		break;
	}
}
