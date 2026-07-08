if (place_meeting(x, y, oIara) && global.dialogo == false) {
    
    global.dialogo = true;
    
    var _dialogo = instance_create_depth(0, 0, -9999, oDialogo);
    _dialogo.npc_nome = "Cuca_Inicio";
    _dialogo.acao_final = "batalha_cuca";
    
    instance_destroy();
}