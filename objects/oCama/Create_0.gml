dormindo = false;

// Trava de segurança: Se o jogo começou direto aqui e a variável 
// não existe, a cama cria ela para evitar o erro!
if (!variable_global_exists("falou_com_pai")) {
    global.falou_com_pai = false;
}