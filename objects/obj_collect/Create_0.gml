if (room == rm_editor)
    exit;
with (other)
{
    if (obj_player1.character == "P" && obj_player1.spotlight == 1 && obj_player1.ispeppino)
        sprite_index = choose(1559, 1561, 1562, 1563, 1560)
    if ((obj_player1.character == "N" or (!obj_player1.ispeppino)) && obj_player1.spotlight == 1)
        sprite_index = choose(2080, 2082, 2086, 2087, 2088)
    image_speed = 0.35
    global.collected = 0
    global.collectsound = 0
}
if (obj_player.character == "S")
    sprite_index = spr_snickcollectible1
depth = 11
gotowardsplayer = 0
movespeed = 5
