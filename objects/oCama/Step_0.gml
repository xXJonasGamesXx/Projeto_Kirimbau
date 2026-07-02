// Usa distance_to_object, mas aumenta um pouco a margem para garantir que vai pegar
if (distance_to_object(oIara) <= 15) {
    
    if (keyboard_check_pressed(ord("E")) && global.dialogo == false) {
        
        // ISSO VAI AVISAR NO CONSOLE SE A CAMA PERCEBEU O CLIQUE
        show_debug_message("Apertei E na cama! Valor do pai: " + string(global.falou_com_pai));
        
        if (global.falou_com_pai == true) {
            global.dialogo = true; 
            dormindo = true;
            
            oIara.visible = false; 
            sprite_index = sDormindo; 
            
            // Usa 60 FPS direto para garantir que o tempo não dê conflito
            alarm[0] = 5 * 60; 
            
            keyboard_clear(ord("E")); 
            
        } else {
            // Usa DEPTH no lugar de Layer para evitar crashes fatais
            var _dialogo = instance_create_depth(x, y, -9999, oDialogo);
            _dialogo.npc_nome = "Cama";
            
            global.dialogo = true; 
            keyboard_clear(ord("E")); 
        }
    }
}