if (fase == 0) {
    alpha += vel;

    if (alpha >= 1) {
        room_goto(proxima_room);
        fase = 1;
    }
}
else if (fase == 1) {
    alpha -= vel;

    if (alpha <= 0) {
        instance_destroy();
    }
}