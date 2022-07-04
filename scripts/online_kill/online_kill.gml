function online_kill(ID, add_to_saveroom = true)
{
	if check_race()
	{
		packet_start();
		packet_write(buffer_u8, network.kill_object);
		packet_write(buffer_string, string(ID));
		packet_write(buffer_bool, add_to_saveroom);
		packet_send();
	}
}
