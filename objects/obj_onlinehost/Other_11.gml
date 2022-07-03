/// @description connect
server = network_create_server(network_socket_tcp, real(port), real(max_clients));
server_buffer = buffer_create(1024, buffer_fixed, 1);
