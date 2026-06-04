// Evento Create da oCama
dormindo = false;

// Garante que a variável existe mesmo se o jogo começar direto no quarto
if (!variable_global_exists("falou_com_pai")) {
    global.falou_com_pai = false;
}