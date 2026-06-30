if (ato_da_cena == 1) {
    if (instance_exists(oSaciLouco)) {
        
        oSaciLouco.y += saci_velocidade_y; 
        saci_velocidade_y += 0.4;          
        
        if (oSaciLouco.y >= 70) {
            oSaciLouco.y = 70; 
            ato_da_cena = 2;
            
            // Cria o diálogo do susto
            var _dialogo = instance_create_depth(x, y, -9999, oDialogo);
            _dialogo.npc_nome = "SaciLouco";
            _dialogo.acao_final = ""; 
        }
    }
}

if (ato_da_cena == 2) {
    if (!instance_exists(oDialogo)) {
        ato_da_cena = 3; 
        
        if (instance_exists(oSaciLouco)) {
            NewEncounter([global.enemies.Saci], sBatalha, oSaciLouco.id);
        }
        
        instance_destroy();
    }
}