depth = -bbox_bottom;

if (distance_to_object(oIara) <= 15) {
    if (keyboard_check_pressed(ord("E")) && global.dialogo == false) {
        
        if (tem_fruta == true) {
            
            InventoryAdd(0); 
            
            var _dialogo = instance_create_depth(x, y, -9999, oDialogo);
            _dialogo.npc_nome = "PegouFruta";
            _dialogo.acao_final = ""; 
            
            frutas_restantes -= 1; 
            
            if (frutas_restantes <= 0) {
                tem_fruta = false;
                sprite_index = sArvoreSemFruta; 
                
                if (meu_id == 1) global.arvore_1_vazia = true;
                if (meu_id == 2) global.arvore_2_vazia = true;
                if (meu_id == 3) global.arvore_3_vazia = true; 
            }
            
            keyboard_clear(ord("E"));
        }
        else {
            var _dialogo = instance_create_depth(x, y, -9999, oDialogo);
            _dialogo.npc_nome = "ArvoreVazia";
            _dialogo.acao_final = ""; 
            
            keyboard_clear(ord("E"));
        }
    }
}