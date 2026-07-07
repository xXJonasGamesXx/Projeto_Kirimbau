depth = -bbox_bottom;

if (distance_to_object(oIara) <= 15) {
    if (keyboard_check_pressed(ord("E")) && global.dialogo == false) {
        
        if (animacao_rolando == false) {
            var _dialogo = instance_create_depth(x, y, -9999, oDialogo);
            
            // Checa a sala para puxar o texto certo!
            if (room == rm_CavernaCuca) {
                _dialogo.npc_nome = "CamaFim"; 
            } else {
                _dialogo.npc_nome = "Cama";
            }
            
            global.dialogo = true; 
            keyboard_clear(ord("E")); 
        }
    }
}