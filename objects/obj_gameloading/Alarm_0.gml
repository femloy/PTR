if array_length(group_arr) > 0
{
	loadtxt = "LOADING TEXTURES...";
	
	var b = array_pop(group_arr);
	var _tex_array = texturegroup_get_textures(b);
	for (var i = 0; i < array_length(_tex_array); i++)
	{
		if !texture_is_ready(_tex_array[i])
			texture_prefetch(_tex_array[i])
	}
	loadsubtitle = b;
	alarm[0] = 1;
}
else
{
	if global.crashed != undefined
	{
		subroutine = 1;
		scr_soundeffect(sfx_pephurt);
	}
	else
		room_goto(Realtitlescreen);
}
