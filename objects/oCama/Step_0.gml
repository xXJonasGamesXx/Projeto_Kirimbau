depth = -bbox_bottom;

if (distance_to_object(oIara) <= 15) {
    if (keyboard_check_pressed(ord("E")) && global.dialogo == false) {
        
        // Só interage se não estiver no meio do susto
        if (animacao_rolando == false) {
            
            var _dialogo = instance_create_depth(x, y, -9999, oDialogo);
            _dialogo.npc_nome = "Cama";
            
            global.dialogo = true; 
            keyboard_clear(ord("E")); 
        }
    }
}