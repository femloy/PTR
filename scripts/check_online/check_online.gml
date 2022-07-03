function check_race() {
	return instance_exists(obj_onlineclient) && obj_onlineclient.connected && obj_onlineclient.gamemode == 0;
}
