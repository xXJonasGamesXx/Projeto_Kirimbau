if inicializar == false {
	scr_textos();
	inicializar = true;
}

if mouse_check_button_pressed(mb_left) {
	if pagina < ds_grid_height(texto_grid) - 1 {
		pagina++;
	} else {
        // Ações finais baseadas na etiqueta
        if (acao_final == "terminou_conversa_pai") {
            global.falou_com_pai = true;
        }
        else if (acao_final == "ir_para_batalha") {
            room_goto(Combate); // Nome da room de combate
        }
        
		global.dialogo = false;
		instance_destroy();
	}
}