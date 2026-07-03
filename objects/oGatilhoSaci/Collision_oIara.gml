if (ato_da_cena == 0 && global.dialogo == false) {
    global.dialogo = true; 
    ato_da_cena = 1;      
    
    instance_create_depth(134, 40, -9999, oSaciLouco);
}