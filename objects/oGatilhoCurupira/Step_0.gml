if (ato_da_cena == 1) {
    if (instance_exists(inst_curupira)) {
        
        inst_curupira.y += curupira_velocidade;
        
        if (inst_curupira.y >= curupira_y_destino) {
            inst_curupira.y = curupira_y_destino;
            ato_da_cena = 2; 
            
            var _dialogo = instance_create_depth(x, y, -9999, oDialogo);
            _dialogo.npc_nome = "CurupiraLouco";
            _dialogo.acao_final = "batalha_curupira";
        }
    }
}

if (ato_da_cena == 2) {
    if (!instance_exists(oDialogo)) {
        ato_da_cena = 3; 
    }
}