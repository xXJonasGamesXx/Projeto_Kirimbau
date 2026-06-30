if (ato_da_cena == 0 && global.dialogo == false) {
    global.dialogo = true; // Trava a Iara
    ato_da_cena = 1;       // Passa pro próximo Ato
    
    // Usamos create_depth e forçamos um depth negativo alto para ele não nascer atrás das árvores
    instance_create_depth(134, 40, -9999, oSaciLouco);
}