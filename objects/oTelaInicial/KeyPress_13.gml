if (index == 0) {
    // OPÇÃO 0: JOGAR (NOVO JOGO)
    // Reseta o load caso o jogador tenha morrido e tentado um jogo novo
    global.load_x = -1;
    global.load_y = -1;
    room_goto(rm_Quarto); // Vai para a primeira sala do jogo
} 
else if (index == 1) {
    // OPÇÃO 1: CARREGAR JOGO
    if (file_exists("savegame.json")) {
        CarregarJogo();
    } else {
        // Faz alguma coisa se não tiver save, tipo tocar um som de erro
        // show_debug_message("Nenhum save encontrado!");
    }
}
else if (index == 2) {
    // OPÇÃO 2: (Se você tiver um botão de "Opções" ou "Créditos" no meio, o código vem aqui)
}
else if (index == 3) {
    // OPÇÃO 3: SAIR DO JOGO
    game_end();
}