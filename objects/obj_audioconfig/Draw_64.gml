if live_call() return live_result;

instance_activate_object(obj_gmlive);

var m1y = 120, m2y = m1y + 100, m3y = m2y + 100;
draw_set_font(global.bigfont)
draw_set_align(fa_left, fa_top)
draw_set_color(c_white)

var _os = audio_select
draw_text_colour(32, 32, "BACK", c_white, c_white, c_white, c_white, _os == -1 ? 1 : 0.5)

draw_set_halign(fa_center)
draw_text_colour(960 / 2, m1y, "MASTER", c_white, c_white, c_white, c_white, _os == 0 ? 1 : 0.5)
draw_text_colour(960 / 2, m2y, "MUSIC", c_white, c_white, c_white, c_white, _os == 1 ? 1 : 0.5)
draw_text_colour(960 / 2, m3y, "SFX", c_white, c_white, c_white, c_white, _os == 2 ? 1 : 0.5)

draw_healthbar(230, m1y + 50, 730, m1y + 50 + 16, audiosaved_master, c_gray, c_white, c_white, 0, true, true);
draw_healthbar(230, m2y + 50, 730, m2y + 50 + 16, audiosaved_music, c_gray, c_white, c_white, 0, true, true);
draw_healthbar(230, m3y + 50, 730, m3y + 50 + 16, audiosaved_sfx, c_gray, c_white, c_white, 0, true, true);

draw_set_font(global.smallfont);
draw_set_align()
draw_text(730 + 16, m1y + 50, audiosaved_master);
draw_text(730 + 16, m2y + 50, audiosaved_music);
draw_text(730 + 16, m3y + 50, audiosaved_sfx);
