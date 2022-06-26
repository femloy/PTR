if (obj_player1.character == "P" && obj_player1.spotlight == 1 && obj_player1.ispeppino)
    sprite_index = choose(1555, 1556, 1558, 2227, 2584)
if ((obj_player1.character == "N" or (!obj_player1.ispeppino)) && obj_player1.spotlight == 1)
    sprite_index = choose(1554, 1553, 1552)
image_speed = 0.35
if (obj_player.character == "S")
    sprite_index = spr_snickcollectible2
depth = 11
