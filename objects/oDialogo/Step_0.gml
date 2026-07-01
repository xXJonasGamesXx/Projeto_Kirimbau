if inicializar == false {
	scr_textos();
	inicializar = true;
}

if (keyboard_check_pressed(ord("E"))) {
    if pagina < ds_grid_height(texto_grid) - 1 {
        pagina++;
    } else {
        // Ações finais baseadas na etiqueta
        if (acao_final == "terminou_conversa_pai") {
            global.falou_com_pai = true;
        }else if (acao_final == "fim_da_batalha") {
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
}
        
		global.dialogo = false; 
        
        keyboard_clear(ord("E")); 
        
        instance_destroy(); 
    }
}