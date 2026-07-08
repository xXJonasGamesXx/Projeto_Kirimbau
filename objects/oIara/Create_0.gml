velh = 0;
velv = 0;
max_vel = 1;

global.dialogo = false;

if (global.check_y != 0)
{
x = global.check_x;
y = global.check_y;
}

if (instance_number(object_index) > 1) {
    instance_destroy();
    exit;
}

camera_set_view_target(view_camera[0], id);

