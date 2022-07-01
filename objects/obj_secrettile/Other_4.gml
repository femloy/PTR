depth = -8;

var mylayers = ["Tiles_Secret1", "Tiles_Secret2", "Tiles_Secret3", "Tiles_Secret4"];
if place_meeting(x, y, obj_player)
{
	alpha = 0;
	done = true;
	depth = 90;
}
else if oneway
{
	with instance_create(x, y, obj_solid)
	{
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
	}
	done = true;
	depth = 90;
}

tiles = [];
for(var i = 0; i < array_length(mylayers); i++)
{
	var mylayer = mylayers[i];
	if layer_exists(mylayer)
	{
		var map_id = layer_tilemap_get_id(mylayer);
		if map_id != -1
		{
			var ts = tilemap_get_tileset(map_id), tilew = tilemap_get_tile_width(map_id), tileh = tilemap_get_tile_height(map_id);
			for (var xx = x; xx < x + sprite_width; xx += tilew)
			{
			    for (var yy = y; yy < y + sprite_height; yy += tileh)
			    {
			        var data = tilemap_get_at_pixel(map_id, xx, yy)
			        array_push(tiles, [ts, data, xx, yy])
					
			        data = tile_set_empty(data);
			        tilemap_set_at_pixel(map_id, data, xx, yy);
			    }
			}
		}
	}
}
