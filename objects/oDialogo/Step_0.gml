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
            show_debug_message("A VARIAVEL DO PAI AGORA É TRUE!"); 
        } 
        else if (acao_final == "fim_da_batalha") {
    with (oBattle) {
        instance_destroy(oBattleUnitPc);
        instance_destroy(oBattleUnitEnemy);
        instance_destroy();
    }
}else if (acao_final == "batalha_curupira") {
    var _curupira = instance_find(oCurupiraLouco, 0); 
    
    if (_curupira != noone) {
        NewEncounter([global.enemies.Curupira], sBatalha, _curupira.id);
    }
    
    acao_final = ""; 
}else if (acao_final == "ganhar_cipo") {
    if (InventorySearch(oInventory, 2) == -1) {
        InventoryAdd(oInventory, 2); 
    }
}
        
        global.dialogo = false; 
        keyboard_clear(ord("E")); 
        instance_destroy(); 
    }
}