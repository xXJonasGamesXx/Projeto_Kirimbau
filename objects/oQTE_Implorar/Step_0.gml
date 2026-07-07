if (concluido == false) {
    tempo--;

    if (keyboard_check_pressed(tecla_alvo)) {
        concluido = true;
        global.acertos_cuca += 1;

        if (global.acertos_cuca >= 5) {
            var _inimigo = instance_nearest(x, y, oBattleUnitEnemy);
            if (_inimigo != noone) {
                _inimigo.hp = 0; 
            }
        } else {
            var _diag = instance_create_depth(0, 0, -9999, oDialogo);
            _diag.npc_nome = "Cuca_Acerto_" + string(global.acertos_cuca);
        }
        
        instance_destroy(); 
    }
    else if (keyboard_check_pressed(vk_anykey) || tempo <= 0) {
        concluido = true;
        instance_destroy();
    }
}
