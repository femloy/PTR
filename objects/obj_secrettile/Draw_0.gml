/// @description draw the tiles
if live_call() return live_result;

draw_set_alpha(alpha);
for(var i = 0; i < array_length(tiles); i++)
{
	var t = tiles[i];
	draw_tile(t[0], t[1], 0, t[2], t[3]);
}
draw_set_alpha(1);
