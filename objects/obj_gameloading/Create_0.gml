ini_open("saveData.ini")

// prepare variables
global.font_small = font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!._1234567890:;?▯|*/',\"()=-+@█%~ÁÉÍÓÚáéíóúÑñ[]<>$™", true, -2)
global.smallnumber_fnt = font_add_sprite_ext(spr_smallnumber, "1234567890-", true, 0)
global.bigfont = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", true, 0)
global.collectfont = font_add_sprite_ext(spr_font_collect, "0123456789", true, 0)
global.combofont = font_add_sprite_ext(spr_font_combo, "0123456789/:", true, 0)
global.combofont2 = font_add_sprite_ext(spr_tv_combobubbletext, "0123456789", true, 0)
global.smallfont = font_add_sprite_ext(spr_smallerfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.:?1234567890", true, 0)
global.wartimerfont1 = font_add_sprite_ext(spr_wartimer_font1, "1234567890", true, 0)
global.wartimerfont2 = font_add_sprite_ext(spr_wartimer_font2, "1234567890", true, 0)

global.option_fullscreen = ini_read_real("Option", "fullscreen", false)
global.option_resolution = ini_read_real("Option", "resolution", 1)
global.option_master_volume = ini_read_real("Option", "master_volume", 1)
global.option_music_volume = ini_read_real("Option", "music_volume", 0.6)
global.option_sfx_volume = ini_read_real("Option", "sfx_volume", 1)
global.option_vibration = ini_read_real("Option", "vibration", true)

set_master_gain(global.option_master_volume)

scr_initinput();
scr_initinput2();

enum gameplay
{
	original,
	remix
}
global.gameplay = gameplay.remix;

loadtxt = "LOADING..."
loadsubtitle = ""
subroutine = 0
fade = 0

ini_close()

// load textures
draw_flush()
group_arr = ["playergroup", "backgroundgroup", "hudgroup", "smallgroup", "baddiegroup", "levelstructuregroup"]
tex_max = array_length(group_arr);
alarm[0] = 20
