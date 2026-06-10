var _guiW = display_get_gui_width();
var _guiH = display_get_gui_height();

draw_set_alpha(alpha);
draw_set_colour(colour);

draw_rectangle(0, 0, _guiW, _guiH, 0);

draw_set_alpha(1);
draw_set_colour(c_black);