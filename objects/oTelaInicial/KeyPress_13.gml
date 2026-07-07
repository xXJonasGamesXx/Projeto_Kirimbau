if (index == 0) {
    global.load_x = -1;
    global.load_y = -1;
    resetar_jogo_todo();
    
    FadeToRoom(rm_Quarto, 60, c_black);
}
else if (index == 1) {
    if (file_exists("savegame.json")) {
        CarregarJogo();
    } else {
    }
}
else if (index == 2) {
    room_goto(rm_Botoes);
}
else if (index == 3) {
    game_end();
}