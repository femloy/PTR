if (grounded && other.sprite_index == spr_swordstone && (state == (42 << 0) or state == (80 << 0) or state == (43 << 0)))
{
    transformationlives = 3
    scr_soundeffect(sfx_knightsword)
    global.SAGEknighttaken = 1
    momentum = 0
    movespeed = 0
    other.image_index = 1
    image_index = 0
    image_speed = 0.35
    sprite_index = spr_knightpepstart
    state = (47 << 0)
    hsp = 0
    vsp = 0
    tv_push_prompt_once(tv_create_prompt("This is the knight transformation text", (2 << 0), 596, 3), "knight")
}
