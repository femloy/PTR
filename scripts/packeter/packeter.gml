// for my own sanity
function packet_start()
{
	with obj_onlineclient
	{
		packet = true;
		buffer_seek(client_buffer, buffer_seek_start, 0);
	}
}
function packet_write(type, value)
{
	with obj_onlineclient
	{
		if !packet
			packet_start();
		buffer_write(client_buffer, type, value);
	}
}
function packet_send()
{
	with obj_onlineclient
	{
		network_send_packet(client, client_buffer, buffer_tell(client_buffer));
		packet = false;
	}
}
function sync_var(name, value_type, value)
{
	packet_start();
	packet_write(buffer_u8, network.sync_var);
	packet_write(buffer_u8, value_type);
	packet_write(buffer_string, name);
	packet_write(value_type, value);
	packet_send();
}

function packet_start_server()
{
	with obj_onlinehost
	{
		packet = true;
		buffer_seek(server_buffer, buffer_seek_start, 0);
	}
}
function packet_write_server(type, value)
{
	with obj_onlinehost
	{
		if !packet
			packet_start_server();
		buffer_write(server_buffer, type, value);
	}
}
function packet_send_server(socket)
{
	with obj_onlinehost
	{
		network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
		packet = false;
	}
}
