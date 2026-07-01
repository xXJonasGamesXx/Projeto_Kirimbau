if (global.curupira_derrotado == true) {
    // 1. Destrói o gatilho da cutscene para não travar o jogador
    if (instance_exists(oGatilhoCurupira)) {
        instance_destroy(oGatilhoCurupira);
    }
    
    // 2. Destrói a si mesmo (ele não spawna a versão boazinha, apenas some)
    instance_destroy();
    exit; 
}