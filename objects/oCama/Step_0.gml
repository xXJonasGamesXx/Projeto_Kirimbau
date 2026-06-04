// Verifica se a Iara está perto da cama
if (distance_to_object(oIara) <= 10) {
    
    // Se apertar E e não estiver rolando nenhum outro diálogo
    if (keyboard_check_pressed(ord("E")) and global.dialogo == false) {
        
        // Só deixa dormir se já tiver falado com o pai
        if (global.falou_com_pai == true) {
            global.dialogo = true; // Trava os comandos da Iara
            dormindo = true;
            
            oIara.visible = false; // Faz a personagem principal sumir da tela
            
            sprite_index = sDormindo; // Muda o sprite da cama para ela deitada
            
            // Ativa o Alarme 0 para rodar daqui a 5 segundos
            // (Multiplicar por room_speed garante que sejam segundos independentemente do FPS)
            alarm[0] = 5 * room_speed; 
            
        } else {
            // Se tentar dormir antes da bronca do pai, puxa o texto de aviso
            var _dialogo = instance_create_layer(x, y, "Dialogo", oDialogo);
            _dialogo.npc_nome = "Cama";
        }
    }
}