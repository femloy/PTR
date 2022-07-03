/// @description connect
client = network_create_socket(network_socket_tcp);
network_connect_async(client, ip, real(port));
