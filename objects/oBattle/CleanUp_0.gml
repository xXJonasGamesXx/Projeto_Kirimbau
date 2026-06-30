// Evento CleanUp
if (variable_instance_exists(id, "pos_vitoria") && pos_vitoria == true) {
    global.dialogo = true;
    var _d = instance_create_depth(0, 0, -9999, oDialogo);
    
    // Como você agora sabe quem era o criador, podemos pegar o nome do diálogo do objeto criado
    // Mas por enquanto, mantemos o Saci:
    _d.npc_nome = "SaciDerrotado"; 
}

// Não esqueça de reativar as camadas de cenário que escondemos!
if (layer_exists("Tiles_1")) {
    layer_set_visible("Tiles_1", true);
}