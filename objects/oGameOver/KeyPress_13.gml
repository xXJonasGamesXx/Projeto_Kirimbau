if (opcao_selecionada == 0) {
    // Opção: Continuar (Carrega o Save)
    if (file_exists("savegame.json")) {
        CarregarJogo();
    }
} 
else if (opcao_selecionada == 1) {
    // Opção: Tela Inicial (Volta pro Menu Principal)
    room_goto(Tela_Inicial); 
}