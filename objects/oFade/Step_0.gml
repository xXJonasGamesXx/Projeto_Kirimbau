show_debug_message("Fade rodando! Alpha atual: " + string(alpha));

if (fade_state == 1) {
    alpha += fade_speed;
    if (alpha >= 1) {
        room_goto(targetRoom);
        fade_state = -1;
    }
} else {
    alpha -= fade_speed;
    if (alpha <= 0) {
        instance_destroy();
    }
}