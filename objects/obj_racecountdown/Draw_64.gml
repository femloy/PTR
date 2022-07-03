draw_set_font(global.bigfont);
draw_set_colour(c_white);
draw_set_align(fa_center, fa_middle);
var siz = lerp(3, 1, countdown / 3);
draw_text_transformed(960 / 2 + random_range(-siz, siz), 540 / 2 + random_range(-siz, siz), countdown == 0 ? "GO!" : countdown, siz, siz, 0);
draw_set_align();
