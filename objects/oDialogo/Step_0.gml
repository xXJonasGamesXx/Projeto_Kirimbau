if inicializar == false {
	scr_textos();
	inicializar = true;
}

if (keyboard_check_pressed(ord("E"))) {
    if pagina < ds_grid_height(texto_grid) - 1 {
        pagina++;
    } else {
        if (acao_final == "terminou_conversa_pai") {
            global.falou_com_pai = true; 
        } 
        else if (acao_final == "fim_da_batalha") {
            
            if (instance_exists(oBattleUnitPc)) {
                global.party[0].hp = oBattleUnitPc.hp;
            }
            
            with (oBattle) {
                instance_destroy(oBattleUnitPc);
                instance_destroy(oBattleUnitEnemy);
                instance_destroy();
            }
            
            acao_final = "";
        } else if (acao_final == "batalha_curupira") {
            var _curupira = instance_find(oCurupiraLouco, 0); 
            
            if (_curupira != noone) {
                var _acoes_iara = [global.actionLibrary.defend]; 
                
                if (InventorySearch(0) != -1) array_push(_acoes_iara, global.actionLibrary.usar_fruta);
                if (InventorySearch(1) != -1) array_push(_acoes_iara, global.actionLibrary.usar_garrafa);
                if (InventorySearch(2) != -1) array_push(_acoes_iara, global.actionLibrary.usar_cipo);
                
                global.party[0].actions = _acoes_iara;
                
                NewEncounter([global.enemies.Curupira], sBatalha, _curupira.id);
            }
            
            acao_final = ""; 
            
        } else if (acao_final == "ganhar_cipo") {
            if (InventorySearch(2) == -1) {
                InventoryAdd(2); 
            }
        }
        
        else if (acao_final == "ir_dormir_floresta") {
            
            // Ativa a animação e o alarme na cama!
            if (instance_exists(oCama)) {
                oCama.dormindo = true;
                oCama.sprite_index = sDormindo;
                oCama.alarm[0] = 5 * 60; 
                
                if (instance_exists(oIara)) {
                    oIara.visible = false;
                }
            }
            
            acao_final = ""; 
        }
        
        global.dialogo = false; 
        keyboard_clear(ord("E")); 
        instance_destroy(); 
    }
}