if (variable_global_exists("fim_de_jogo_ativado") && global.fim_de_jogo_ativado == true) {
    FadeToRoom(rm_Creditos, 60, c_black);
} else {
    FadeToRoom(rm_floresta1, 60, c_black);
}
global.dialogo = false;