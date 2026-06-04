if (keyboard_check_pressed(ord("E")) and global.dialogo == false) {
    var _dialogo = instance_create_depth(x, y, -9999, oDialogo);
    _dialogo.npc_nome = "Pai";
    _dialogo.acao_final = "terminou_conversa_pai"; // Essa linha é obrigatória!
}