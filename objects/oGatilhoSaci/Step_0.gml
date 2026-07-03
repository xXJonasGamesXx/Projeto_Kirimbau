if (ato_da_cena == 1) {
    if (instance_exists(oSaciLouco)) {
        
        oSaciLouco.y += saci_velocidade_y; 
        saci_velocidade_y += 0.4;          
        
        if (oSaciLouco.y >= 70) {
            oSaciLouco.y = 70; 
            ato_da_cena = 2;
            
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
            
            var _acoes_iara = [global.actionLibrary.defend]; 
            
            if (InventorySearch(0) != -1) array_push(_acoes_iara, global.actionLibrary.usar_fruta);
            if (InventorySearch(1) != -1) array_push(_acoes_iara, global.actionLibrary.usar_garrafa);
            if (InventorySearch(2) != -1) array_push(_acoes_iara, global.actionLibrary.usar_cipo);
            
            global.party[0].actions = _acoes_iara;
            
            NewEncounter([global.enemies.Saci], sBatalha, oSaciLouco.id);
        }
        
        instance_destroy();
    }
}