if ((!graffiti) && other.state == (84 << 0) && global.graffiticutscene)
{
    other.state = (85 << 0)
    other.sprite_index = other.spr_victory
    other.image_index = 0
    global.factorygraffiti = 1
    graffiti = 1
    quick_ini_write_real(get_savefile_ini(), "cutscene", "factorygraffiti", 1)
}
