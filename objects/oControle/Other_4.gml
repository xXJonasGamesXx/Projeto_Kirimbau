// Se o jogo acabou de ser carregado (variáveis diferentes de -1)
if (global.load_x != -1 && global.load_y != -1) {
    
    // Checa se a Iara não existe na sala e cria ela
    if (!instance_exists(oIara)) {
        instance_create_depth(global.load_x, global.load_y, 0, oIara);
    } 
    // Se ela já existir, só coloca ela na posição certa
    else {
        oIara.x = global.load_x;
        oIara.y = global.load_y;
    }
    
    // Reseta o load para não ficar teleportando ela toda vez que trocar de sala
    global.load_x = -1;
    global.load_y = -1;
}