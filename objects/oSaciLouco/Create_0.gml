if (global.saci_derrotado == true) {
    // 1. Destrói o gatilho da cutscene
    if (instance_exists(oGatilhoSaci)) { // Confirme o nome do seu gatilho do saci
        instance_destroy(oGatilhoSaci);
    }
    
    // 2. Destrói a si mesmo
    instance_destroy();
    exit; 
}