var _cx = camera_get_view_x(view_camera[0]);
var _cy = camera_get_view_y(view_camera[0]);

draw_set_alpha(alpha);
draw_set_color(c_black);

draw_rectangle(_cx - 500, _cy - 500, _cx + 2000, _cy + 2000, false);

draw_set_alpha(1.0);
draw_set_color(c_white);