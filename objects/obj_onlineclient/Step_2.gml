/// @description sync player
if live_call() return live_result;
if !connected
	exit;

with obj_player1
{
	packet_write(buffer_u8, network.player_sync);
	packet_write(buffer_u16, room);
	packet_write(buffer_bool, visible);
	packet_write(buffer_s16, x);
	packet_write(buffer_s16, y);
	packet_write(buffer_u32, image_blend);
	packet_write(buffer_u8, image_index);
	packet_write(buffer_string, sprite_get_name(sprite_index));
	packet_write(buffer_s8, xscale);
	packet_write(buffer_s16, racepos);
	packet_send();
}
if safe_get(obj_pause, "pause")
{
	if !localpaused
		sync_var("pause", buffer_bool, true);
	localpaused = true;
}
else
{
	if localpaused
		sync_var("pause", buffer_bool, false);
	localpaused = false;
}

// make race pos
var dones = 0;

var racepos_arr = [];
array_push(racepos_arr, [-1, obj_player1.racepos]);
with obj_otherplayer
{
	array_push(racepos_arr, [socket, racepos]);
	if done
		dones++;
}
array_sort(racepos_arr, function(a, b) {
    return b[1] - a[1];
});

if room != rank_room
{
	global.racerank = 0;
	var len = array_length(racepos_arr) - 1;
	for(var i = 0; i < len; i++)
	{
		if racepos_arr[i][0] == -1
		{
			global.racerank = lerp(0, 4, (len - dones - i) / len);
			break;
		}
	}
}
