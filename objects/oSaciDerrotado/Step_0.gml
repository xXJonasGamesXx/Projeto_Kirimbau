var _distancia = point_distance(x, y, oIara.x, oIara.y);

if (_distancia < 30 && keyboard_check_pressed(ord("E")) && global.dialogo == false) {
    global.dialogo = true;
    var _d = instance_create_depth(0, 0, -9999, oDialogo);
    _d.npc_nome = "SaciDerrotado";
}

if (estado_fade == 1) {
    image_alpha -= 0.05; 
    
    if (image_alpha <= 0) {
        sprite_index = sSaciDerrotado; 
        estado_fade = 2; 
    }
} 
else if (estado_fade == 2) {
    image_alpha += 0.05; 
    
    if (image_alpha >= 1) {
        estado_fade = 0;
    }
}