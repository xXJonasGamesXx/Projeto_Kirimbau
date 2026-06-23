// Se o jogador apertar a tecla de ação enquanto encosta no checkpoint
if (keyboard_check_pressed(ord("E"))) { // Troque "Z" pela tecla de interação do seu jogo
    SalvarJogo();
    
    // Opcional: Criar aquele seu texto flutuante para avisar o jogador!
    instance_create_depth(x, y - 32, depth - 10, oBattleFloatingText, {
        font: fnt_dialogo, 
        col: c_yellow, 
        text: "Jogo Salvo!"
    });
}