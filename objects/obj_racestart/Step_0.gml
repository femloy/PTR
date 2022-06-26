start_index += 0.35
if (sprite == spr_horsey_start2 && floor(start_index) == (sprite_get_number(sprite) - 1))
    sprite = 1368
if (start_index > (sprite_get_number(sprite) - 1))
    start_index = frac(start_index)
