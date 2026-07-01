if (global.load_x != -1 && global.load_y != -1) {
    
    if (!instance_exists(oIara)) {
        instance_create_depth(global.load_x, global.load_y, 0, oIara);
    } 
    else {
        oIara.x = global.load_x;
        oIara.y = global.load_y;
    }
    
    global.load_x = -1;
    global.load_y = -1;
}

var _id_camada = layer_get_id("Tiles_Frente"); 

if (_id_camada != -1) {
    layer_depth(_id_camada, -9999);
}