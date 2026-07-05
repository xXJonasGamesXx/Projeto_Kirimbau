var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();
var _xx = _gui_w / 2;
var _yy = _gui_h / 2;

draw_set_alpha(0.7);
draw_rectangle_color(0, 0, _gui_w, _gui_h, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1.0);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_dialogo);
draw_set_color(c_white);

draw_text(_xx, _yy - 50, "PRESSIONE RÁPIDO!");

draw_text_transformed(_xx, _yy, letra_texto, 3, 3, 0);

var _largura = 200;
var _atual = (_largura / tempo_max) * tempo;
draw_rectangle_color(_xx - 100, _yy + 50, _xx - 100 + _atual, _yy + 70, c_green, c_green, c_green, c_green, false);

draw_set_halign(fa_left);
draw_set_valign(fa_top);