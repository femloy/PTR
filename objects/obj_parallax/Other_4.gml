ds_list_clear(global.roombgs);

var layers = layer_get_all();
var has_tiles = false;

for (var i = 0; i < array_length(layers); i++)
{
	var layery = 0;
	if !has_tiles && layer_get_visible(layers[i]) && layer_tilemap_get_id(layers[i]) != -1
		has_tiles = true;
	
	// layer depths
	var layername = layer_get_name(layers[i]);
	if string_startswith(layername, "Tiles_Foreground")
	{
		var tilesuffix = string_replace(layername, "Tiles_Foreground", "");
		if string_is_number(tilesuffix)
			layer_depth(layers[i], -29 - real(tilesuffix));
	}
	else if string_startswith(layername, "Tiles_BG")
	{
		var tilesuffix = string_replace(layername, "Tiles_BG", "");
		if string_is_number(tilesuffix)
			layer_depth(layers[i], 201 - real(tilesuffix));
		else
			layer_depth(layers[i], 200);
	}
	else if string_startswith(layername, "Tiles_")
	{
		var tilesuffix = string_replace(layername, "Tiles_", "");
		if string_is_number(tilesuffix)
			layer_depth(layers[i], 101 - real(tilesuffix));
	}
	if layername == "Assets_FG"
		layer_depth(layers[i], 89);
	if layername == "Assets_BG"
		layer_depth(layers[i], 201);
	
	if layername == "Foreground_Ground1"
	{
		layer_depth(layers[i], -250);
		layery = room_height - sprite_get_height(layer_background_get_sprite(layer_background_get_id(layers[i])));
	}
	if layername == "Backgrounds_Ground1"
		layer_depth(layers[i], 250);
	
	if string_startswith(layername, "Tiles_") && global.hidetiles
		layer_set_visible(layers[i], false);
	
	// add to room bgs
	var lbg = layer_background_get_id(layers[i]);
	if lbg != -1
	{
		ds_list_add(global.roombgs, {
			lay : layers[i],
			bg : lbg,
			x : layer_get_x(layers[i]),
			y : layer_get_y(layers[i]) + layery,
			hsp : layer_get_hspeed(layers[i]),
			vsp : layer_get_vspeed(layers[i]),
		});
	}
}

// show invisible objects if the room is unfinished
if !has_tiles
{
	with obj_solid
		visible = true;
	with obj_platform
		visible = true;
	with obj_slope
		visible = true;
	with obj_secretblock
		visible = true;
	with obj_secretbigblock
		visible = true;
	with obj_secretmetalblock
		visible = true;
}
