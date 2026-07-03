if (animacao_rolando == true) {
    animacao_rolando = false;
    
    sprite_index = sCama; 

    if (instance_exists(oIara)) {
        oIara.visible = true;
        
        if (room == rm_Quarto) {
            oIara.x = 96;
            oIara.y = 80;
        } 
        else if (room == rm_floresta1) {
            oIara.x = 87; 
            oIara.y = 87;
        }
    }

    var _dialogo = instance_create_depth(x, y, -9999, oDialogo);
    
    if (room == rm_Quarto) {
        _dialogo.npc_nome = "SustoQuarto";
        global.acordou_quarto = true;
    } 
    else if (room == rm_floresta1) {
        _dialogo.npc_nome = "SustoFloresta";
        global.acordou_floresta = true;
    }
}