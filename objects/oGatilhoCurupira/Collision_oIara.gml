if (ato_da_cena == 0 && global.dialogo == false) {
    global.dialogo = true;
    ato_da_cena = 1;
    
    inst_curupira = instance_create_depth(150, 40, -9999, oCurupiraLouco);
}