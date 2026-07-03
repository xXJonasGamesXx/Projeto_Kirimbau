var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

var _x = _gui_w / 2;
var _y = _gui_h / 2;

var _escala = (_gui_w * 0.70) / sprite_get_width(sBatalha);

draw_sprite_ext(sBatalha, 0, _x, _y, _escala, _escala, 0, c_white, 1);