// --- ATO 1: Andar até o destino ---
if (ato_da_cena == 1) {
    if (instance_exists(inst_curupira)) {
        
        // Move o Curupira para baixo
        inst_curupira.y += curupira_velocidade;
        
        // Quando chegar no destino
        if (inst_curupira.y >= curupira_y_destino) {
            inst_curupira.y = curupira_y_destino;
            ato_da_cena = 2; // Agora vai falar
            
            // Abre o diálogo
            var _dialogo = instance_create_depth(x, y, -9999, oDialogo);
            _dialogo.npc_nome = "CurupiraLouco";
            _dialogo.acao_final = "batalha_curupira";
        }
    }
}

// --- ATO 2: Esperar Diálogo para Lutar ---
if (ato_da_cena == 2) {
    // Se o diálogo fechar e a batalha for iniciada
    if (!instance_exists(oDialogo)) {
        // Isso aqui evita que ele fique checando para sempre
        ato_da_cena = 3; 
    }
}