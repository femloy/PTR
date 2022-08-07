for(var i = 0; i < ds_list_size(socket_list); i++)
{
	packet_write_server(buffer_u8, network.close_server);
	packet_send_server(socket_list[|i]);
}
network_destroy(server);
ds_list_destroy(socket_list);
buffer_delete(server_buffer);
