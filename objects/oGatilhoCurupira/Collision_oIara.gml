if (ato_da_cena == 0 && global.dialogo == false) {
    global.dialogo = true;
    ato_da_cena = 1;
    audio_play_sound(snd_fogo, 1, false);
    inst_curupira = instance_create_depth(150, 40, -9999, oCurupiraLouco);
}