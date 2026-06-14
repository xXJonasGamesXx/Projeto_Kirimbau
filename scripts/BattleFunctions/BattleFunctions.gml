function NewEncounter(_enemies, _bg) {
    // Desativa o resto do jogo
    instance_deactivate_all(true); 
    
    // Pega a posição da câmera para criar a batalha na tela certa
    var _camX = camera_get_view_x(view_camera[0]);
    var _camY = camera_get_view_y(view_camera[0]);
    
    // Cria o objeto oBattle passando a array para dentro da Struct
    instance_create_depth(_camX, _camY, -9999, oBattle, {
        enemies: _enemies,
        creator: id,
        battleBackground: _bg
    });
}