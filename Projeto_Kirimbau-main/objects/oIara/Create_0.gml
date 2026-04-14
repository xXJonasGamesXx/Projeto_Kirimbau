window_set_size(1280,720);

x=150
y=100

x = global.spawn_x;
y = global.spawn_y;
if (!variable_global_exists("spawn_x")) {
    global.spawn_x = 150;
    global.spawn_y = 100;
}

x = global.spawn_x;
y = global.spawn_y;