dormindo = false;

if (!variable_global_exists("falou_com_pai")) {
    global.falou_com_pai = false;
}

animacao_rolando = false;

if (room == rm_Quarto && global.acordou_quarto == false) {
    sprite_index = sSustoCama;
    image_index = 0;
    animacao_rolando = true;
    
    if (instance_exists(oIara)) oIara.visible = false; 
}
else if (room == rm_floresta1 && global.acordou_floresta == false) {
    sprite_index = sSustoCama;
    image_index = 0;
    animacao_rolando = true;
    
    if (instance_exists(oIara)) oIara.visible = false; 
}