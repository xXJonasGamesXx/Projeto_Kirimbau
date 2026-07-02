if (distance_to_object(oIara) <= 15) {
    if (keyboard_check_pressed(ord("E")) && global.dialogo == false) {
        if (frutas_restantes > 0) {
            
            InventoryAdd(0); 
            frutas_restantes -= 1;
            
            var _dialogo = instance_create_depth(x, y, -9999, oDialogo);
            _dialogo.npc_nome = "PegouFruta"; 
        } else {
            var _dialogo = instance_create_depth(x, y, -9999, oDialogo);
            _dialogo.npc_nome = "ArvoreVazia"; 
        }
        global.dialogo = true;
        keyboard_clear(ord("E"));
    }
}