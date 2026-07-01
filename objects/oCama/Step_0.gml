if (distance_to_object(oIara) <= 10) {
    
    if (keyboard_check_pressed(ord("E")) and global.dialogo == false) {
        
        if (global.falou_com_pai == true) {
            global.dialogo = true; 
            dormindo = true;
            
            oIara.visible = false; 
            
            sprite_index = sDormindo; 
            
            alarm[0] = 5 * room_speed; 
            
        } else {
            var _dialogo = instance_create_layer(x, y, "Dialogo", oDialogo);
            _dialogo.npc_nome = "Cama";
        }
    }
}