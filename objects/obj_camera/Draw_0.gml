if room == custom_lvl_room or room == editor_room or safe_get(obj_shell, "WC_oobcam") == true
	exit;

draw_set_color(c_black)
var cam_x = _camx
var cam_y = _camy
var cam_w = _camw
var cam_h = _camh
draw_rectangle(-abs(cam_x), -abs(cam_y), cam_x + cam_w, 0, false)
draw_rectangle(-abs(cam_x), -abs(cam_y), 0, cam_y + cam_h, false)
draw_rectangle(room_width, -abs(cam_y), cam_x + cam_w, cam_y + cam_h, false)
draw_rectangle(-abs(cam_x), room_height, cam_x + cam_w, cam_y + cam_h, false)
draw_set_color(c_white)
