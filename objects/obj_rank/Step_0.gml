if floor(image_index) == image_number - 1
	image_speed = 0

var p = obj_player1;
if global.collectN > global.collect
	p = obj_player2;

if p.character == "P" && p.ispeppino
{
	if (global.rank == "s")
		sprite_index = spr_rankS
	if (global.rank == "a")
		sprite_index = spr_rankA
	if (global.rank == "b")
		sprite_index = spr_rankB
	if (global.rank == "c")
		sprite_index = spr_rankC
	if (global.rank == "d" or global.rank == "eggplant")
		sprite_index = spr_rankD
	if (global.rank == "p")
		sprite_index = spr_rankP
}
else
{
	if (global.rank == "s")
		sprite_index = spr_rankNS
	if (global.rank == "a")
		sprite_index = spr_rankNA
	if (global.rank == "b")
		sprite_index = spr_rankNB
	if (global.rank == "c")
		sprite_index = spr_rankNC
	if (global.rank == "d" or global.rank == "eggplant")
		sprite_index = spr_rankND
	if (global.rank == "p")
		sprite_index = spr_rankP
}

if instance_exists(obj_treasureviewer)
	visible = false;
with obj_player
	visible = false;
