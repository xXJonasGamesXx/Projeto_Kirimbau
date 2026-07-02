if (distance_to_object(oIara) <= 15) {
    if (keyboard_check_pressed(ord("E")) && global.dialogo == false) {
        
        InventoryAdd(1); 

        instance_create_depth(x, y, -9999, oPopupGarrafa); 
        
        keyboard_clear(ord("E"));
        instance_destroy(); 
    }
}