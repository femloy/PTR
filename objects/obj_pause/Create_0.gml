pause = 0
var i = 0
color = make_color_rgb(121, 103, 151)
selected = 0
stickpressed = 0
image_speed = 0
depth = -998

pause_menu = ["RESUME", "OPTIONS", "RESTART LEVEL", "EXIT LEVEL"]
cursor_index = 0
cursor_sprite_number = sprite_get_number(spr_cursor)
cursor_sprite_height = sprite_get_height(spr_cursor)

peppino_sprite = spr_player_idle
peppino_sprite_number = sprite_get_number(peppino_sprite)
peppino_index = 0

paletteselect = 0
spr_palette = spr_peppalette
character = "P"

toppin_sprite = [spr_toppincheese, spr_toppinpineapple, spr_toppinsausage, spr_toppinshroom, spr_toppintomato];
for (i = 0; i < array_length(toppin_sprite); i++)
{
	toppin_number[i] = sprite_get_number(toppin_sprite[i])
	toppin_index[i] = 0
	toppin_has[i] = false
}

pausebg_surf = noone;
pausebg_surf2 = noone;
pausebg_pos = 0;
pausebg_col = make_colour_hsv((257 / 360) * 255, (39 / 100) * 255, (23 / 100) * 255);
