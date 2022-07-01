if live_call() return live_result;

function layer_get_parallax(layer_id)
{
	var roomwidth = room_width, roomheight = room_height;
	var camx = _camx, camy = _camy, camw = _camw, camh = _camh;
	
	if instance_exists(obj_camera) && instance_exists(obj_player)
	&& obj_camera.bound_camera && instance_exists(obj_player.cam)
	{
		roomwidth = obj_player.cam_width;
		roomheight = obj_player.cam_width;
		camx -= obj_player.cam.x;
		camy -= obj_player.cam.y;
	}
	
	var n = layer_get_name(layer_id.lay);
	switch n
	{
		case "Backgrounds_1": return [camx * 0.18, camy * 0.18]; break;
		case "Backgrounds_2": return [camx * 0.19, camy * 0.19]; break;
		case "Backgrounds_3": return [camx * 0.2, camy * 0.2]; break;
		
		case "Backgrounds_Ground1": return [camx * 0.2, (camy - layer_id.y) * 0.2]; break;
		case "Backgrounds_Ground2": return [camx * 0.18, (camy - layer_id.y) * 0.18]; break;
		case "Backgrounds_Ground3": return [camx * 0.16, (camy - layer_id.y) * 0.16]; break;
		
		case "Backgrounds_H1": return [camx * 0.11, camy]; break;
		
		case "Backgrounds_sky": return [camx * 0.25, camy * 0.25]; break;
		case "Backgrounds_sky2": return [camx, camy]; break;
		case "Backgrounds_scroll": return [camx * 0.25, camy * 0.25]; break;
		case "Backgrounds_scroll2": return [camx * 0.25, camy * 0.25]; break;
		
		case "Foreground_1": return [(layer_id.x - camx) * 0.35, (layer_id.y - camy) * 0.35]; break;
		case "Foreground_Ground1": return [(layer_id.x - camx) * 0.15, (layer_id.y - camy) * 0.15]; break;
		
		case "Backgrounds_still1":
		case "Backgrounds_stillscroll":
		case "Backgrounds_still2":
		case "Backgrounds_stillH1":
		case "Backgrounds_stillH2":
			var p = [0, 0], hor = true;
			switch n
			{
				case "Backgrounds_still1": p = [0.15, 0.15]; break;
				case "Backgrounds_stillscroll": p = [0.15, 0.15]; break;
				case "Backgrounds_still2": p = [0.25, 0.25]; break;
				case "Backgrounds_stillH1": p = [0.25, 0.15]; hor = false; break;
				case "Backgrounds_stillH2": p = [0.35, 0.15]; hor = false; break;
			}
			if hor
				var returnx = camx - clamp(camx * p[0] * (960 / roomwidth), 0, sprite_get_width(layer_background_get_sprite(layer_background_get_id(layer_id.lay))) - 960);
			else
				returnx = camx * p[0];
			
			return [returnx, camy - clamp(camy * p[1] * (540 / roomheight), 0, sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_id.lay))) - 540)]; break;
	}
	return [0, 0];
}

var siz = ds_list_size(global.roombgs); // faster this way
for(var i = 0; i < siz; i++)
{
	var l = global.roombgs[|i];
	l.x += l.hsp;
	l.y += l.vsp;
	
	var parallax = layer_get_parallax(l);
	if parallax == undefined
		parallax = [0, 0];
	
	layer_x(l.lay, l.x + parallax[0]);
	layer_y(l.lay, l.y + parallax[1]);
}

layer_x("Assets_BG", _camx * 0.2)
layer_y("Assets_BG", _camy * 0.2)

var ix = _camw / obj_camera.original_cam_width
var iy = _camh / obj_camera.original_cam_height
for (var i = 0; i < array_length(backgrounds); i++)
{
	var n = backgrounds[i]
	var lay_id = layer_background_get_id(layer_get_id(n))
	layer_background_xscale(lay_id, ix)
	layer_background_yscale(lay_id, iy)
}
